//
//  SettingsView.swift
//  Affirmations
//
//  Created by Ariuna Banzarkhanova on 03/08/24.
//

import SwiftUI

struct SettingsView: View {
    private var categoryList: [String] = ["Love", "Friendship"]
    private var backgroundColorList: [String] = ["Blue", "Red"]
    private var genderList: [String] = ["Male", "Female"]
    private var languageList: [String] = ["English", "Russian"]
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack{
            VStack{
                List {
                    Section {
                        ForEach(categoryList, id: \.self) { item in
                            Text(item)
                        }
                    } header: {
                        Text("Category")
                    }
                    
                    Section {
                        ForEach(backgroundColorList, id: \.self) { item in
                            Text(item)
                        }
                    } header: {
                        Text("Background colour")
                    }
                    Section {
                        ForEach(genderList, id: \.self) { item in
                            Text(item)
                        }
                    } header: {
                        Text("Gender")
                    }
                    
                    Section {
                        ForEach(languageList, id: \.self) { item in
                            Text(item)
                        }
                    } header: {
                        Text("Language")
                    }
                }
            }
            .navigationTitle("Settings")
            .toolbar {
                Button("Done") {
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}
