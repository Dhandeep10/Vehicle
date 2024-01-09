//
//  MaintenanceTask.swift
//  Vehicle
//
//  Created by Dhandeep  Singh on 09/01/24.
//

import Foundation

struct MaintenanceTask: Identifiable, Encodable, Decodable {
    let id = UUID()
    var name: String
    var intervalMileage: Double
    var intervalMonths: Int
    var vehicleId: UUID
}
