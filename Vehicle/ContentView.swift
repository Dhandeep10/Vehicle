//
//  ContentView.swift
//  Vehicle
//
//  Created by Dhandeep  Singh on 09/01/24.
//

// ContentView.swift
import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CarMaintenanceViewModel()
    @State private var isAddingVehicle = false
    @State private var selectedVehicle: Vehicle?

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("My Vehicles")) {
                    ForEach(viewModel.vehicles) { vehicle in
                        NavigationLink(destination: VehicleDetailView(vehicle: vehicle, viewModel: viewModel, selectedVehicle: $selectedVehicle)) {
                            VehicleRow(vehicle: vehicle)
                        }
                    }
                    Button(action: {
                        isAddingVehicle.toggle()
                    }) {
                        Text("Add Vehicle")
                    }
                }

                Section(header: Text("Maintenance Tasks")) {
                    ForEach(viewModel.maintenanceTasks) { task in
                        MaintenanceTaskRow(task: task, viewModel: viewModel)
                    }
                    NavigationLink(destination: AddMaintenanceTaskView(viewModel: viewModel, selectedVehicle: $selectedVehicle, isPresented: $isAddingVehicle)) {
                        Text("Add Maintenance Task")
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Car Maintenance Tracker")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

