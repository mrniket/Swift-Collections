//
//  Traversal.swift
//  MoreCollections
//
//  Copyright (c) 2014 Jarrett Bulat. All rights reserved.
//
import Foundation

public class TreeTraversal<N : Hashable> {
    let tree : Tree<N>
    
    init(tree: Tree<N>){
        self.tree = tree
    }
    
    private func breadthFirst(node:N) -> [N]{
        var result = [node]
        for child in tree.getChildren(node) {
            result += breadthFirst(child)
        }
        return result
    }
    
    public var breadthFirst : [N] {
        return tree.root != nil ? breadthFirst(tree.root!) : [N]()
    }
    
    // Not complete
    //    public var depthFirst : [N] {
    //        return tree.root != nil ? depthFirstPreOrder(tree.root!) : [N]()
    //    }
    //
    //    private func depthFirstPreOrder(node:N) -> [N]{
    //        var result = [node]
    //        for child in tree.getChildren(node){
    //            result += depthFirstPreOrder(child)
    //        }
    //        return result
    //    }
}
