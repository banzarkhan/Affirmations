//
//  AffirmationsStore.swift
//  Affirmations
//
//  Created by Ariuna Banzarkhanova on 04/08/24.
//

import Foundation
import CoreData


class AffirmationsStore: ObservableObject {
    
    @Published var affirmations: [Affirmation] = []
    
    init() {
        fetchAffirmations()
    }
    
    func fetchAffirmations(category: String? = nil) {
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
    
    func updateLearner(affirmation: Affirmation) {
        
    }
    
    func deleteLearner(affirmation: Affirmation) {
        
    }
    
    func deleteLearner(offsets: IndexSet) {
        
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
}
