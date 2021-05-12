//
//  ContentView.swift
//  Final
//
//  Created by Student on 5/12/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Order.id, ascending: true)],
        animation: .default)
    private var order: FetchedResults<Order>
    @State private var quotes = ["You are today where your thoughts have brought you. James Allen", "You will face many defeats in life, but never let yourself be defeated. Maya Angelou", "Know yourself and you will win all battles. Sun Tzu"]
    @State private var displayQuote = Int.random(in: 0...2)
    
    var body: some View {
            NavigationView {
                Form {
                    /*
                    Section {
                        NavigationLink (destination: /*Most Recent Order*/OrderDetails) {
                            Text("Most Recent Order")
                        }
                    }
                    */

                    Section {
                        NavigationLink (destination: Orders()) {
                            Text("Orders")
                        }
                    }
/*
                    Section {
                        NavigationLink (destination: Expenses) {
                            Text("Expenses")
                        }
                    }
                        .padding()
*/
                    Section {
                        //mood
                        HStack {
                            Text("Mood")
                            Button(action: {

                            }) {
                                Text("😀")
                            }
                            Button(action: {

                            }) {
                                Text("😐")
                            }
                            Button(action: {

                            }) {
                                Text("😢")
                            }
                            //(optional)NavigationLink(destination: TrackMood) {
                            //Text("Mood Tracker Weekly Report")
                        }
                    }
                    
                    pickQuote()
                    
                    Section {
                        VStack {
                            Text(quotes[displayQuote])
                        }
                    }
                    
                }
            }
            .navigationBarTitle("Orders and Expenses")
        
    }
    
    func pickQuote() {
        quotes.shuffle()
        displayQuote = Int.random(in: 0...2)
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
}
