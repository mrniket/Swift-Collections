//
//  TraversalTests.swift
//  MoreCollections
//
//  Copyright (c) 2015 Swift-Collections project (https://github.com/jbulat/Swift-Collections)
//
import XCTest

class TreeTraversalTests: XCTestCase {
    
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
        ****7
        ****8
        */
        tree.addEdge(1, child: 2)
        tree.addEdge(1, child: 3)
        tree.addEdge(3, child: 4)
        tree.addEdge(3, child: 5)
        tree.addEdge(5, child: 6)
        tree.addEdge(5, child: 7)
        tree.addEdge(5, child: 8)
    }
    

    func testDepthFirstTraversal() {
        let traversal = tree.traverse
        XCTAssertEqual([1, 2, 3, 4, 5, 6, 7, 8], traversal.breadthFirst)
        
        XCTAssertEqual([], Tree<Int>().traverse.breadthFirst)
    }
}
