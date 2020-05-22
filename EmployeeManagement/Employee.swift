//
//  Employee.swift
//  EmployeeManagement
//
//  Created by venkata sudhakar on 20/05/20.
//  Copyright © 2020 venkata sudhakar. All rights reserved.
//

import Foundation

struct Employee:Codable,Identifiable,Hashable {
    
    let id:String?
    let name, salary, age: String
    let profile: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "employee_name"
        case salary = "employee_salary"
        case age = "employee_age"
        case profile = "profile_image"
    }
}
struct Employees:Codable {
    let status:Status
    let data:[Employee]
}
struct EmployeeData:Codable {
    let status:Status
}
enum Status:String,Codable{
    case failed = "failed"
    case success = "success"
}
