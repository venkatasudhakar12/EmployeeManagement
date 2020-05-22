//
//  File.swift
//  EmployeeManagement
//
//  Created by venkata sudhakar on 22/05/20.
//  Copyright © 2020 venkata sudhakar. All rights reserved.
//

import Foundation

class EmployeeDetailViewModel:ObservableObject {
    let network:NetworkCall = NetworkCall.shared
    @Published var loading:Bool = false
    @Published var message:String = ""
    @Published var status:Bool = false
    @Published var alert:Bool = false
    func createEmployee(employee:Employee){
        self.loading = true
        let data = try? JSONEncoder().encode(employee)
        if let data = data {
            network.createEmployee(employeeData: data) { (status) in
                DispatchQueue.main.async {
                    self.loading = false
                     self.alert = true
                    self.status = status
                    self.message = status ? Messages.crete : Messages.error
                }
            }
        }
    }
    func updateEmployee(employee:Employee){
        self.loading = true
        let data = try? JSONEncoder().encode(employee)
        if let data = data {
            network.updateEmployee(id:employee.id ?? "",employeeData: data) { (status) in
                DispatchQueue.main.async {
                    self.loading = false
                    self.alert = true
                    self.status = status
                    self.message = status ? Messages.update : Messages.error
                }
            }
        }
        
    }
    
    func deleteEmployee(employee:Employee?){
        self.loading = true
        network.deleteEmployee(id:employee?.id ?? "") { (status) in
            DispatchQueue.main.async {
                self.loading = false
                 self.alert = true
                 self.status = status
                self.message = status ? Messages.update : Messages.error
            }
        }
    }
    
    
}
