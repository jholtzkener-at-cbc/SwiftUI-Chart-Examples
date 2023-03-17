//
//  ChartData.swift
//  Charts1
//
//  Created by cbcmusic on 2023-03-12.
//

import SwiftUI

struct MonthData: Identifiable, Hashable {
    let label: String
    let value: Double
    
    var id: String { label }
    
    static let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    
    static func makeData(nums: [Double]) -> [MonthData] {
        guard nums.count == 12 else { fatalError() }
        return nums.enumerated().map { index, value in
            MonthData(label: months[index], value: value)
        }
    }
    
    
    
    static let over10 = Self.makeData(nums: [1,1,5,1,3,3,3,3,3,2,2,2])
    static let over20 = Self.makeData(nums: [0,0,0,2,10,24,30,29,17,3,0,0])
    static let over30 = Self.makeData(nums: [0,0,0,0,0,3,5,3,1,0,0,0])
    static let below0 = Self.makeData(nums: [26,22,18,4,0,0,0,0,0,1,8,20])
    static let belowMinus10 = Self.makeData(nums: [9,7,2,0,0,0,0,0,0,0,0,4])
    static let highBefore2010 = Self.makeData(nums: [-1,0,5,12,18,24,27,26,21,14,8,2])
    static let lowBefore2010 = Self.makeData(nums: [-7,-6,-2,4,10,15,18,17,13,7,2,-3])
    static let highAfter2010 = Self.makeData(nums: [0,0,5,12,20,24,28,26,22,15,8,3])
    static let lowAfter2010 = Self.makeData(nums: [-7,-6,-2,3,11,15,18,18,14,8,2,-3])
    static let allData: [(title: String, data: [MonthData])] = [(title: "Over 10", data: MonthData.over10), (title: "Over 20", data:MonthData.over20), (title: "Over 30", data:MonthData.over30)]
    
    static let allBefore2010 = [(title: "Low", data: lowBefore2010), (title: "High", data: highBefore2010)]
    static let averageBefore2010RawData = zip(highBefore2010.map {$0.value}, lowAfter2010.map{$0.value}).map {Double($0.0 + $0.1)/2}
    static let averageBefore2010 = Self.makeData(nums: averageBefore2010RawData)
    static let colors: [Color] = [.blue, .green, .red]
}
