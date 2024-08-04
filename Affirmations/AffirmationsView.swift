//
//  AffirmationsView.swift
//  Affirmations
//
//  Created by Ariuna Banzarkhanova on 04/08/24.
//

import SwiftUI

struct AffirmationsView: View {
    @State var isSettingsOpen = false
    
    @State private var selectedCategory = "Love"
    
    @Environment(\.locale) var locale: Locale
    
    @StateObject private var viewModel = AffirmationsStore()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("redCustom")
                VStack {
                    ZStack {
                        Text(viewModel.affirmations[0].english ?? "")
                            .font(.title)
                            .multilineTextAlignment(.center)
                    }
                }
                .padding()
            }
            .ignoresSafeArea()
            .toolbar {
                Button {
                    isSettingsOpen = true
                } label: {
                    HStack {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
                }
                .navigationDestination(isPresented: $isSettingsOpen){
                    SettingsView()
                }
            }
            .onAppear {
                if let category = UserDefaults.standard.string(forKey: "Category"){
                    self.selectedCategory = category
                }
                viewModel.fetchAffirmations(category: selectedCategory)
            }
            .onChange(of: selectedCategory) { oldCategory, newCategory in
                viewModel.fetchAffirmations(category: newCategory)
            }
            
        }
    }
}

#Preview {
    AffirmationsView()
}
