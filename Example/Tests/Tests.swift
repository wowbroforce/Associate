import UIKit
import XCTest
import Associate

class Tests: XCTestCase {
    
    func testCrossThreadAccess() {
        DispatchQueue(label: "thread 1").asyncAfter(deadline: DispatchTime.now() + 0.01) {
            for _ in 0..<10 {
                objc_sync_enter(self)
                defer { objc_sync_exit(self) }
                self.counter.value = 0
            }
        }
        DispatchQueue(label: "thread 2").async {
            for _ in 0..<10 {
                objc_sync_enter(self)
                defer { objc_sync_exit(self) }
                self.counter.value = 0
            }
        }
        DispatchQueue(label: "thread 3").async {
            for _ in 0..<10 {
                objc_sync_enter(self)
                defer { objc_sync_exit(self) }
                self.counter.value = 0
            }
        }
        
        let exp = expectation(description: "-")
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 2, handler: nil)
    }
}

extension XCTestCase {
    static var counterKey: Void?
    var counter: Foo {
        get {
            return associated(with: self, by: &XCTestCase.counterKey)
        }
        set {
            associate(value: newValue, with: self, by: &XCTestCase.counterKey)
        }
    }
}

final class Foo: Associable {
    let testCase: XCTestCase?
    var value: Int = 0
    
    init(testCase: XCTestCase? = nil) {
        self.testCase = testCase
    }
    static func `default`() -> Foo {
        return Foo()
    }

    deinit {
        XCTFail()
    }
}
