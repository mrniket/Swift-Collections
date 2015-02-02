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
    
    func testPush() {
        stack.push(100)
        stack.push(100)
        stack.pop()
        stack.push(101)
        XCTAssertEqual([Int](stack), [100, 101])
    }
    
    func testPushAll() {
        stack.push(100)
        stack.pushAll([1, 2, 3, 4])
        stack.pop()
        XCTAssertEqual([Int](stack), [100, 1, 2, 3])
    }
    
    func testPop() {
        stack.pushAll([1, 2, 3, 4])
        XCTAssertEqual(4, stack.pop()!)
        XCTAssertEqual(3, stack.pop()!)
        XCTAssertEqual(2, stack.pop()!)
        XCTAssertEqual(1, stack.pop()!)
        XCTAssertNil(stack.pop())
    }
    
    func testPeek() {
        XCTAssertNil(stack.peek())
        stack.push(100)
        XCTAssertEqual(100, stack.peek()!)
        stack.push(1)
        XCTAssertEqual(1, stack.peek()!)
        stack.pop()
        stack.push(102)
        XCTAssertEqual(102, stack.peek()!)
    }
    
    func testRemoveAll() {
        stack.pushAll([1, 2, 3, 4])
        XCTAssertEqual([Int](stack), [1, 2, 3, 4])
        XCTAssertFalse(stack.isEmpty)
        stack.removeAll()
        XCTAssertTrue(stack.isEmpty)
    }
    
    func testEquals() {
        var other = Stack<Int>()
        XCTAssertEqual(stack, other)
        stack.push(1)
        other.push(1)
        XCTAssertEqual(stack, other)
        stack.push(2)
        XCTAssertNotEqual(stack, other)
    }
    
    func testFilter() {
        stack.pushAll([1, 2, 3, 4, 5])
        XCTAssertTrue(contains(stack, 2))
        var result = stack.filter() {
            item in item != 2
        }
        XCTAssertFalse(contains(result, 2))
    }
    
    func testMap() {
        stack.pushAll([1, 2, 3, 4, 5])
        XCTAssertTrue(contains(stack, 2))
        let result = stack.map() {
            item in "\(item)"
        }
        XCTAssertTrue(contains(result, "2"))
    }
    
    func testReduce() {
        stack.pushAll([2, 3, 5])
        let result = stack.reduce(0) {
            $0 + $1
        }
        XCTAssertEqual(10, result)
    }
    

}
