//
//  StackedBar.swift
//  Charts1
//
//  Created by cbcmusic on 2023-03-12.
//

import SwiftUI
import Charts

struct StackedBar: View {
    @State var barGraphType: BarGraphType = .stacked
    
    enum BarGraphType: String {
        case stacked
        case sideBySide
    }
    
    
    
    var body: some View {
        VStack {
            Text("Number of Days over n℃")
            Picker("type", selection: $barGraphType.animation()) {
                Text(BarGraphType.stacked.rawValue).tag(BarGraphType.stacked)
                Text(BarGraphType.sideBySide.rawValue).tag(BarGraphType.sideBySide)
            }.pickerStyle(.segmented)
            Chart {
                ForEach(MonthData.allData, id: \.title) { chart in
                    ForEach(chart.data) {
                        BarMark(x: .value("month", $0.label),
                                y: .value("number of days", $0.value)
                        )
                        // including the a11y label + a11y value breaks reading of three series
                        .accessibilityLabel(" day\($0.value == 1 ? "" : "s") \(chart.title) degrees")
                    }
                    // VO will read "data series" twice if foregroundStyle + position are used
                    .foregroundStyle(by: .value("data series", chart.title ))
                    .position(by: .value("data series", barGraphType == .stacked ? "" :  chart.title))
                }
            }
            .chartYAxisLabel("number of days", position: .automatic)
            .chartXAxisLabel("month", alignment: .center)
            .padding()
        }
    }
}

struct StackedBar_Previews: PreviewProvider {
    static var previews: some View {
        StackedBar()
    }
}


extension View {
    /// Applies the given transform if the given condition evaluates to `true`.
    /// - Parameters:
    ///   - condition: The condition to evaluate.
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
    @ViewBuilder func `if`<Content: View>(_ condition: @autoclosure () -> Bool, transform: (Self) -> Content) -> some View {
        if condition() {
            transform(self)
        } else {
            self
        }
    }
}
