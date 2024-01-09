//
//  CarMaintenanceViewModel.swift
//  Vehicle
//
//  Created by Dhandeep  Singh on 09/01/24.
//

// CarMaintenanceViewModel.swift
import Foundation

class CarMaintenanceViewModel: ObservableObject {
    @Published var vehicles: [Vehicle] = []
    @Published var maintenanceTasks: [MaintenanceTask] = []
    @Published var maintenanceRecords: [MaintenanceRecord] = []

    init() {
        loadSavedData()
    }

    // Add a method to add a vehicle
    func addVehicle(_ vehicle: Vehicle) {
        vehicles.append(vehicle)
        saveData()
    }

    // Add a method to add a maintenance task
    func addMaintenanceTask(_ task: MaintenanceTask, for vehicleId: UUID) {
        var taskWithVehicle = task
        taskWithVehicle.vehicleId = vehicleId
        maintenanceTasks.append(taskWithVehicle)
        saveData()
    }
    
    func deleteMaintenanceTask(_ task: MaintenanceTask) {
        maintenanceTasks.removeAll { $0.id == task.id }
        saveData()
    }
    
    func addMaintenanceRecord(vehicle: Vehicle, task: MaintenanceTask) {
        let record = MaintenanceRecord(task: task, date: Date(), mileage: vehicle.odometer)
        maintenanceRecords.append(record)
        saveData()
    }
    
    func saveData() {
        let encoder = JSONEncoder()
        
        if let encodedVehicles = try? encoder.encode(vehicles) {
            UserDefaults.standard.set(encodedVehicles, forKey: "savedVehicles")
        }
        
        if let encodedTasks = try? encoder.encode(maintenanceTasks) {
            UserDefaults.standard.set(encodedTasks, forKey: "savedMaintenanceTasks")
        }
        
        if let encodedRecords = try? encoder.encode(maintenanceRecords) {
            UserDefaults.standard.set(encodedRecords, forKey: "savedMaintenanceRecords")
        }
    }

    func loadSavedData() {
        let decoder = JSONDecoder()

        if let savedVehiclesData = UserDefaults.standard.data(forKey: "savedVehicles"),
           let decodedVehicles = try? decoder.decode([Vehicle].self, from: savedVehiclesData) {
            vehicles = decodedVehicles
        }

        if let savedTasksData = UserDefaults.standard.data(forKey: "savedMaintenanceTasks"),
           let decodedTasks = try? decoder.decode([MaintenanceTask].self, from: savedTasksData) {
            maintenanceTasks = decodedTasks
        }
    }
}


