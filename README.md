More Collections for Swift
=============

More Collections for Swift introduces a handful of useful collections that are not currenty in Swift. These collections are designed to coexist with the Swift framework.

As a general rule, the API follow Swift's Array and Dictionary API while strongly influnce by [Googles' Guava collection](https://code.google.com/p/guava-libraries/wiki/GuavaExplained).   More Collections for Swift are designed to be as simple as possible while still satisfying ~90% of common usecases.

[![Build Status](https://travis-ci.org/jbulat/Swift-Collections.svg?branch=master)](https://travis-ci.org/jbulat/Swift-Collections)

## Collections

### Set
A collection that contains no duplicate elements.  More formally, sets contain no pair of elements e1 and e2 such that e1 == e2

### Tree
A collection that simulates a hierarchical tree structure, with a root value and subtrees of children, represented as a set of linked nodes.

### MultiMap
A collection that maps keys to values, similar to Map, but in which each key may be associated with multiple values.

## Version

0.1 Alpha.  The API is subject to change.   

If any of these collections exist already in Swift's standard lib let me know and I will delete the duplicate classes found here

## Collaborate

All development happens on GitHub.  File a bug or pull request for new features and fixes.  

## In Progress

Sets
- Equality operator
- Convenience initializer

MultiMap
- Subscript API
- map, reduce, filter functions

Tree
- Traversal functions
- map, reduce, filter functions

Other Potential Collections
- BiMap
- Table
