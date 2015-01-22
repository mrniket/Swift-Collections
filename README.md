More Collections for Swift
=============

More Collections for Swift introduces a few useful native collection types not currently in Swift. These collections are designed to coexist with the Swift framework.

As a general rule, the API follow Swift's Array and Dictionary API while strongly influence by [Google's Guava collections](https://code.google.com/p/guava-libraries/wiki/GuavaExplained).   More Collections for Swift are designed to be as simple as possible while still satisfying a majority of each collection’s use cases.

[![Build Status](https://travis-ci.org/jbulat/Swift-Collections.svg?branch=master)](https://travis-ci.org/jbulat/Swift-Collections)

## Collections

### Set
A collection that contains no duplicate elements.  More formally, contain no pair of elements e1 and e2 such that e1 == e2.

This is not an ordered set, deterministic iteration is not guaranteed.  As such it cannot be indexed via the index operator.

### Tree
A collection that models linked nodes in a hierarchical tree structure.  A tree contains a root value and 0 or more children trees.

### Multimap
A collection that maps keys to values, similar to Map, but in which each a key may be associated with multiple values.

## Version

0.1 Alpha.  The API is subject to change.   

## Collaborate

All development happens on GitHub.  File a bug or pull request for new features and fixes.  

If any of these collections exist already in Swift's standard library let me know and I will delete the duplicate classes found here.  Suggestions for improvements are welcome!

## In Progress

Sets
- Operations: Union, Complement, Intersect, Difference
- Overload operators for above operations

Multimap
- Subscript API
- Add performance test cases

Tree
- Traversal API
- map, reduce, filter functions
- Add performance test cases

Other Potential Collections
- Stack
- Queue
- BiMap

## Using this code

This code is licensed under the standard MIT license.

If you find bugs or ways to improve this code, please file a bug or pull request so everyone can benefit.