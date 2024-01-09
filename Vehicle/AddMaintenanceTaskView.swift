//
//  AddMaintenanceTaskView.swift
//  Vehicle
//
//  Created by Dhandeep  Singh on 09/01/24.
//

// AddMaintenanceTaskView.swift
import SwiftUI

struct AddMaintenanceTaskView: View {
    @ObservedObject var viewModel: CarMaintenanceViewModel
    @Binding var selectedVehicle: Vehicle?
    @Binding var isPresented: Bool
    @State private var taskName = ""
    @State private var intervalMileage = ""
    @State private var intervalMonths = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Maintenance Task Information")) {
                    TextField("Task Name", text: $taskName)
                    TextField("Interval Mileage", text: $intervalMileage)
                        .keyboardType(.numberPad)
                    TextField("Interval Months", text: $intervalMonths)
                        .keyboardType(.numberPad)
                }

                Section {
                    Button("Save") {
                        saveMaintenanceTask()
                    }
                    .disabled(taskName.isEmpty || intervalMileage.isEmpty || intervalMonths.isEmpty)
                }
            }
            .navigationTitle("Add Maintenance Task")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        isPresented = false
                    }
                }
            }
        }
    }

    // AddMaintenanceTaskView.swift
//    private func saveMaintenanceTask() {
//        guard let intervalMileageInt = Int(intervalMileage), let intervalMonthsInt = Int(intervalMonths) else { return }
//
//        let newTask = MaintenanceTask(name: taskName, intervalMileage: Double(intervalMileageInt), intervalMonths: intervalMonthsInt)
//        viewModel.addMaintenanceTask(newTask)
//
//        if let vehicle = selectedVehicle {
//            // Call the correct method to add a maintenance record
//            viewModel.addMaintenanceRecord(vehicle: vehicle, task: newTask)
//        }
//
//        isPresented = false
//    }
    
    private func saveMaintenanceTask() {
        guard let intervalMileageInt = Int(intervalMileage), let intervalMonthsInt = Int(intervalMonths) else { return }

        let newTask = MaintenanceTask(name: taskName, intervalMileage: Double(intervalMileageInt), intervalMonths: intervalMonthsInt, vehicleId: selectedVehicle?.id ?? UUID())
        
        viewModel.addMaintenanceTask(newTask, for: selectedVehicle?.id ?? UUID())

        isPresented = false
    }
}
