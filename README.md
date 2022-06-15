# PaylikeCurrencies

This package is used to provide a handy interfaces for handling internal currencies supported by the Paylike ecosystem

This library is a clone of the [JS version](https://github.com/paylike/currencies)

List of currencies supported by Paylike for transactions and accounts.

Read more:

* https://paylike.io/account/currency
* https://paylike.io/transactions/currencies

## Account currencies

These are the currencies you can use as a base for your account. Also known as
account, settlement and funding currency.

### Global

- EUR (Euro)
- USD (United States dollar)
- GBP (British pound sterling)

### Nordic

- DKK (Danish krone)
- NOK (Norwegian krone)
- SEK (Swedish krona)

### Other EU

- CHF (Swiss franc)
- HUF (Hungarian forint)
- PLN (Polish złoty)
- RON (Romanian leu)
- CZK (Czech koruna)
- BGN (Bulgarian lev)
- HRK (Croatian kuna)

## Install

__SPM__:
```swift
// dependencies: 
.package(url: "git@github.com:paylike/swift-currencies.git", .upToNextMajor(from: "0.4.0")

// target:
.product(name: "PaylikeCurrencies", package: "swift-currencies")
```

__Cocoapods__:
https://cocoapods.org/pods/PaylikeCurrencies
```ruby
pod 'PaylikeCurrencies'
```

## Usage

Within the Paylike ecosystem you should use the `CurrencyCode` enum to refer to a currency.

```swift
let eur = PaylikeCurrencies.byCode(code: CurrencyCode.EUR);

// lookup by code
PaylikeCurrencies.byCode(code: CurrencyCode.AED);
// { code: 'AED', currency: 'United Arab Emirates dirham', numeric: '784' }

// lookup CurrencyCode
PaylikeCurrencies.getCurrencyCode("EUR");
// CurrencyCode.EUR

// get List<PaylikeCurrency>
PaylikeCurrencies.list();

// Convert between minor and major respecting the exponent
PaylikeCurrencies.toMinor(CurrencyCode.DKK, 100.00);
// 10000

PaylikeCurrencies.toMajor(CurrencyCode.DKK, 10000);
// 100.00
```

# Running code generation

The library is able to regenerate `CurrencyCode` and `PaylikeCurrencyCollection`, by using the small Node.JS script provided in `tools` directory.

To regenerate files run:
```
yarn && yarn start
```
