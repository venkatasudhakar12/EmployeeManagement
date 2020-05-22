//
//  EmployeeDetailView.swift
//  EmployeeManagement
//
//  Created by venkata sudhakar on 21/05/20.
//  Copyright © 2020 venkata sudhakar. All rights reserved.
//

import SwiftUI

struct EmployeeDetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var name:String = ""
    @State var age:String = ""
    @State var salary:String = ""
    @ObservedObject var vm = EmployeeDetailViewModel()
    var isNewEmployee:Bool = false
    var employee:Employee?
    init(employee:Employee?){
        self.employee = employee
    }
    init(isNewEmployee:Bool) {
        self.isNewEmployee = isNewEmployee
    }
    var body: some View {
        LoadingView(isShowing: Binding.constant(vm.loading)) {
        VStack {
            Image("photo")
                .resizable()
                .frame(width: 240, height: 240)
                .clipShape(Circle())
                .scaledToFit()
            VStack{
                InputField(value: self.$name, label: "Name")
                InputField(value: self.$age, label: "Age")
                InputField(value: self.$salary, label: "Salary")
            }
            
            HStack(alignment: .center, spacing: 20) {
                Button(action: {
                    self.updateEmployee()
                    
                }) {
                    Text("Update")
                        .foregroundColor(.white)
                        .frame(width: 120, height: 40, alignment: .center)
                        .background(Color.green)
                        .cornerRadius(5)
                }
                Button(action: {
                    self.deleteEmployee()
                }) {
                    Text("Delete")
                        .foregroundColor(.white)
                        .frame(width: 120, height: 40, alignment: .center)
                        .background(Color.red)
                        .cornerRadius(5)
                    
                }
            }
            .opacity(self.isNewEmployee ? 0 : 1)
                
            .padding()
            Spacer()
            Text(self.vm.message)
                .foregroundColor(self.vm.status ? .green : .red)
            
        }.padding(.top, 10)
            .navigationBarTitle("Employee Details",displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    self.saveEmployee()
                }){
                    if self.isNewEmployee {
                        Text("Save")
                    }
                }
        )
            .onAppear {
                if let employee = self.employee {
                    self.name = employee.name
                    self.age = employee.age
                    self.salary = employee.salary
                }
            }
        .onDisappear(perform: {
            self.vm.alert = false
        })
        .alert(isPresented: Binding.constant(self.vm.alert)) {
            Alert(title: Text("Status"), message: Text(self.vm.message), dismissButton: .default(Text("OK"), action: {
                self.presentationMode.wrappedValue.dismiss()
                //
            }))
            }
        }
    }
    func saveEmployee(){
        let emp = Employee(id: nil, name: name, salary: salary, age: age, profile: nil)
        self.vm.createEmployee(employee: emp)
    }
    func updateEmployee(){
        let emp = Employee(id: employee?.id, name: name, salary: salary, age: age, profile: nil)
        self.vm.updateEmployee(employee: emp)
    }
    func deleteEmployee(){
        self.vm.deleteEmployee(employee: employee)
    }
}

struct EmployeeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeDetailView(employee: nil)
    }
}
struct InputField:View {
    @Binding var value:String
    let label:String
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            Text(label)
                .foregroundColor(.purple)
                .font(.headline)
                .fontWeight(.bold)
            TextField(label, text: $value)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }.padding(10)
    }
}

struct InputField_Previews:PreviewProvider {
    static var previews: some View {
        InputField(value: Binding.constant("Name"), label: "Name")
    }
}
