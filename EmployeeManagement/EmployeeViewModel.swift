//
//  EmployeeViewModel.swift
//  EmployeeManagement
//
//  Created by venkata sudhakar on 21/05/20.
//  Copyright © 2020 venkata sudhakar. All rights reserved.
//

import Foundation
import Combine
class EmployeeViewModel:ObservableObject {
    @Published var employees = [Employee]()
    @Published var loading = false
    func fetchEmployees(){
        self.loading = true
        NetworkCall.shared.getAllEmployees { (status, employees) in
            DispatchQueue.main.async {
                self.loading = false
                if status,let employees = employees {
                    self.employees = employees
                }
            }
        }
    }
}
