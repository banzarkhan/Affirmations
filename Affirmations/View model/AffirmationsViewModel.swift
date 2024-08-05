//
//  AffirmationsStore.swift
//  Affirmations
//
//  Created by Ariuna Banzarkhanova on 04/08/24.
//

import Foundation
import CoreData
import SwiftUI


class AffirmationsViewModel: ObservableObject {
    
    @Published var affirmations: [Affirmation] = []
    @Published var backgroundColor: Color = .blueCustom
    
    init() {
        fetchAffirmations()
    }
    
    func fetchAffirmations() {
        let category = UserDefaults.standard.string(forKey: "Category")
        
        let request = NSFetchRequest<Affirmation>(entityName: "Affirmation")
        
        if let category = category {
            request.predicate = NSPredicate(format: "category == %@", category)
        }
        
        do {
            affirmations = try PersistenceManager.shared.container.viewContext.fetch(request)
        } catch {
            print("Error fetching. \(error)")
        }
    }
    
    func addAffirmation(id: UUID, category: String, english: String, russian: String) {
        let newAffirmation = Affirmation(context: PersistenceManager.shared.container.viewContext)
        newAffirmation.id = id
        newAffirmation.category = category
        newAffirmation.english = english
        newAffirmation.russian = russian
        saveChanges()
    }
    
    func updateAffirmation(affirmation: Affirmation) {
        
    }
    
    func deleteAffirmation(affirmation: Affirmation) {
        
    }
    
    func deleteAffirmation(offsets: IndexSet) {
        
    }
    
    func saveChanges() {
        PersistenceManager.shared.saveContext() { error in
            guard error == nil else {
                print("An error occurred while saving: \(error!)")
                return
            }
            self.fetchAffirmations()
        }
    }
    
    func setBackgroundColor() {
        if let colorName = UserDefaults.standard.string(forKey: "BackgroundColor") {
            self.backgroundColor = getColor(from: colorName)
        }
    }
    
    private func getColor(from name: String) -> Color {
        switch name {
        case "Blue":
            return .blueCustom
        case "Red":
            return .redCustom
        default:
            return .clear
        }
    }
}
