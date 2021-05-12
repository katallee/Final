//
//  FinalApp.swift
//  Final
//
//  Created by Student on 5/12/21.
//

import SwiftUI

@main
struct FinalApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
