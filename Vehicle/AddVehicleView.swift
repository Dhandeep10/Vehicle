//
//  AddVehicleView.swift
//  Vehicle
//
//  Created by Dhandeep  Singh on 09/01/24.
//

// AddVehicleView.swift
import SwiftUI

struct AddVehicleView: View {
    @ObservedObject var viewModel: CarMaintenanceViewModel
    @Binding var isPresented: Bool
    @State private var make = ""
    @State private var model = ""
    @State private var year = ""
    @State private var vin = ""
    @State private var odometer = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Vehicle Information")) {
                    TextField("Make", text: $make)
                    TextField("Model", text: $model)
                    TextField("Year", text: $year)
                        .keyboardType(.numberPad)
                    TextField("VIN", text: $vin)
                    TextField("Odometer", text: $odometer)
                        .keyboardType(.numberPad)
                }

                Section {
                    Button("Save") {
                        saveVehicle()
                    }
                    .disabled(make.isEmpty || model.isEmpty || year.isEmpty || vin.isEmpty || odometer.isEmpty)
                }
            }
            .navigationTitle("Add Vehicle")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        isPresented = false
                    }
                }
            }
        }
    }

    private func saveVehicle() {
        guard let yearInt = Int(year), let odometerDouble = Double(odometer) else { return }

        let newVehicle = Vehicle(make: make, model: model, year: yearInt, vin: vin, odometer: odometerDouble)
        viewModel.addVehicle(newVehicle)
        isPresented = false
    }
}

