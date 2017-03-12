import XCTest
@testable import OCT_Foundation

class OCT_FoundationTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(OCT_Foundation().text, "Hello, World!")
    }


    static var allTests : [(String, (OCT_FoundationTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
