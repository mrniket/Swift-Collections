//
//  Set.swift
//  MoreCollections
//
//  Created by Jarrett on 2014-11-18.
//  Copyright (c) 2014 Jarrett Bulat. All rights reserved.
//

import Foundation

// A collection that contains no duplicate elements.  More formally, sets contain no pair of elements e1 and e2 such that e1 == e2

public struct Set<T:Hashable> {

    let IGNORED = 0
    var dictionary: [T:Int] = [:]

    public init<S:SequenceType where S.Generator.Element == T>(_ sequence: S) {
        addAll(sequence)
    }

    public init() {
    }

    public var count: Int {
        return dictionary.count
    }

    public mutating func add(item: T) -> Bool {
        let isNew = !contains(self, item)
        dictionary[item] = IGNORED
        return isNew
    }

    public mutating func addAll<S:SequenceType where S.Generator.Element == T>(sequence: S) {
        for item in [T](sequence) {
            add(item)
        }
    }

    public mutating func remove(item: T) -> Bool {
        let exists = contains(self, item)
        dictionary[item] = nil
        return exists
    }

    public mutating func removeAll<S:SequenceType where S.Generator.Element == T>(sequence: S) {
        for item in [T](sequence) {
            remove(item)
        }
    }

    public mutating func removeAll() {
        dictionary.removeAll()
    }

    public func containsAll<S:SequenceType where S.Generator.Element == T>(sequence: S) -> Bool {
        for item in [T](sequence) {
            if (!contains(self, item)) {
                return false
            }
        }
        return true
    }

    public func isEmpty() -> Bool {
        return dictionary.isEmpty
    }

    public func filter(includeElement: (T) -> Bool) -> Set<T> {
        return Set<T>(dictionary.keys.filter(includeElement))
    }

    public func map<U>(transform: (T) -> U) -> Set<U> {
        return Set<U>(dictionary.keys.map(transform))
    }

    public func reduce<U>(initial: U, combine: (U, T) -> U) -> U {
        return Swift.reduce(dictionary.keys, initial, combine)
    }

    public func asArray() -> [T] {
        return [T](dictionary.keys)
    }
}

extension Set: SequenceType {
    public func generate() -> GeneratorOf<T> {
        return GeneratorOf(dictionary.keys.generate())
    }
}

extension Set: ArrayLiteralConvertible {
    public init(arrayLiteral elements: T...) {
        addAll(elements)
    }
}

// Equality conformance

extension Set: Equatable {
    public func equals(other: Set<T>) -> Bool {
        return self.count == other.count && self.containsAll(other)
    }
}

public func ==<T>(lhs: Set<T>, rhs: Set<T>) -> Bool {
    return lhs.equals(rhs)
}