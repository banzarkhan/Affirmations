//
//  PersistenceManager.swift
//  Affirmations
//
//  Created by Ariuna Banzarkhanova on 04/08/24.
//

import Foundation
import CoreData
import Combine

struct PersistenceManager {
    
    static let shared = PersistenceManager()
    
    static var preview: PersistenceManager = {
        let result = PersistenceManager(inMemory: true)
        let viewContext = result.container.viewContext
        return result
    }()
    
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Affirmations")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
    
    func saveContext(completionHandler: @escaping (Error?) -> Void) {
        if PersistenceManager.shared.container.viewContext.hasChanges {
            do {
                try PersistenceManager.shared.container.viewContext.save()
                completionHandler(nil)
            } catch {
                completionHandler(error)
            }
        }
    }
    
    func loadSampleData() {
        let affirmationsStore = AffirmationsStore()
        
        let loveAffirmations = [
            ("I am worthy of love and deserve to receive love in abundance", "Я достойна любви и заслуживаю получать её в изобилии"),
            ("My heart is open to giving and receiving love", "Моё сердце открыто для дарения и получения любви"),
            ("I am surrounded by love every day and in every way", "Меня окружает любовь каждый день и во всех отношениях"),
            ("I attract love and loving relationships into my life", "Я привлекаю любовь и любящие отношения в свою жизнь"),
            ("Love flows to me and through me effortlessly", "Любовь течёт ко мне и через меня без усилий"),
            ("I radiate love and others reflect love back to me", "Я излучаю любовь, и другие отражают её обратно ко мне"),
            ("My relationships are filled with love, happiness, and respect", "Мои отношения наполнены любовью, счастьем и уважением"),
            ("I am grateful for the love that surrounds me", "Я благодарна за любовь, которая меня окружает"),
            ("Love comes to me easily and effortlessly", "Любовь приходит ко мне легко и без усилий"),
            ("I am a magnet for loving and fulfilling relationships", "Я магнит для любящих и удовлетворяющих отношений")
        ]
        
        let friendshipAffirmations = [
            ("I am surrounded by supportive and loving friends", "Меня окружают поддерживающие и любящие друзья"),
            ("I attract positive and loyal friendships into my life", "Я привлекаю позитивные и верные дружеские отношения в свою жизнь"),
            ("My friends and I share mutual respect and trust", "Мои друзья и я делимся взаимным уважением и доверием"),
            ("I am a kind and caring friend, and I receive the same in return", "Я добрый и заботливый друг, и получаю то же самое в ответ"),
            ("My friendships are filled with joy, laughter, and understanding", "Мои дружеские отношения наполнены радостью, смехом и пониманием"),
            ("I am grateful for the amazing friends in my life", "Я благодарна за удивительных друзей в моей жизни"),
            ("I nurture and cherish my friendships", "Я поддерживаю и дорожу своими дружескими отношениями"),
            ("I attract friends who support and uplift me", "Я привлекаю друзей, которые поддерживают и вдохновляют меня"),
            ("My friends and I grow together in love and harmony", "Мои друзья и я растём вместе в любви и гармонии"),
            ("I am a magnet for genuine and lasting friendships", "Я магнит для искренних и долгих дружеских отношений")
        ]
        
        for (english, russian) in loveAffirmations {
            affirmationsStore.addAffirmation(id: UUID(), category: "Love", english: english, russian: russian)
        }
        
        for (english, russian) in friendshipAffirmations {
            affirmationsStore.addAffirmation(id: UUID(), category: "Friendship", english: english, russian: russian)
        }
    }
}
