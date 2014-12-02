//
//  SetTests.swift
//  MoreCollections
//
//  Created by Jarrett on 2014-11-20.
//  Copyright (c) 2014 Jarrett Bulat. All rights reserved.
//

import UIKit
import XCTest

class SetTests: XCTestCase {
    
    var set = Set<Int>()

    override func setUp() {
        super.setUp()
        set.removeAll()
    }
    
    func testInitialState() {
        XCTAssertTrue(set.isEmpty(), "Set must start as empty")
    }
    
    func testIsInit(){
        XCTAssertTrue(Set<Int>().isEmpty())
        XCTAssertEqual(4, Set([1, 2, 3, 4, 4]).count)
        XCTAssertEqual(4, Set("abcdd").count)
        
        let temp = Set(1...10)
        XCTAssertEqual(10, temp.count)
        XCTAssertTrue(contains(temp, 5))
    }
    
    func testIsEmpty(){
        XCTAssertEqual(0, set.count)
        XCTAssertTrue(set.isEmpty())
        set.add(100)
        XCTAssertEqual(1, set.count)
        XCTAssertFalse(set.isEmpty())
        set.add(101)
        XCTAssertEqual(2, set.count)
        XCTAssertFalse(set.isEmpty())
    }
    
    func testCount() {
        XCTAssertEqual(0, set.count)
        XCTAssertTrue(set.isEmpty())
        set.add(100)
        XCTAssertEqual(1, set.count)
        XCTAssertFalse(set.isEmpty())
        set.add(101)
        XCTAssertEqual(2, set.count)
        set.removeAll()
        XCTAssertEqual(0, set.count)
    }
    
    func testAdd() {
        XCTAssertTrue(set.add(100))
        XCTAssertEqual(1, set.count)
        XCTAssertFalse(set.add(100))
        XCTAssertFalse(set.add(100))
        XCTAssertFalse(set.add(100))
        XCTAssertEqual(1, set.count)
        XCTAssertTrue(set.add(101))
        XCTAssertEqual(2, set.count)
    }
    
    func testAddAll() {
        set.addAll([1,2,3,4,5])
        XCTAssertEqual(5, set.count)
        set.addAll([1,2,3,4,5])
        XCTAssertEqual(5, set.count)
    }
    
    func testRemove(){
        set.addAll([1,2,3,4,5])
        XCTAssertEqual(5, set.count)
        XCTAssertTrue(contains(set, 2))
        set.remove(2)
        XCTAssertEqual(4, set.count)
        XCTAssertFalse(contains(set, 2))
    }
    
    func testRemoveSome(){
        set.addAll([1,2,3,4,5])
        XCTAssertEqual(5, set.count)
        XCTAssertTrue(contains(set, 2))
        XCTAssertTrue(contains(set, 1))
        set.removeAll([1,2])
        XCTAssertEqual(3, set.count)
        XCTAssertFalse(contains(set, 2))
        XCTAssertFalse(contains(set, 1))
    }
    
    func testRemoveAll() {
        set.addAll([1,2,3,4,5])
        XCTAssertFalse(set.isEmpty())
        set.removeAll()
        XCTAssertTrue(set.isEmpty())
    }
    
    func testContainsAll(){
        XCTAssertTrue(set.containsAll([Int]()))
        XCTAssertFalse(set.containsAll([1,100]))
        set.addAll([1,2,3,4,5])
        XCTAssertTrue(set.containsAll([1,2]))
        XCTAssertFalse(set.containsAll([1,100]))
    }
    
    func testFilter() {
        set.addAll([1,2,3,4,5])
        XCTAssertTrue(contains(set, 2))
        var result = set.filter() {item in item != 2}
        XCTAssertFalse(contains(result, 2))
    }
    
    func testMap() {
        set.addAll([1,2,3,4,5])
        XCTAssertTrue(contains(set, 2))
        var result = set.map() {item in "\(item)"}
        XCTAssertTrue(contains(result, "2"))
    }
    
    func testReduce() {
        set.addAll([2,3,5])
        // TODO
    }
    
    func testGenerate() {
        var items = [1,2,3,4,5]
        set.addAll(items)
        for item in items {
            XCTAssertTrue(contains(set, item))
        }
    }
    
    func testAsArray(){
        XCTAssertTrue(set.asArray().isEmpty)
        XCTAssertEqual([Int](), set.asArray())
        set.add(1)
        XCTAssertEqual([1], set.asArray())
    }
    
    func testEquals(){
        var other = Set<Int>()
        XCTAssertTrue(set.equals(other))
        set.add(1)
        XCTAssertFalse(set.equals(other))
        other.add(1)
        XCTAssertTrue(set.equals(other))
        other.add(1)
        XCTAssertTrue(set.equals(other))
        other.add(2)
        XCTAssertFalse(set.equals(other))
        
        // ensure order is not a factor
        set.addAll([3,4,2])
        other.addAll([4,3])
        XCTAssertTrue(set.equals(other))
    }
    
    func testEqualsOperator(){
        var other = Set<Int>()
        XCTAssertTrue(set == other)
        set.add(1)
        XCTAssertFalse(set == other)
        other.add(1)
        XCTAssertTrue(set == other)
        other.add(1)
        XCTAssertTrue(set == other)
        other.add(2)
        XCTAssertFalse(set == other)
        
        // ensure order is not a factor
        set.addAll([3,4,2])
        other.addAll([4,3])
        XCTAssertTrue(set == other)
    }
    

}
