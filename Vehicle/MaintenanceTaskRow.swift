//
//  MaintenanceTaskRow.swift
//  Vehicle
//
//  Created by Dhandeep  Singh on 09/01/24.
//

// MaintenanceTaskRow.swift
import SwiftUI

struct MaintenanceTaskRow: View {
    let task: MaintenanceTask
    @ObservedObject var viewModel: CarMaintenanceViewModel

    var body: some View {
        HStack {
            Text(task.name)
            Spacer()
            Text("Every \(task.intervalMileage) miles / \(task.intervalMonths) months")
            Button(action: {
                viewModel.deleteMaintenanceTask(task)
            }) {
                Image(systemName: "trash")
            }
            .foregroundColor(.red)
        }
    }
}

