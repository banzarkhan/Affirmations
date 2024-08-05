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
    @Published var currentLanguage = ""
    
    private let categoryKey = "Category"
    private let genderKey = "Gender"
    private let backgroundColorKey = "BackgroundColor"
    
    private var userDefaults = UserDefaults.standard
    
    var categoryList: [String] = ["Love", "Friendship"]
    var backgroundColorList: [String] = ["Blue", "Red"]
    var genderList: [String] = ["Male", "Female"]
    var languageList: [String] = ["English", "Русский"]
    
    func fetchCurrentSettings() {
        category = userDefaults.string(forKey: categoryKey) ?? "Love"
        backgroundColor = userDefaults.string(forKey: backgroundColorKey) ?? "Blue"
        gender = userDefaults.string(forKey: genderKey) ?? "Male"
        currentLanguage = Locale.current.language.languageCode?.identifier == "en" ? "English" : "Русский"
    }
    
    func saveSettings() {
        userDefaults.set(category, forKey: categoryKey)
        userDefaults.set(backgroundColor, forKey: backgroundColorKey)
        userDefaults.set(gender, forKey: genderKey)
    }
    
    func openSettings() {
            if let url = URL(string: UIApplication.openSettingsURLString) {
                if UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            }
        }
}
