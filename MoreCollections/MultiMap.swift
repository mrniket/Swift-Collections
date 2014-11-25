//
//  MultiMap.swift
//  MoreCollections
//
//  Created by Jarrett on 2014-11-15.
//  Copyright (c) 2014 Jarrett Bulat. All rights reserved.
//

import Foundation

// Implementation of Multimap that uses a Swift Array to store the values for a given key. A Swift Dictionary associates each key with an Array of values.
public struct MultiMap<K : Hashable, V : Equatable> : SequenceType {
    typealias Values = [V]
    typealias Entry = (K, V)
    var map: [K: Values] = [:]
    
    public init(){}
    
    // Returns the number of key-value pairs in this multimap.
    var count: Int {
        var size = 0
        for key in map.keys {
            size += map[key]!.count
        }
        return size
    }
    
    // Returns a new array containing the key from each key-value pair in this multimap
    var keys: [K] {
        return [K](map.keys)
    }
    
    // Returns a new array containing the value from each key-value pair contained in this multimap, without collapsing duplicates (so values.count == self.count).  Order is not deterministic
    var values: [V] {
        var allValues = [V]()
        for (key, value) in self {
            allValues += [value]
        }
        return allValues
    }
    
    // Returns true if this multimap contains at least one key-value pair with the key key and the value value.
    func containsEntry(key: K, value: V) -> Bool {
        return contains(get(key), value)
    }
    
    // Returns true if this multimap contains at least one key-value pair with the key key.
    func containsKey(key: K) -> Bool {
        return map[key] != nil;
    }
    
    //Returns true if this multimap contains at least one key-value pair with the value value.
    func containsValue(value: V) -> Bool {
        for key in map.keys {
            if(containsEntry(key, value: value)){
                return true
            }
        }
        return false
    }
    
    // Returns a new array of the values associated with key in this multimap, if any.
    func get(key: K) -> [V] {
        if let values = map[key] {
            return values;
        }
        return []
    }
    
    // Stores a key-value pair in this multimap.
    mutating func put(key: K, value: V) {
        if(!containsKey(key)){
            map[key] = []
        }
        map[key]!.append(value)
    }
    
    // Removes all key-value pairs with the key key and the value value from this multimap, if such exists.
    mutating func removeValueForKey(key: K, value: V) {
        map[key] = get(key).filter {$0 != value}
    }
    
    // Removes all values associated with the key key.
    mutating func removeValuesForKey(key: K) {
        map.removeValueForKey(key)
    }
    
    // Removes all key-value pairs from the multimap, leaving it empty.
    mutating func removeAll() {
        map.removeAll()
    }
    
    // Returns true if this multimap contains no key-value pairs. Equivalent to count == 0 but more efficient when this multimap is empty
    func isEmpty() -> Bool {
        return map.count == 0 || self.count == 0;
    }
    
    public func generate() -> IndexingGenerator<[Entry]> {
        var allEntries = [Entry]()
        for (key, values) in map {
            for item in values {
                let entry = (key, item)
                allEntries += [(entry)]
            }
        }
        return IndexingGenerator(allEntries)
    }
}