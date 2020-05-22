import SwiftUI

struct EmployeeListView: View {
    @ObservedObject private var vm = EmployeeViewModel()
    
    var body: some View {
        LoadingView(isShowing: Binding.constant(vm.loading)) {
            NavigationView {
                List{
                    ForEach(self.vm.employees, id: \.self){ employee in
                        NavigationLink(destination: EmployeeDetailView(employee: employee)) {
                            EmployeeRowView(empoloyee: Binding.constant(employee))
                        }
                    }
                    .listRowInsets(EdgeInsets())
                }.edgesIgnoringSafeArea(.bottom)
                    .navigationBarTitle("Employees",displayMode: .inline)
                    .foregroundColor(.red)
                .navigationBarItems(trailing:
                    NavigationLink(destination: EmployeeDetailView(isNewEmployee: true), label: {
                        Image(systemName: "plus")
                        .font(.headline)
                    })
                    
                    
                )
            }
            .onAppear {
                self.vm.fetchEmployees()
            }
        }
        
    }
}

struct EmployeeListView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeListView()
    }
}
