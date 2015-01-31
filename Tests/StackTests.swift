//
//  StackTests.swift
//  MoreCollections
//
//  Copyright (c) 2015 Swift-Collections project (https://github.com/jbulat/Swift-Collections)
//
import XCTest

class StackTests: XCTestCase {

    var stack = Stack<Int>()
    
    override func setUp() {
        super.setUp()
        stack.removeAll()
    }
    
    func testInitialState() {
        XCTAssertTrue(stack.isEmpty, "Stack must start empty")
    }
    
    func testInit() {
        XCTAssertTrue(Stack<Int>().isEmpty)
        XCTAssertEqual(5, Stack([1, 2, 3, 4, 4]).count)
        XCTAssertEqual(5, Stack("abcdd").count)

        let temp = Stack(1 ... 10)
        XCTAssertEqual(10, temp.count)
        XCTAssertTrue(contains(temp, 5))
    }
    
    func testIsEmpty() {
        XCTAssertTrue(stack.isEmpty)
        stack.push(100)
        XCTAssertFalse(stack.isEmpty)
        stack.push(100)
        XCTAssertFalse(stack.isEmpty)
        stack.pop()
        XCTAssertFalse(stack.isEmpty)
        stack.pop()
        XCTAssertTrue(stack.isEmpty)
    }
    
    func testCount() {
        XCTAssertEqual(0, stack.count)
        stack.push(100)
        XCTAssertEqual(1, stack.count)
        stack.push(100)
        XCTAssertEqual(2, stack.count)
        stack.pop()
        XCTAssertEqual(1, stack.count)
        stack.pop()
        XCTAssertEqual(0, stack.count)
    }

}
