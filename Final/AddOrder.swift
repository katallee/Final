//
//  AddOrder.swift
//  FinalProject
//
//  Created by Kat Allee on 4/28/21.
//https://pr.to/KY9BD1/?ap=3

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

struct AddOrder: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode

    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Order.id, ascending: true)],
        animation: .default)
    private var order: FetchedResults<Order>
    
    @State private var id = 0
    @State private var orderDescription = ""
    @State private var quote = 0.00
    @State private var name = ""
    @State private var phone = 0

    var body: some View {
        NavigationView {
            Form {
                /*
                Section {
                    //TextField("Order ID", text: $id)
                    TextField("Customer's name", text: $name)
                    TextField("Order Description", text: $orderDescription)
                    //TextField("Customer's Phone Number", text: $phone)
                    //TextField("Initial Quote", text: $quote)

                    //Save
                    let newOrder = Order(context: self.moc)
                    //newOrder.id = UUID(self.id)
                    newOrder.name = self.name
                    newOrder.orderDescription = self.orderDescription
                    //newOrder.quote = NSDecimalNumber(self.quote)
                    newOrder.phone = Int16(self.phone)
                    try? self.moc.save()

                    //self.presentationMode.wrappedValue.dismiss()
                }
                */
/*
                Section {
                    NavigationLink(destination: Orders) {
                        Text("All Orders")
                    }
                }

                Section {
                    NavigationLink(destination: ContentView) {
                        Text("Home")
                    }
                }
 */
 }
        }
        .navigationBarTitle("Add New Order")
    }
}

 
 struct AddOrder_Previews: PreviewProvider {
    static var previews: some View {
        AddOrder()
    }
 }

