import fs from "fs";
import fetch from "node-fetch";
const generationPath = "PaylikeCurrencies/Sources/PaylikeCurrencies/";
const input =
  "https://raw.githubusercontent.com/paylike/currencies/master/currencies.json";
const outputCodes = "CurrencyCode.swift";
const outputCollection = "PaylikeCurrencyCollection.swift";

const initialGeneratedText = "// GENERATED CODE - DO NOT MODIFY BY HAND";

async function main() {
  const res = await fetch(input);
  const currencies = await res.json();
  const codes = currencies.map(({ code }) => code);
  fs.writeFileSync(
    generationPath + outputCodes,
    `
${initialGeneratedText}

import Foundation

/**
    Describes all available currency codes
 */
public enum CurrencyCode {
    ${codes.map((c) => `case ${c}`).join("\n    ")}
}
`
  );

  fs.writeFileSync(
    generationPath + outputCollection,
    `
${initialGeneratedText}

import Foundation

/**
    Collects currency descriptors paired to CurrencyCode enum
*/
public struct PaylikeCurrencyCollection {
    static let currencies: [CurrencyCode: PaylikeCurrency] = 
    [
      ${currencies.map(c => `CurrencyCode.${c.code}: PaylikeCurrency(
            code: "${c.code}", currency: "${c.currency}", numeric: ${c.numeric}, exponent: ${c.exponent},
            funding: ${!!c.funding}, deprecated: ${!!c.deprecated}
        )`).join(",\n      ")}
    ]
}
`
  );
}

main().catch(console.log);
