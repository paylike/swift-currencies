import XCTest
@testable import PaylikeCurrencies

final class PaylikeCurrenciesTests: XCTestCase {
    func testByCode() throws {
        let eur = PaylikeCurrencies.byCode(code: CurrencyCode.EUR)
        XCTAssertEqual("EUR", eur.code)
        XCTAssertEqual("Euro", eur.currency)
        XCTAssertEqual(978, eur.numeric)
        XCTAssertEqual(2, eur.exponent)
        XCTAssertEqual(true, eur.funding)
        XCTAssertEqual(false, eur.deprecated)
        
        let all = PaylikeCurrencies.byCode(code: CurrencyCode.ALL)
        XCTAssertEqual("ALL", all.code)
        XCTAssertEqual("Albanian lek", all.currency)
        XCTAssertEqual(8, all.numeric)
        XCTAssertEqual(2, all.exponent)
        XCTAssertEqual(false, all.funding)
        XCTAssertEqual(false, all.deprecated)
    }
    
    func testToMajorToMinor() {
        XCTAssertEqual(1, PaylikeCurrencies.toMajor(code: CurrencyCode.EUR, minor: 100))
        XCTAssertEqual(100, PaylikeCurrencies.toMinor(code: CurrencyCode.EUR, major: 1))
        XCTAssertEqual(1, PaylikeCurrencies.toMajor(code: CurrencyCode.JPY, minor: 1))
        XCTAssertEqual(1, PaylikeCurrencies.toMinor(code: CurrencyCode.JPY, major: 1))
        XCTAssertEqual(0, PaylikeCurrencies.toMajor(code: CurrencyCode.JPY, minor: 0))
        XCTAssertEqual(0, PaylikeCurrencies.toMinor(code: CurrencyCode.JPY, major: 0))
        
        XCTAssertEqual(1990, PaylikeCurrencies.toMinor(code: CurrencyCode.EUR, major: 19.9))
        XCTAssertEqual(1999, PaylikeCurrencies.toMinor(code: CurrencyCode.EUR, major: 19.99))
        XCTAssertEqual(1901, PaylikeCurrencies.toMinor(code: CurrencyCode.EUR, major: 19.01))
    }
    
    func testThrows() {
        XCTAssertThrowsError(try PaylikeCurrencies.byNumeric(numeric: 23533)) { error in
            switch error {
            case CurrencyError.missingNumeric(23533):
                break
            default:
                XCTFail("Unexpected error thrown")
            }
        }
        XCTAssertThrowsError(try PaylikeCurrencies.getCurrencyCode(code: "INVALID")) { error in
            switch error {
            case CurrencyError.missingCode("INVALID"):
                break
            default:
                XCTFail("Unexpected error thrown")
            }
        }
    }
    
}
