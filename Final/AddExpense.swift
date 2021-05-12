//
//  AddExpense.swift
//  FinalProject
//
//  Created by Kat Allee on 4/28/21.
//https://pr.to/KY9BD1/?ap=7

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
category, String
expenseAmount, Integer 16
*/
import Foundation
import SwiftUI

struct AddExpense: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    
    @State private var id = ""      //id
    @State private var name = ""
    //name
    @State private var expenseDescription = ""
    //expenseDescription
    @State private var expenseAmount = 0.0
    //expenseAmount
    let expenseCategory = ["Travel", "Supplies", "Misc"]
    //category
    var body: some View {
        NavigationView {
            Form {
                
                Section {
                    TextField("Order ID", text: $id)
                    TextField("Customer's name", text: $name)
                    //TextField("Expense Description", text: $expenseDescription)
                    //Picker("Expense Category", selection: $expenseCategory) {
                    //    ForEach(expenseCategory, id: \.self) {
                    //    Text($0)
                    //    }
                
//move let newExpense outside view
                }
                
              /*  Section {
                    NavigationLink(destination: Expenses) {
                        Text("All Expenses")
                    }
                }

                Section {
                    NavigationLink(destination: ContentView) {
                        Text("Home")
                    }
                }
                     */
            }
            //Save
            saveOrder()
        }
        .navigationBarTitle("Add New Expense")
    }
    
    func saveOrder() {
        let newExpense = Order(context: self.moc)
        //newExpense.id = UUID(self.id)
        newExpense.name = self.name
        newExpense.expenseDescription = self.expenseDescription
        //newExpense.expenseCategory = self.expenseCategory

        try? self.moc.save()

        self.presentationMode.wrappedValue.dismiss()
    }
}

 
 struct AddExpense_Previews: PreviewProvider {
    static var previews: some View {
        AddExpense()
    }
 }

