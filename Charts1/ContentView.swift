//
//  ContentView.swift
//  Charts1
//
//  Created by cbcmusic on 2023-03-07.
//

import SwiftUI
import Charts

struct ContentView: View {
    @State private var selectedTab: ChartTab = .pickerBar
    
    enum ChartTab {
        case pickerBar
        case stackedBar
        case line
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            PickerBar()
                .tabItem { Text("Monthly")}
            
            StackedBar()
                .tabItem { Text("Combined")}
            
            LineChart()
                .tabItem { Text("Line")}
            
            RangedChart()
                .tabItem { Text("Ranged")}
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}





