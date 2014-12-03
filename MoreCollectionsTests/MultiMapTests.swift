//
//  ArrayMultiMapTests.swift
//  MoreCollections
//
//  Created by Jarrett on 2014-11-15.
//  Copyright (c) 2014 Jarrett Bulat. All rights reserved.
//

import UIKit
import XCTest

class MultiMapTests: XCTestCase {
    var multiMap = MultiMap<Int, Int>()

    override func setUp() {
        super.setUp()
        multiMap.removeAll()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInitialState() {
        XCTAssertTrue(multiMap.isEmpty(), "MultiMap must start as empty")
    }
    
    func testInitWithSequence(){
        multiMap.put(1, value:2)
        multiMap.put(1, value:2)
        multiMap.put(3, value:4)
        XCTAssertTrue(multiMap.containsValue(2))
        XCTAssertTrue(multiMap.containsKey(1))
        
        let copy = MultiMap(multiMap)
        XCTAssertTrue(copy.containsValue(2))
        XCTAssertTrue(copy.containsKey(1))
        
        let array = [(1,2), (2,3)]
        var copy2 = MultiMap(array)
        copy2.putAll(array)
        XCTAssertTrue(copy2.containsValue(2))
        XCTAssertTrue(copy2.containsKey(1))
    }
    
    func testPutAll(){
        multiMap.put(1, value:2)
        multiMap.put(1, value:2)
        multiMap.put(3, value:4)
        XCTAssertTrue(multiMap.containsValue(2))
        XCTAssertTrue(multiMap.containsKey(1))
        
        var copy = MultiMap<Int, Int>()
        copy.putAll(multiMap)
        XCTAssertTrue(copy.containsValue(2))
        XCTAssertTrue(copy.containsKey(1))
        
        var copy2 = MultiMap<Int, Int>()
        let array = [(1,2), (2,3)]
        copy2.putAll(array)
        XCTAssertTrue(copy2.containsValue(2))
        XCTAssertTrue(copy2.containsKey(1))
    }
    
    func testRemoveAll() {
        multiMap.put(1, value: 2);
        XCTAssertFalse(multiMap.isEmpty())
        multiMap.removeAll()
        XCTAssertTrue(multiMap.isEmpty())
    }
    
    func testContainsEntry() {
        let key = 1
        let value = 2
        XCTAssertFalse(multiMap.containsEntry(key, value:value))
        multiMap.put(key, value: value)
        XCTAssertTrue(multiMap.containsEntry(key, value:value))
        XCTAssertFalse(multiMap.containsEntry(3, value:value))
        XCTAssertFalse(multiMap.containsEntry(key, value:4))
    }
    
    func testContainsKey() {
        let key = 1
        let value = 3
        XCTAssertFalse(multiMap.containsKey(key))
        multiMap.put(key, value: value)
        XCTAssertTrue(multiMap.containsKey(key))
    }
    
    func testContainsValue() {
        let value = 200
        multiMap.put(1, value:value)
        multiMap.put(1, value:2)
        multiMap.put(3, value:4)
        XCTAssertTrue(multiMap.containsValue(value))
        XCTAssertTrue(multiMap.containsValue(4))
    }
    
    func testGetAllKeys() {
        XCTAssertTrue(multiMap.keys.isEmpty)
        multiMap.put(1, value: 2)
        XCTAssertEqual(multiMap.keys, [1])
        multiMap.put(12, value: 4)
        XCTAssertEqual(multiMap.keys.count, 2)
    }
    
    func testGetAllValues() {
        XCTAssertEqual(multiMap.values.count, multiMap.count)
        multiMap.put(1, value:1)
        multiMap.put(1, value:1)
        multiMap.put(3, value:1)
        XCTAssertEqual(multiMap.values, [1,1,1])
        XCTAssertEqual(multiMap.values.count, multiMap.count)
        
        multiMap.removeAll()
        XCTAssertTrue(multiMap.isEmpty())
        multiMap.put(14, value:14)
        XCTAssertEqual(multiMap.values.count, 1)
        XCTAssertEqual(multiMap.values.count, multiMap.count)
    }
    
    func testRemoveValueForKey() {
        multiMap.put(1, value:1)
        multiMap.put(1, value:2)
        multiMap.put(2, value:1)
        multiMap.removeValueForKey(1, value:2)
        XCTAssertEqual(multiMap.values, [1,1])
        
        // Ensure removes all matches
        multiMap.put(1, value:1)
        XCTAssertEqual(multiMap.values, [1,1,1])
        multiMap.removeValueForKey(1, value:1)
        XCTAssertEqual(multiMap.get(2), [1])
        XCTAssertEqual(multiMap.count, 1)
    }
    
    func testRemoveValuesForKey() {
        multiMap.put(1, value:1)
        multiMap.put(1, value:1)
        multiMap.put(2, value:1)
        XCTAssertEqual(multiMap.values, [1,1,1])
        multiMap.removeValuesForKey(1)
        XCTAssertEqual(multiMap.values, [1])
        
        let doesNotExist = 3
        multiMap.removeValuesForKey(doesNotExist)
        XCTAssertEqual(multiMap.values, [1])
        
        multiMap.removeValuesForKey(2)
        XCTAssertTrue(multiMap.values.isEmpty)
    }
    
    func testEquals(){
        var copy = MultiMap<Int, Int>()
        XCTAssertTrue(multiMap.equals(copy))
        multiMap.put(1, value:1)
        XCTAssertFalse(multiMap.equals(copy))
        copy.put(1, value:1)
        XCTAssertTrue(multiMap.equals(copy))
    }
    
    func testEqualsOperator(){
        var copy = MultiMap<Int, Int>()
        XCTAssertTrue(multiMap == copy)
        multiMap.put(1, value:1)
        XCTAssertFalse(multiMap == copy)
        copy.put(1, value:1)
        XCTAssertTrue(multiMap == copy)
        XCTAssertEqual(multiMap, copy)
    }
}
