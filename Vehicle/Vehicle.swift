//
//  Vehicle.swift
//  Vehicle
//
//  Created by Dhandeep  Singh on 09/01/24.
//

import Foundation

struct Vehicle: Identifiable, Encodable, Decodable {
    let id = UUID()
    var make: String
    var model: String
    var year: Int
    var vin: String
    var odometer: Double
}
