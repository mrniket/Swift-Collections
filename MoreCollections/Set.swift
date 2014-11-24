//
//  Set.swift
//  MoreCollections
//
//  Created by Jarrett on 2014-11-18.
//  Copyright (c) 2014 Jarrett Bulat. All rights reserved.
//

import Foundation

// A collection that contains no duplicate elements.  More formally, sets contain no pair of elements e1 and e2 such that e1 == e2
public struct Set<T : Hashable> : SequenceType {
    let IGNORED = 0
    var map: [T: Int] = [:]
    
    public init(){}
    
    public var count: Int {
        return map.count
    }
    
    public mutating func add(item: T) -> Bool {
        let isNew = !contains(self, item)
        map[item] = IGNORED
        return isNew
    }
    
    public mutating func addAll(items: [T]) {
        for item in items {
            add(item)
        }
    }
    
    public mutating func remove(item: T) -> Bool {
        let exists = contains(self, item)
        map[item] = nil
        return exists
    }
    
    public mutating func removeAll(items: [T]) {
        for item in items {
            remove(item)
        }
    }
    
    public mutating func removeAll() {
        map.removeAll()
    }
    
    public func containsAll(items: [T]) -> Bool {
        for item in items {
            if(!contains(self, item)){
                return false
            }
        }
        return true
    }
    
    public func isEmpty() -> Bool {
        return map.isEmpty
    }
    
    public func filter(includeElement: (T) -> Bool) -> Set<T> {
        let result = asArray().filter(includeElement)
        var set = Set<T>()
        set.addAll(result)
        return set
    }
    
    public func map<U>(transform: (T) -> U) -> Set<U> {
        let result = asArray().map(transform)
        var set = Set<U>()
        set.addAll(result)
        return set
    }
    
    public func reduce<U>(initial: U, combine: (U, T) -> U) -> U {
        return asArray().reduce(initial, combine: combine)
    }
    
    public func asArray() -> [T] {
        return [T](map.keys)
    }
    
    public func generate() -> IndexingGenerator<[T]>  {
        return IndexingGenerator(asArray())
    }
}