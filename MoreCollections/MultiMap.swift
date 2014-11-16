//
//  MultiMap.swift
//  MoreCollections
//
//  Created by Jarrett on 2014-11-15.
//  Copyright (c) 2014 Jarrett Bulat. All rights reserved.
//

import Foundation

// A MultiMap Data structure based on Google Guava's MultiMap
protocol MultiMap {
    typealias KeyType : Hashable
    typealias ValueType : Equatable
    
    // Returns the number of key-value pairs in this multimap.
    var count: Int { get }
    
    // Returns a new array containing the key from each key-value pair in this multimap.
    var keys: [KeyType] { get }
    
    // Returns a new array containing the value from each key-value pair contained in this multimap, without collapsing duplicates (so values.count == self.count).
    var values: [ValueType] { get }
    
    // Returns true if this multimap contains at least one key-value pair with the key key and the value value.
    func containsEntry(key: KeyType, value: ValueType) -> Bool
    
    // Returns true if this multimap contains at least one key-value pair with the key key.
    func containsKey(key: KeyType) -> Bool
    
    //Returns true if this multimap contains at least one key-value pair with the value value.
    func containsValue(value: ValueType) -> Bool
    
    // Returns a new array of the values associated with key in this multimap, if any.
    func get(key: KeyType) -> [ValueType]
    
    // Stores a key-value pair in this multimap.
    mutating func put(key: KeyType, value: ValueType)
    
    // Removes all key-value pairs with the key key and the value value from this multimap, if such exists.
    mutating func removeValueForKey(key: KeyType, value: ValueType)
    
    // Removes all values associated with the key key.
    mutating func removeValuesForKey(key: KeyType)
    
    // Removes all key-value pairs from the multimap, leaving it empty.
    mutating func removeAll()
    
    // Returns true if this multimap contains no key-value pairs. Equivalent to count == 0.  In some cases be more efficient.
    func isEmpty() -> Bool
}