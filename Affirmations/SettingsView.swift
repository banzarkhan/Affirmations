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
                            let localized = NSLocalizedString(item, comment: "")
                            SettingsRowView(rowName: localized, isChosen: settingsVM.category == item) {
                                settingsVM.category = item
                            }
                        }
                    } header: {
                        Text("Category")
                    }
                    
                    Section {
                        ForEach(settingsVM.backgroundColorList, id: \.self) { item in
                            let localized = NSLocalizedString(item, comment: "")
                            SettingsRowView(rowName: localized, isChosen: settingsVM.backgroundColor == item) {
                                settingsVM.backgroundColor = item
                            }
                        }
                    } header: {
                        Text("Background color")
                    }
                    Section {
                        ForEach(settingsVM.genderList, id: \.self) { item in
                            let localized = NSLocalizedString(item, comment: "")
                            SettingsRowView(rowName: localized, isChosen: settingsVM.gender == item){
                                settingsVM.gender = item
                            }
                        }
                    } header: {
                        Text("Gender")
                    }
                    
                    Section {
                        HStack {
                            Text(settingsVM.currentLanguage)
                            Spacer()
                            Label("Open settings", systemImage: "chevron.right")
                                .labelStyle(.iconOnly)
                                .foregroundColor(.blue)
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            settingsVM.openSettings()
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
