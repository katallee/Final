import Foundation
import SwiftUI

struct Orders: View {
    

    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Order.id, ascending: true)],
        animation: .default)
    private var order: FetchedResults<Order>
    
    @State private var showingAddOrder = false

    var body: some View {
        NavigationView {
            Form {
                Section {
                    NavigationLink (destination: AddOrder) {
                        Text("Add New Order")
                    }
                }
                
                List {
                    ForEach(order, id: \.self) { order in
                        NavigationLink(destination: OrderDetails(Order: order)) {
                            .font(.largeTitle)

                            VStack(alignment: .leading) {
                                NavigationLink(destination: OrderDetails) {
                                    Text(order.id)
                                }
                                Text(order.description ?? "Unknown")
                                    .font(.headline)
                                Text(order.quote ?? "Unknown")
                                    .foregroundColor(.secondary)
                                Text(order.customer ?? "Unknown")
                                Text(order.phone ?? "Unknown")
                            }
                        }
                    }
                }
                
                Section {
                    NavigationLink(destination: ContentView) {
                        Text("Home")
                    }
                }
        }
        .navigationBarTitle("Orders")
        .navigationBarItems(leading: EditButton(), trailing: Button(action: {
            self.showingAddOrder.toggle()
        }) {
            Image(systemName: "plus")
        })
        .sheet(isPresented: $showingAddOrder) {
            AddOrder().environment(\.managedObjectContext, self.moc)
        }
    }
}
 
 struct Orders_Previews: PreviewProvider {
    static var previews: some View {
        Orders()
    }
 }

}
