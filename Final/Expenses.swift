//
//  Expenses.swift
//  FinalProject
//
//  Created by Kat Allee on 4/28/21.
//https://pr.to/KY9BD1/?ap=6

/*
for core data model
Example:
open FinalProject-1.xcdatamodeld and add a new entity called "Order" Add Attributes:
id, UUID - distinguish between orders
description, String- description of order
quote, Integer 16 - quote
name, String
phone, Integer 16
expenseDescription, String
expenseCategory, String
expenseAmount, Integer 16
*/
import Foundation
import SwiftUI

struct Expenses: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode

    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Order.id, ascending: true)],
        animation: .default)
    private var order: FetchedResults<Order>

    @State private var showingAddExpense = false

    var body: some View {
        NavigationView {
            Form {
                Section {
                    NavigationLink (destination: AddExpense) {
                        Text("Add New Expense")
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
                                Text(order.name ?? "Unknown")
                                    .font(.headline)
                                Text(order.expenseAmount ?? "Unknown")
                                    .foregroundColor(.secondary)
                                Text(order.expenseCategory ?? "Unknown")
                                Text(order.expenseDescription ?? "Unknown")
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
        .navigationBarTitle("Expenses")
        .navigationBarItems(leading: EditButton(), trailing: Button(action: {
            self.showingAddExpense.toggle()
        }) {
            Image(systemName: "plus")
        })
        .sheet(isPresented: $showingAddExpense) {
            AddExpense().environment(\.managedObjectContext, self.moc)
        }
    }
}

 
 struct Expenses_Previews: PreviewProvider {
    static var previews: some View {
        Expenses()
    }
 }

}
