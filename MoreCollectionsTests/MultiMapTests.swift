//
//  ArrayMultiMapTests.swift
//  MoreCollections
//
//  Created by Jarrett on 2014-11-15.
//  Copyright (c) 2014 Jarrett Bulat. All rights reserved.
//

import UIKit
import XCTest

class MultimapTests: XCTestCase {
    var multimap = Multimap<Int, Int>()

    override func setUp() {
        super.setUp()
        multimap.removeAll()
    }

    func testInitialState() {
        XCTAssertTrue(multimap.isEmpty(), "MultiMap must start as empty")
    }

    func testInitWithSequence() {
        multimap.put(1, value: 2)
        multimap.put(1, value: 2)
        multimap.put(3, value: 4)
        XCTAssertTrue(multimap.containsValue(2))
        XCTAssertTrue(multimap.containsKey(1))

        let copy = Multimap(multimap)
        XCTAssertTrue(copy.containsValue(2))
        XCTAssertTrue(copy.containsKey(1))

        let array = [(1, 2), (2, 3)]
        var copy2 = Multimap(array)
        copy2.putAll(array)
        XCTAssertTrue(copy2.containsValue(2))
        XCTAssertTrue(copy2.containsKey(1))
    }

    func testPutAll() {
        multimap.put(1, value: 2)
        multimap.put(1, value: 2)
        multimap.put(3, value: 4)
        XCTAssertTrue(multimap.containsValue(2))
        XCTAssertTrue(multimap.containsKey(1))

        var copy = Multimap<Int, Int>()
        copy.putAll(multimap)
        XCTAssertTrue(copy.containsValue(2))
        XCTAssertTrue(copy.containsKey(1))

        var copy2 = Multimap<Int, Int>()
        let array = [(1, 2), (2, 3)]
        copy2.putAll(array)
        XCTAssertTrue(copy2.containsValue(2))
        XCTAssertTrue(copy2.containsKey(1))
    }

    func testRemoveAll() {
        multimap.put(1, value: 2);
        XCTAssertFalse(multimap.isEmpty())
        multimap.removeAll()
        XCTAssertTrue(multimap.isEmpty())
    }

    func testContainsEntry() {
        let key = 1
        let value = 2
        XCTAssertFalse(multimap.containsEntry(key, value: value))
        multimap.put(key, value: value)
        XCTAssertTrue(multimap.containsEntry(key, value: value))
        XCTAssertFalse(multimap.containsEntry(3, value: value))
        XCTAssertFalse(multimap.containsEntry(key, value: 4))
    }

    func testContainsKey() {
        let key = 1
        let value = 3
        XCTAssertFalse(multimap.containsKey(key))
        multimap.put(key, value: value)
        XCTAssertTrue(multimap.containsKey(key))
    }

    func testContainsValue() {
        let value = 200
        multimap.put(1, value: value)
        multimap.put(1, value: 2)
        multimap.put(3, value: 4)
        XCTAssertTrue(multimap.containsValue(value))
        XCTAssertTrue(multimap.containsValue(4))
    }

    func testGetAllKeys() {
        XCTAssertTrue(multimap.keys.isEmpty)
        multimap.put(1, value: 2)
        XCTAssertEqual(multimap.keys, [1])
        multimap.put(12, value: 4)
        XCTAssertEqual(multimap.keys.count, 2)
    }

    func testGetAllValues() {
        XCTAssertEqual(multimap.values.count, multimap.count)
        multimap.put(1, value: 1)
        multimap.put(1, value: 1)
        multimap.put(3, value: 1)
        XCTAssertEqual(multimap.values, [1, 1, 1])
        XCTAssertEqual(multimap.values.count, multimap.count)

        multimap.removeAll()
        XCTAssertTrue(multimap.isEmpty())
        multimap.put(14, value: 14)
        XCTAssertEqual(multimap.values.count, 1)
        XCTAssertEqual(multimap.values.count, multimap.count)
    }

    func testRemoveValueForKey() {
        multimap.put(1, value: 1)
        multimap.put(1, value: 2)
        multimap.put(2, value: 1)
        multimap.removeValueForKey(1, value: 2)
        XCTAssertEqual(multimap.values, [1, 1])

        // Ensure removes all matches
        multimap.put(1, value: 1)
        XCTAssertEqual(multimap.values, [1, 1, 1])
        multimap.removeValueForKey(1, value: 1)
        XCTAssertEqual(multimap.get(2), [1])
        XCTAssertEqual(multimap.count, 1)
    }

    func testRemoveValuesForKey() {
        multimap.put(1, value: 1)
        multimap.put(1, value: 1)
        multimap.put(2, value: 1)
        XCTAssertEqual(multimap.values, [1, 1, 1])
        multimap.removeValuesForKey(1)
        XCTAssertEqual(multimap.values, [1])

        let doesNotExist = 3
        multimap.removeValuesForKey(doesNotExist)
        XCTAssertEqual(multimap.values, [1])

        multimap.removeValuesForKey(2)
        XCTAssertTrue(multimap.values.isEmpty)
    }

    func testEquals() {
        var copy = Multimap<Int, Int>()
        XCTAssertTrue(multimap.equals(copy))
        multimap.put(1, value: 1)
        XCTAssertFalse(multimap.equals(copy))
        copy.put(1, value: 1)
        XCTAssertTrue(multimap.equals(copy))
    }

    func testEqualsOperator() {
        var copy = Multimap<Int, Int>()
        XCTAssertTrue(multimap == copy)
        multimap.put(1, value: 1)
        XCTAssertFalse(multimap == copy)
        copy.put(1, value: 1)
        XCTAssertTrue(multimap == copy)
        XCTAssertEqual(multimap, copy)
    }

    func testFilter() {
        multimap.put(1, value: 2)
        multimap.put(1, value: 2)
        multimap.put(3, value: 4)
        XCTAssertTrue(multimap.containsValue(4))
        var result = multimap.filter() {
            entry in entry.value == 2
        }
        XCTAssertEqual(result.count, 2)
        XCTAssertFalse(result.containsValue(4))
    }

    func testMap() {
        multimap.put(1, value: 2)
        multimap.put(1, value: 2)
        multimap.put(3, value: 4)
        XCTAssertTrue(multimap.containsValue(2))
        let result = multimap.map() {
            entry in (entry.key, "\(entry.value)")
        }
        XCTAssertTrue(result.containsValue("2"))
    }

    func testReduce() {
        multimap.put(1, value: 2)
        multimap.put(1, value: 2)
        multimap.put(3, value: 4)
        let result = multimap.reduce(0) {
            $0 + $1.value
        }
        XCTAssertEqual(8, result)
    }
}
