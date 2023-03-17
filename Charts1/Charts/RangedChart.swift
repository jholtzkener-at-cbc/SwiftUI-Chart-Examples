//
//  RangedChart.swift
//  Charts1
//
//  Created by cbcmusic on 2023-03-12.
//

import SwiftUI
import Charts

struct RangedChart: View {
    var body: some View {
        VStack {
            Text("Average Monthly Highs and Lows")
            Chart {
                ForEach(Array(MonthData.lowBefore2010.enumerated()) , id: \.offset) { (index, element) in
                    RectangleMark(x: .value("month", element.label),
                                  yStart: .value("lo", element.value),
                                  yEnd: .value("high", MonthData.highBefore2010[index].value)
                    )
                    // rectangle marks does not give audio graph or other basics
                    .accessibilityLabel("\(element.label): \(element.value) to \(MonthData.highBefore2010[index].value) degrees")
                    .foregroundStyle(.green.opacity(0.5))
                    LineMark(x: .value("month", element.label),
                             y: .value("average", MonthData.averageBefore2010[index].value))
                    PointMark(x: .value("month", element.label),
                             y: .value("average", MonthData.averageBefore2010[index].value))
                    
                    
                    
                }
                
            }
            .padding()
            .chartYAxisLabel("temperature", position: .automatic)
        .chartXAxisLabel("month", alignment: .center)
        }
    }
}

struct RangedChart_Previews: PreviewProvider {
    static var previews: some View {
        RangedChart()
    }
}
