//
//  EmployeeRowView.swift
//  EmployeeManagement
//
//  Created by venkata sudhakar on 20/05/20.
//  Copyright © 2020 venkata sudhakar. All rights reserved.
//

import SwiftUI

struct EmployeeRowView: View {
    @Binding var empoloyee:Employee
    var body: some View {
        HStack{
            Image("photo")
                .resizable()
                .clipShape(Circle())
                .frame(width: 50, height: 50, alignment: .center)
                .scaledToFit()
            
            VStack(alignment: .leading, spacing: 10){
                Text("Name: \(empoloyee.name)")
                Text("Salary: \(empoloyee.salary)")
            }
            Spacer()
            VStack{
                Text("Age")
                Text(empoloyee.age)
                    .padding(.top, 10)
            }
        }
        .padding(.horizontal, -10)
        .padding()
    }
}

struct EmployeeRowView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeRowView(empoloyee: Binding.constant(Employee(id: "123", name: "sudhakar", salary: "14678", age: "45", profile: "")))
    }
}
