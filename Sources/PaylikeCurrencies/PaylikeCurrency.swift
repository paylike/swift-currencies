import Foundation

/**
    Describes a single currency supported by the Paylike ecosystem
 */
public struct PaylikeCurrency : Codable {
    /**
        Code of the currency (e.g. EUR)
     */
    public let code: String;
    /**
        Currency name (e.g. Euro)
     */
    public let currency: String;
    /**
        Numeric code of the currency (e.g. 978)
     */
    public let numeric: Int;
    /**
        Exponent of the currency used in converting between minor and major (e.g. 2)
     */
    public let exponent: Int;
    /**
        Indicates if currency can be used as funding currency inside the Paylike ecosystem
     */
    public let funding: Bool;
    /**
        Indicates if the currency is deprecated or not
     */
    public let deprecated: Bool;
}
