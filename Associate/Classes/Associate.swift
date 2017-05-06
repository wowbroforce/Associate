//
//  Associate.swift
//  Pods
//
//  Created by Prokhor Kharchenko on 4/12/17.
//
//

import Foundation

public func associate(value: Any, with object: Any, by key: UnsafeRawPointer, policy: objc_AssociationPolicy = .OBJC_ASSOCIATION_RETAIN_NONATOMIC) {
    objc_sync_enter(object)
    defer {
        objc_sync_exit(object)
    }
    objc_setAssociatedObject(object, key, value, policy)
}

public func associated<T: Associable>(with object: Any, by key: UnsafeRawPointer) -> T {
    objc_sync_enter(object)
    defer {
        objc_sync_exit(object)
    }
    guard let value: T = objc_getAssociatedObject(object, key) as? T else {
        let newValue = T.default()
        objc_setAssociatedObject(object, key, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return newValue
    }
    return value
}

public protocol Associable {
    static func `default`() -> Self
}
