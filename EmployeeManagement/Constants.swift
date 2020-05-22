//
//  Constants.swift
//  EmployeeManagement
//
//  Created by venkata sudhakar on 21/05/20.
//  Copyright © 2020 venkata sudhakar. All rights reserved.
//

import Foundation

struct Apis {
    static let baseUrl = "http://dummy.restapiexample.com/api/v1/"
    static let employees = "employees"
    static let employee = "employee/"
    static let create = "create"
    static let update = "update/"
    static let delete = "delete/"
    
}
struct Methods {
    static let post = "POST"
    static let put = "PUT"
    static let delete = "DELETE"

}
struct Messages {
    static let crete = "Employee has been created successfully!"
    static let update = "Employee has been updated successfully!"
    static let delete = "Employee has been deleted successfully!"
    static let error = "Unknown error has been occured while employee operation!"
}
