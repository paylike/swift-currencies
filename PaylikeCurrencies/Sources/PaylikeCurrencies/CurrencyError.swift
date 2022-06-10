import Foundation

public enum CurrencyError : Error {
    case missingCode(code: String)
    case missingNumeric(numeric: Int)
}
