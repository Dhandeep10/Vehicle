//
//  VehicleDetailView.swift
//  Vehicle
//
//  Created by Dhandeep  Singh on 09/01/24.
//

// VehicleDetailView.swift
import SwiftUI

struct VehicleDetailView: View {
    let vehicle: Vehicle
    @ObservedObject var viewModel: CarMaintenanceViewModel
    @Binding var selectedVehicle: Vehicle?

    var body: some View {
        VStack {
            Text("Make: \(vehicle.make)")
            Text("Model: \(vehicle.model)")
            Text("Year: \(vehicle.year)")
            Text("VIN: \(vehicle.vin)")
            Text("Odometer: \(vehicle.odometer) miles")

            Section(header: Text("Maintenance Tasks")) {
                ForEach(viewModel.maintenanceTasks) { task in
                    MaintenanceTaskRow(task: task, viewModel: viewModel)
                }
                Button(action: {
                    selectedVehicle = vehicle
                }) {
                    Text("Add Maintenance Task")
                }
            }
        }
        .padding()
        .navigationTitle("\(vehicle.make) \(vehicle.model)")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Delete") {
                    deleteVehicle()
                }
            }
        }
    }

    private func deleteVehicle() {
        if let index = viewModel.vehicles.firstIndex(where: { $0.id == vehicle.id }) {
            viewModel.vehicles.remove(at: index)
            viewModel.saveData()
            selectedVehicle = nil
        }
    }
}
