import Foundation
/*
 Main class handling the access to currencies supported by the Paylike ecosystem
 */
public struct PaylikeCurrencies {
    /**
     Returns a currency code based on the received string, throws an error if not found
     */
    static public func getCurrencyCode(code: String) throws -> CurrencyCode
    {
        guard let currency = PaylikeCurrencyCollection.currencies.first(where: { $0.value.code == code.uppercased() }) else {
            throw CurrencyError.missingCode(code: code)
        }
        return currency.key
    }
    
    /**
     Returns the currency if found by numeric value, otherwise throws an error
     */
    static public func byNumeric(numeric: Int) throws -> PaylikeCurrency
    {
        guard let currency = PaylikeCurrencyCollection.currencies.first(where: { $0.value.numeric == numeric }) else {
            throw CurrencyError.missingNumeric(numeric: numeric)
        }
        return currency.value
    }
    
    /**
     Returns a currency based on the received `CurrencyCode`
     */
    static public func byCode(code: CurrencyCode) -> PaylikeCurrency
    {
        return PaylikeCurrencyCollection.currencies[code].unsafelyUnwrapped
    }
    
    /**
     Returns all supported currencies in an array
     */
    static public func list() -> [PaylikeCurrency]
    {
        return PaylikeCurrencyCollection.currencies.values.map { $0 }
    }
    
    /**
     Converts a major value for a given currency to minor (e.g. 1.25 USD = 125 USD Cents)
     */
    static public func toMinor(code: CurrencyCode, major: Decimal) -> Decimal {
        var value = (major * pow(10, byCode(code: code).exponent))
        var rounded = Decimal()
        NSDecimalRound(&rounded, &value, 2, .plain)
        return rounded
    }
    
    /**
     Converts a minor value for a given currency to major (e.g. 125 USD Cents = 1.25 USD)
     */
    static public func toMajor(code: CurrencyCode, minor: Decimal) -> Decimal {
        return minor / pow(10, byCode(code: code).exponent)
    }
}
