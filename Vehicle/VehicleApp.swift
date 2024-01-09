//
//  VehicleApp.swift
//  Vehicle
//
//  Created by Dhandeep  Singh on 09/01/24.
//

import SwiftUI

@main
struct VehicleApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
