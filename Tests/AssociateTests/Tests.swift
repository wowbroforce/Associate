import UIKit
import XCTest
import Associate

var associatedStringKey: Void?
var associatedClassKey: Void?

class AssociateTests: XCTestCase {
    func testThatAssociatedObjectIsReturned() {
        let associatedString = "associated string"
        let defaultString = "default string"
        
        associate(value: associatedString, with: self, by: &associatedStringKey)
        let returnedString = associated(with: self, by: &associatedStringKey, default: { defaultString })
        
        XCTAssertEqual(associatedString, returnedString)
        XCTAssertNotEqual(defaultString, returnedString)
    }
    
    func testThatAssociatedObjectsWithDifferentKeysAreReturned() {
        let associatedString = "associated string"
        let defaultString = "default string"
        let associatedClass = AssociatedClass()
        let defaultClass = AssociatedClass()

        associate(value: associatedString, with: self, by: &associatedStringKey)
        associate(value: associatedClass, with: self, by: &associatedClassKey)
        let returnedString = associated(with: self, by: &associatedStringKey, default: { defaultString })
        let returnedClass = associated(with: self, by: &associatedClassKey, default: { defaultClass })

        XCTAssertEqual(associatedString, returnedString)
        XCTAssertNotEqual(defaultString, returnedString)
        XCTAssertEqual(associatedClass, returnedClass)
        XCTAssertNotEqual(associatedClass, defaultClass)
    }
}

class AssociatedClass: Equatable {
    static func == (lhs: AssociatedClass, rhs: AssociatedClass) -> Bool {
        lhs.id == rhs.id
    }
    
    let id = UUID()
}
