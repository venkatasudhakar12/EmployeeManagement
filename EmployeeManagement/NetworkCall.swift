//
//  NetworkCall.swift
//  EmployeeManagement
//
//  Created by venkata sudhakar on 21/05/20.
//  Copyright © 2020 venkata sudhakar. All rights reserved.
//

import Foundation

class NetworkCall {
    static let shared = NetworkCall()
    private init (){
        
    }
    func getAllEmployees(completion:@escaping (Bool,[Employee]?)->Void){
        let url = URL(string: Apis.baseUrl + Apis.employees)!
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else{
                completion(false,nil)
                return
            }
            do{
                let employees = try JSONDecoder().decode(Employees.self, from: data)
                if employees.status == .success {
                    completion(true,employees.data)
                }else{
                    completion(false,nil)
                }
            }catch{
                completion(false,nil)
            }
        }.resume()
    }
    
    func createEmployee(employeeData:Data ,completion:@escaping (Bool)->Void){
        let url = URL(string: Apis.baseUrl + Apis.create)!
        var request = URLRequest(url: url)
        request.httpMethod = Methods.post
        request.httpBody = employeeData
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            guard let data = data else{
                completion(false)
                return
            }
            do {
                let emp = try JSONDecoder().decode(EmployeeData.self, from: data)
                if emp.status == .success {
                    completion(true)
                }else{
                    completion(false)
                }
            }catch{
                completion(false)
            }
        }.resume()
    }
    func updateEmployee(id:String,employeeData:Data ,completion:@escaping (Bool)->Void){
        let url = URL(string: Apis.baseUrl + Apis.update + id)!
        var request = URLRequest(url: url)
        request.httpMethod = Methods.put
        request.httpBody = employeeData
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            guard let data = data else{
                completion(false)
                return
            }
            do {
                let emp = try JSONDecoder().decode(EmployeeData.self, from: data)
                if emp.status == .success {
                    completion(true)
                }else{
                    completion(false)
                }
            }catch{
                completion(false)
            }
        }.resume()
    }
    func deleteEmployee(id:String ,completion:@escaping (Bool)->Void){
           let url = URL(string: Apis.baseUrl + Apis.delete + id)!
           var request = URLRequest(url: url)
           request.httpMethod = Methods.delete
           URLSession.shared.dataTask(with: request) { (data, response, error) in
               guard let data = data else{
                   completion(false)
                   return
               }
               do{
                   let employees = try JSONDecoder().decode(EmployeeData.self, from: data)
                   if employees.status == .success {
                       completion(true)
                   }else{
                       completion(false)
                   }
               }catch{
                   completion(false)
               }
           }.resume()
       }
}
