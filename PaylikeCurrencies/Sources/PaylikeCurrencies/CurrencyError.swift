import Foundation

public enum CurrencyError : Error {
    case missing(currencyCode: String)
}
