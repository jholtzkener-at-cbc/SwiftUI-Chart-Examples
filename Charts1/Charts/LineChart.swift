//
//  LineChart.swift
//  Charts1
//
//  Created by cbcmusic on 2023-03-12.
//

import SwiftUI
import Charts

struct LineChart: View {
    var body: some View {
        
        VStack {
            Text("Average Monthly Highs and Lows")
            Chart {
                ForEach(MonthData.allBefore2010, id: \.title) { chart in
                    ForEach(chart.data) {
                        LineMark(x: .value("month", $0.label),
                                 y: .value("temperature", $0.value)
                        )
                        // it will always read the value first
                        //                        .accessibilityValue($0.value)
                        .accessibilityLabel(" degrees \(chart.title)")
                    }
                    .foregroundStyle(by: .value("Title", chart.title))
                    .symbol(by: .value("Title", chart.title))
                }
            }.padding()
                .chartYAxisLabel("temperature", position: .automatic)
                .chartXAxisLabel("month", alignment: .center)
        }
    }
}

struct LineChart_Previews: PreviewProvider {
    static var previews: some View {
        LineChart()
    }
}
