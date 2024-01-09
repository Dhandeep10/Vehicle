//
//  MaintenanceRecord.swift
//  Vehicle
//
//  Created by Dhandeep  Singh on 09/01/24.
//

import Foundation

struct MaintenanceRecord: Identifiable, Encodable {
    let id = UUID()
    var task: MaintenanceTask
    var date: Date
    var mileage: Double
}
