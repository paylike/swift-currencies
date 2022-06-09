import Foundation

/**
    Describes a single currency supported by the Paylike ecosystem
 */
struct PaylikeCurrency {
    let code: String;
    let currency: String;
    let numeric: Int;
    let exponent: Int;
    let funding: Bool;
    let deprecated: Bool;
}
