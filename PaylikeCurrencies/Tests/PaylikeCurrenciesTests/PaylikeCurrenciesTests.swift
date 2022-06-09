import XCTest
@testable import PaylikeCurrencies

final class PaylikeCurrenciesTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(PaylikeCurrencies().text, "Hello, World!")
        let test = PaylikeCurrency(
            code: "EUR", currency: "Euro", numeric: 300, exponent: 0, funding: true,
            deprecated: false
        )
        print(test)
        print(CurrencyCode.EUR)
    }
}
