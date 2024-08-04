//
//  AffirmationsList.swift
//  Affirmations
//
//  Created by Ariuna Banzarkhanova on 04/08/24.
//

import SwiftUI

struct AffirmationsList: View {
    
    @State private var selectedCategory = UserDefaults.standard.string(forKey: "Category")
    
    @Environment(\.locale) var locale: Locale
    
    @StateObject private var viewModel = AffirmationsStore()
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Category", selection: $selectedCategory) {
                    Text("Love").tag("Love")
                    Text("Friendship").tag("Friendship")
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                List {
                    ForEach(viewModel.affirmations) { affirmation in
                        HStack {
                            Image("stefania_zinno")
                                .resizable()
                                .frame(width: 50, height: 50)
                            if locale.language.languageCode?.identifier == "en" {
                                Text(affirmation.english ?? "")
                            } else {
                                Text(affirmation.russian ?? "")
                            }
                            Spacer()
                        }
                    }
                }
                .listStyle(.plain)
                .onAppear {
                    viewModel.fetchAffirmations(category: selectedCategory)
                }
                .onChange(of: selectedCategory) { oldCategory, newCategory in
                    viewModel.fetchAffirmations(category: newCategory)
                }
            }
            .navigationTitle("Affirmations")
        }
    }
}

#Preview {
    AffirmationsList()
}
