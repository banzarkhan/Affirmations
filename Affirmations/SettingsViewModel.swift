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
    @Published var backgroundColor: Color = .clear
    @Published var gender: String = ""
    
    private let categoryKey = "Category"
    private let genderKey = "Gender"
    
    private var colorData = ColorData()
    
    private var userDefaults = UserDefaults.standard
 
    var categoryList: [String] = ["Love", "Friendship"]
    var backgroundColorList: [String] = ["Blue", "Red"]
    var genderList: [String] = ["Male", "Female"]
    var languageList: [String] = ["English", "Russian"]
    
    func fetchCurrentSettings() {
        category = userDefaults.string(forKey: categoryKey) ?? "Love"
        backgroundColor = colorData.loadColor()
        gender = userDefaults.string(forKey: genderKey) ?? "Male"
    }
    
    func saveSettings() {
        userDefaults.set(category, forKey: categoryKey)
        colorData.saveColor(color: backgroundColor)
        userDefaults.set(gender, forKey: genderKey)
    }
    
}
