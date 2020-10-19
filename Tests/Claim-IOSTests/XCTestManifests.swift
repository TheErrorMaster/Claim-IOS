import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(Claim_IOSTests.allTests),
    ]
}
#endif
