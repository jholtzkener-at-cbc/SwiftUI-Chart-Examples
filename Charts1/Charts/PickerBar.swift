//
//  MonthlyOver.swift
//  Charts1
//
//  Created by cbcmusic on 2023-03-12.
//

import SwiftUI
import Charts

struct PickerBar: View {
    @State private var dataSeries: DataSeries = .over10
    
    enum DataSeries: String, CaseIterable {
        case over10 = "over 10 degrees"
        case over20 = "over 20 degrees"
        case over30 = "over 30 degrees"
        
        var seriesData: [MonthData] {
            switch self {
            case .over10:
                return MonthData.over10
            case .over20:
                return MonthData.over20
            case .over30:
                return MonthData.over30
            }
        }
    }
    
    var body: some View {
        VStack {
            Text("Number of Days over n℃")
            Picker("Range", selection: $dataSeries.animation()) {
                Text(DataSeries.over10.rawValue).tag(DataSeries.over10)
                Text(DataSeries.over20.rawValue).tag(DataSeries.over20)
                Text(DataSeries.over30.rawValue).tag(DataSeries.over30)
            }
            .pickerStyle(.segmented)
            .padding()
            
            Chart(dataSeries.seriesData) {
                BarMark(x: .value("month", $0.label),
                        y: .value("number of days", $0.value))
                        
                // this will display properly, but VO assumes Y axis quantitative
//                BarMark(x: .value("number of days", $0.value),
//                        y: .value("month", $0.label)
//                )
                .accessibilityLabel($0.label)
                .accessibilityValue("\($0.value) day\($0.value == 1 ? "" : "s") \(dataSeries.rawValue)")
                .foregroundStyle(.black)
            }
            .chartYScale(domain: 0...31)
            .chartYAxisLabel("number of days", position: .automatic)
            .chartXAxisLabel("month", alignment: .center)
            .padding()
        }
    }
}

struct PickerBar_Previews: PreviewProvider {
    static var previews: some View {
        PickerBar()
    }
}
