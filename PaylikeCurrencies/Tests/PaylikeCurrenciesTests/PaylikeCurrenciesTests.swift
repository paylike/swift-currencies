import XCTest
@testable import PaylikeCurrencies

final class PaylikeCurrenciesTests: XCTestCase {
    let currencies = PaylikeCurrencies()
    func testByCode() throws {
        let eur = currencies.byCode(code: CurrencyCode.EUR)
        XCTAssertEqual("EUR", eur.code)
        XCTAssertEqual("Euro", eur.currency)
        XCTAssertEqual(978, eur.numeric)
        XCTAssertEqual(2, eur.exponent)
        XCTAssertEqual(true, eur.funding)
        XCTAssertEqual(false, eur.deprecated)
        
        let all = currencies.byCode(code: CurrencyCode.ALL)
        XCTAssertEqual("ALL", all.code)
        XCTAssertEqual("Albanian lek", all.currency)
        XCTAssertEqual(8, all.numeric)
        XCTAssertEqual(2, all.exponent)
        XCTAssertEqual(false, all.funding)
        XCTAssertEqual(false, all.deprecated)
    }
    
    func testToMajorToMinor() {
        XCTAssertEqual(1, currencies.toMajor(code: CurrencyCode.EUR, minor: 100))
        XCTAssertEqual(100, currencies.toMinor(code: CurrencyCode.EUR, major: 1))
        XCTAssertEqual(1, currencies.toMajor(code: CurrencyCode.JPY, minor: 1))
        XCTAssertEqual(1, currencies.toMinor(code: CurrencyCode.JPY, major: 1))
        XCTAssertEqual(0, currencies.toMajor(code: CurrencyCode.JPY, minor: 0))
        XCTAssertEqual(0, currencies.toMinor(code: CurrencyCode.JPY, major: 0))
        
        XCTAssertEqual(1990, currencies.toMinor(code: CurrencyCode.EUR, major: 19.9))
        XCTAssertEqual(1999, currencies.toMinor(code: CurrencyCode.EUR, major: 19.99))
        XCTAssertEqual(1901, currencies.toMinor(code: CurrencyCode.EUR, major: 19.01))
    }
    
    func testThrows() {
        XCTAssertThrowsError(try currencies.byNumeric(numeric: 23533)) { error in
            switch error {
            case CurrencyError.missingNumeric(23533):
                break
            default:
                XCTFail("Unexpected error thrown")
            }
        }
        XCTAssertThrowsError(try currencies.getCurrencyCode(code: "INVALID")) { error in
            switch error {
            case CurrencyError.missingCode("INVALID"):
                break
            default:
                XCTFail("Unexpected error thrown")
            }
        }
    }
    
}
