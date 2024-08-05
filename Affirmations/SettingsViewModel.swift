//
//  SettingsViewModel.swift
//  Affirmations
//
//  Created by Ariuna Banzarkhanova on 05/08/24.
//

import Foundation
import SwiftUI

class SettingsViewModel: ObservableObject {
    @Published var category: String = ""
    @Published var backgroundColor: String = ""
    @Published var gender: String = ""
    
    private let categoryKey = "Category"
    private let genderKey = "Gender"
    private let backgroundColorKey = "BackgroundColor"
    
    private var userDefaults = UserDefaults.standard
    
    var categoryList: [String] = ["Love", "Friendship"]
    var backgroundColorList: [String] = ["Blue", "Red"]
    var genderList: [String] = ["Male", "Female"]
    var languageList: [String] = ["English", "Russian"]
    
    func fetchCurrentSettings() {
        category = userDefaults.string(forKey: categoryKey) ?? "Love"
        backgroundColor = userDefaults.string(forKey: backgroundColorKey) ?? "Blue"
        gender = userDefaults.string(forKey: genderKey) ?? "Male"
    }
    
    func saveSettings() {
        userDefaults.set(category, forKey: categoryKey)
        userDefaults.set(backgroundColor, forKey: backgroundColorKey)
        userDefaults.set(gender, forKey: genderKey)
    }
    
    func selectCategory(_ category: String) {
        self.category = category
    }
}
