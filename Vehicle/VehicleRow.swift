//
//  VehicleRow.swift
//  Vehicle
//
//  Created by Dhandeep  Singh on 09/01/24.
//

import SwiftUI

struct VehicleRow: View {
    let vehicle: Vehicle

    var body: some View {
        HStack {
            Image(systemName: "car.fill")
            Text("\(vehicle.make) \(vehicle.model) (\(vehicle.year))")
        }
    }
}
