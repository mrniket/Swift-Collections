//
//  Tree.swift
//  MoreCollections
//
//  Created by Jarrett on 2014-11-16.
//  Copyright (c) 2014 Jarrett Bulat. All rights reserved.
//

import Foundation

public struct Tree<N:Hashable>: SequenceType {
    var childrenMap = Multimap<N, N>()
    var parentMap: [N:N] = [:]
    var allNodes = Set<N>()
    var firstNode: N?

    public init() {
    }

    public var count: Int {
        return allNodes.count
    }

    public var root: N? {
        if let node = firstNode {
            return getTreePath(node)[0]
        } else {
            return firstNode
        }
    }

    public var nodes: [N] {
        return allNodes.asArray()
    }

    public mutating func prune(node: N) {
        for child in getChildren(node) {
            prune(child)
        }
        let possibleParent = getParent(node)
        if let parent = possibleParent {
            childrenMap.removeValueForKey(parent, value: node)
        }
        parentMap[node] = nil
        allNodes.remove(node)

        if (allNodes.isEmpty()) {
            firstNode = nil
            removeAll()
        }
    }

    public mutating func addEdge(parent: N, child: N) -> Bool {
        var success = false
        // ensure child is not already contained in the tree and has a parent, ensure the parent and child are not equal
        if (!contains(parentMap.keys, child) && parent != child) {
            if (firstNode == nil) {
                firstNode = parent
            }

            childrenMap.put(parent, value: child)
            parentMap[child] = parent
            allNodes.add(parent)
            allNodes.add(child)
            success = true
        }
        return success
    }

    public mutating func removeAll() {
        childrenMap.removeAll()
        allNodes.removeAll()
        parentMap.removeAll()
        firstNode = nil
    }

    public func isDisjoined(node: N) -> Bool {
        return isEmpty() || !contains(self, node) || !contains(getTreePath(node), root!)
    }

    public func getParent(node: N) -> N? {
        return parentMap[node]
    }

    public func getTreePath(node: N) -> [N] {
        var path = [N]()
        if (contains(self, node)) {
            path += [node]
            var possibleParent = getParent(node)
            while (possibleParent != nil) {
                path += [possibleParent!]
                possibleParent = getParent(possibleParent!)
            }

        }
        return path.reverse()
    }

    public func getChildren(node: N) -> [N] {
        return childrenMap.get(node)
    }

    public func isEmpty() -> Bool {
        return self.count == 0
    }

    public func generate() -> GeneratorOf<N> {
        return allNodes.generate()
    }
}