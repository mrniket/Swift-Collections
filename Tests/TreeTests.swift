//
//  TreeTests.swift
//  MoreCollections
//
//  Copyright (c) 2014 Jarrett Bulat. All rights reserved.
//
import UIKit
import XCTest

class TreeTests: XCTestCase {

    var tree = Tree<Int>()

    override func setUp() {
        super.setUp()
        tree.removeAll()
        /*
        *1
        **2
        **3
        ***4
        ***5
        ****6
        */
        tree.addEdge(1, child: 2)
        tree.addEdge(1, child: 3)
        tree.addEdge(3, child: 4)
        tree.addEdge(3, child: 5)
        tree.addEdge(5, child: 6)
    }

    func testClearAndSize() {
        XCTAssertEqual(6, tree.count)
        XCTAssertFalse(tree.isEmpty())
        tree.removeAll()
        XCTAssertEqual(0, tree.count)
        XCTAssertTrue(tree.isEmpty())

        XCTAssertTrue(Tree<String>().isEmpty())
    }

    func testGetParent() {
        XCTAssertEqual(1, tree.getParent(2)!)
        XCTAssertEqual(5, tree.getParent(6)!)
        XCTAssertNil(tree.getParent(1))
    }

    func testGetChildren() {
        XCTAssertEqual(2, tree.getChildren(3).count)
        XCTAssertEqual(1, tree.getChildren(5).count)
        XCTAssertEqual(0, tree.getChildren(6).count)
    }

    func testGetRoot() {
        XCTAssertEqual(1, tree.root!)
        tree.removeAll()
        XCTAssertTrue(tree.root == nil)
    }

    func testGetTreePath() {
        XCTAssertEqual([1], tree.getTreePath(1))
        XCTAssertEqual(tree.getTreePath(tree.root!), tree.getTreePath(1))
        XCTAssertEqual([1, 2], tree.getTreePath(2))
        XCTAssertEqual([1, 3, 5, 6], tree.getTreePath(6))

        // node does not exist
        XCTAssertEqual([], tree.getTreePath(100))
    }

    func testAddNewRoot() {
        XCTAssertEqual(1, tree.root!)
        tree.addEdge(100, child: 1)
        XCTAssertEqual(100, tree.root!)
    }

    func testAddEdge() {
        tree.addEdge(2, child: 7)
        XCTAssertEqual([1, 2, 7], tree.getTreePath(7))
        XCTAssertEqual(2, tree.getParent(7)!)
        XCTAssertEqual([7], tree.getChildren(2))
        XCTAssertEqual([], tree.getChildren(7))

        // Ensure duplicate adds are ok
        tree.addEdge(2, child: 7);
    }

    func testPrune() {
        XCTAssertEqual([1, 3, 5, 6], tree.getTreePath(6))
        tree.prune(6)
        XCTAssertEqual([1, 3, 5], tree.getTreePath(5))
        XCTAssertEqual([], tree.getTreePath(6))

        tree.prune(5)
        XCTAssertEqual([1, 3], tree.getTreePath(3))
        XCTAssertEqual([], tree.getTreePath(5))

        XCTAssertEqual(4, tree.count)
        tree.prune(100)
        XCTAssertEqual(4, tree.count)
    }

}
