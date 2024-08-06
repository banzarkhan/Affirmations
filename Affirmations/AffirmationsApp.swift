//
//  AffirmationsApp.swift
//  Affirmations
//
//  Created by Ariuna Banzarkhanova on 02/08/24.
//

import SwiftUI

@main
struct AffirmationsApp: App {
    let persistenceManager = PersistenceManager.shared
    
    init() {
        if UserDefaults.standard.bool(forKey: "hasLoadedSampleData") == false {
            persistenceManager.loadSampleData()
            UserDefaults.standard.set(true, forKey: "hasLoadedSampleData")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceManager.container.viewContext)
        }
    }
}
