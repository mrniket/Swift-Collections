//
//  SetPerfTest.swift
//  MoreCollections
//
//  Copyright (c) 2015 Jarrett Bulat. All rights reserved.
//

import UIKit
import XCTest

class SetPerfTest: XCTestCase {
    func testPerformanceCount() {
        self.measureMetrics([XCTPerformanceMetric_WallClockTime], automaticallyStartMeasuring:false, forBlock:{
            var set = Set<Int>(1 ... 1000)
            self.startMeasuring()
            set.count
            self.stopMeasuring()
        });
    }
    
    func testPerformanceRemoveSome() {
        self.measureMetrics([XCTPerformanceMetric_WallClockTime], automaticallyStartMeasuring:false, forBlock:{
            var set = Set<Int>(1 ... 1000)
            self.startMeasuring()
            set.removeAll(500 ... 1000)
            self.stopMeasuring()
        });
    }
    
    func testPerformanceContains() {
        self.measureMetrics([XCTPerformanceMetric_WallClockTime], automaticallyStartMeasuring:false, forBlock:{
            let set = Set<Int>(1 ... 1000)
            self.startMeasuring()
            set.contains(500)
            self.stopMeasuring()
        });
    }
    
    // Performance Tests for Init
    func testPerformanceInit_10() {
        self.measureBlock() {
            let item = Set(1 ... 10)
        }
    }
    func testPerformanceInit_100() {
        self.measureBlock() {
            let item = Set(1 ... 100)
        }
    }
    func testPerformanceInit_500() {
        self.measureBlock() {
            let item = Set(1 ... 500)
        }
    }
    func testPerformanceInit_1000() {
        self.measureBlock() {
            let item = Set(1 ... 1000)
        }
    }
    func testPerformanceInit_5000() {
        self.measureBlock() {
            let item = Set(1 ... 5000)
        }
    }
    func testPerformanceInit_10000() {
        self.measureBlock() {
            let item = Set(1 ... 10000)
        }
    }
    
    // Performance Tests for Add
    func testPerformanceAdd_10() {
        self.measureMetrics([XCTPerformanceMetric_WallClockTime], automaticallyStartMeasuring:false, forBlock:{
            var set = Set<Int>()
            self.startMeasuring()
            for item in 1 ... 10 {
                set.add(item)
            }
            self.stopMeasuring()
        });
    }
    func testPerformanceAdd_100() {
        self.measureMetrics([XCTPerformanceMetric_WallClockTime], automaticallyStartMeasuring:false, forBlock:{
            var set = Set<Int>()
            self.startMeasuring()
            for item in 1 ... 100 {
                set.add(item)
            }
            self.stopMeasuring()
        });
    }
    func testPerformanceAdd_500() {
        self.measureBlock() {
            var set = Set<Int>()
            for item in 1 ... 500 {
                set.add(item)
            }
        }
    }
    func testPerformanceAdd_1000() {
        self.measureMetrics([XCTPerformanceMetric_WallClockTime], automaticallyStartMeasuring:false, forBlock:{
            var set = Set<Int>()
            self.startMeasuring()
            for item in 1 ... 1000 {
                set.add(item)
            }
            self.stopMeasuring()
        });
    }
    func testPerformanceAdd_5000() {
        self.measureMetrics([XCTPerformanceMetric_WallClockTime], automaticallyStartMeasuring:false, forBlock:{
            var set = Set<Int>()
            self.startMeasuring()
            for item in 1 ... 5000 {
                set.add(item)
            }
            self.stopMeasuring()
        });
    }
    func testPerformanceAdd_10000() {
        self.measureMetrics([XCTPerformanceMetric_WallClockTime], automaticallyStartMeasuring:false, forBlock:{
            var set = Set<Int>()
            self.startMeasuring()
            for item in 1 ... 10000 {
                set.add(item)
            }
            self.stopMeasuring()
        });
    }
}