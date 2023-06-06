//
//  BarChartsView.swift
//  ILoveWorkout
//
//  Created by Jonas Backas on 2023-02-16.
//

import SwiftUI
import Charts
import Firebase
import FirebaseAuth
import Foundation


struct BarChartsView: View {
    @ObservedObject var viewModel = BarChartsViewModel()
    

    var body: some View {
        
        VStack(alignment: .leading, spacing: 4) {
            Text("Exercises Counter")
            
            Text("Total: \(viewModel.workoutCounter.reduce(0, { $0 + $1.workoutCount }))")
                .fontWeight(.semibold)
                .font(.footnote)
                .foregroundColor(.secondary)
                .padding(.bottom, 12)
            
            Chart {
                RuleMark(y: .value("Goal", 200))
                    .foregroundStyle(Color.black)
                    .lineStyle(StrokeStyle(lineWidth: 1, dash: [5]))
                
                ForEach(viewModel.workoutCounter) { workoutcounter in
                    BarMark(
                        x: .value("Month", workoutcounter.date, unit: .month),
                        y: .value("WorkoutCount", workoutcounter.workoutCount)
                    )
                    .foregroundStyle(Color.red.gradient)
                    .cornerRadius(10)
                }
            }
            .frame(height: 180)
            .chartYScale()
            .chartXAxis {
                AxisMarks(values: viewModel.workoutCounter.map {$0.date}) { date in
                    AxisValueLabel(format:
                            .dateTime.month(.narrow),
                                   centered: true)
                }
            }
            .chartYAxis {
                AxisMarks(position: .leading)
                
            }
            HStack {
                Image(systemName: "line.diagonal")
                    .rotationEffect(Angle(degrees: 45))
                    .foregroundColor(.black)
                
                Text("Monthly Goal")
                    .foregroundColor(.secondary)
            }
            .font(.caption2)
            .padding(.leading, 4)
            
            
        }
        .onAppear() {
            viewModel.listenToFirestore()
        }
        .padding()
    }
    
    
    

}
//struct BarChartsView_Previews: PreviewProvider {
//    static var previews: some View {
//        BarChartsView(workoutitems: <#[WorkoutItem]#>)
//    }
//}

extension Date {
    static func from(month: Int) -> Date {
        let components = DateComponents(month: month)
        return Calendar.current.date(from: components)!
    }
}

