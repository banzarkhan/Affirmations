//
//  SettingsView.swift
//  Affirmations
//
//  Created by Ariuna Banzarkhanova on 03/08/24.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    
    @StateObject var settingsVM = SettingsViewModel()
    
    var body: some View {
        NavigationStack{
            VStack{
                List {
                    Section {
                        ForEach(settingsVM.categoryList, id: \.self) { item in
                            SettingsRowView(rowName: item, isChosen: settingsVM.category == item) {
                                settingsVM.category = item
                            }
                        }
                    } header: {
                        Text("Category")
                    }
                    
                    Section {
                        ForEach(settingsVM.backgroundColorList, id: \.self) { item in
                            SettingsRowView(rowName: item, isChosen: settingsVM.backgroundColor == item) {
                                settingsVM.backgroundColor = item
                            }
                        }
                    } header: {
                        Text("Background colour")
                    }
                    Section {
                        ForEach(settingsVM.genderList, id: \.self) { item in
                            SettingsRowView(rowName: item, isChosen: settingsVM.gender == item){
                                settingsVM.gender = item
                            }
                        }
                    } header: {
                        Text("Gender")
                    }
                    
                    Section {
                        ForEach(settingsVM.languageList, id: \.self) { item in
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
                    settingsVM.saveSettings()
                }
            }
            .onAppear {
                settingsVM.fetchCurrentSettings()
            }
        }
    }
}

#Preview {
    SettingsView()
}
