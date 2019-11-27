//
//  Associate.swift
//  Pods
//
//  Created by Prokhor Kharchenko on 4/12/17.
//
//

import Foundation

public func associate<T>(value: T, with object: Any, by key: UnsafeRawPointer, policy: objc_AssociationPolicy = .OBJC_ASSOCIATION_RETAIN_NONATOMIC) {
    objc_sync_enter(object)
    defer {
        objc_sync_exit(object)
    }
    objc_setAssociatedObject(object, key, value, policy)
}

public func associate<T>(value: T?, with object: Any, by key: UnsafeRawPointer, policy: objc_AssociationPolicy = .OBJC_ASSOCIATION_RETAIN_NONATOMIC) {
    objc_sync_enter(object)
    defer {
        objc_sync_exit(object)
    }
    objc_setAssociatedObject(object, key, value, policy)
}

public func associated<T>(with object: Any, by key: UnsafeRawPointer, default: () -> T, policy: objc_AssociationPolicy = .OBJC_ASSOCIATION_RETAIN_NONATOMIC) -> T {
    objc_sync_enter(object)
    defer {
        objc_sync_exit(object)
    }
    guard let value: T = objc_getAssociatedObject(object, key) as? T else {
        let newValue = `default`()
        objc_setAssociatedObject(object, key, newValue, policy)
        return newValue
    }
    return value
}
