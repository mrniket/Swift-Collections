//
//  ArrayMultiMapTests.swift
//  MoreCollections
//
//  Created by Jarrett on 2014-11-15.
//  Copyright (c) 2014 Jarrett Bulat. All rights reserved.
//

import UIKit
import XCTest

class ArrayMultiMapTests: XCTestCase {
    let multiMap = ArrayMultiMap<Int, Int>()

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
}
