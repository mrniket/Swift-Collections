//
//  Stack.swift
//  MoreCollections
//
//  Copyright (c) 2015 Swift-Collections project (https://github.com/jbulat/Swift-Collections)
//
import Foundation

public struct Stack<T:Equatable> {
    private var array: [T] = []
    
    public init<S:SequenceType where S.Generator.Element == T>(_ sequence: S) {
        pushAll(sequence)
    }
    
    public init() {
    }
    
    public var count: Int {
        return array.count
    }
    
    public mutating func push(item:T){
        array.append(item)
    }
    
    public mutating func pushAll<S:SequenceType where S.Generator.Element == T>(sequence: S) {
        for item in [T](sequence) {
            push(item)
        }
    }
    
    public mutating func pop() -> T? {
        var last = array.last
        if last != nil {
            array.removeLast()
        }
        return last
    }
    
    public func peek() -> T?{
        return array.last
    }
    
    public func isEmpty() -> Bool {
        return array.isEmpty
    }
    
    public mutating func removeAll() {
        array.removeAll()
    }
}

extension Stack: SequenceType {
    public func generate() -> GeneratorOf<T> {
        return GeneratorOf(array.generate())
    }
}

extension Stack: ArrayLiteralConvertible {
    public init(arrayLiteral elements: T...) {
        pushAll(elements)
    }
}

extension Stack: Equatable {
    public func equals(other: Stack<T>) -> Bool {
        return self.array == other.array
    }
}

public func ==<T>(lhs: Stack<T>, rhs: Stack<T>) -> Bool {
    return lhs.equals(rhs)
}
