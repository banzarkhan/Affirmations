//
//  AffirmationsView.swift
//  Affirmations
//
//  Created by Ariuna Banzarkhanova on 04/08/24.
//

import SwiftUI

struct AffirmationsView: View {
    @State var isSettingsOpen = false
    
    @StateObject private var affirmationsVM = AffirmationsViewModel()
    
    @State var locale: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(affirmationsVM.backgroundColor)
                    .ignoresSafeArea()
                ScrollView(.vertical) {
                    VStack {
                        ForEach(affirmationsVM.affirmations, id: \.self){ affirmation in
                            AffirmationView(affirmation: locale == "English" ? affirmation.english ?? "" : affirmation.russian ?? "")
                                .containerRelativeFrame(.vertical)
                        }
                    }
                    .scrollTargetLayout()
                    .padding()
                }
                .ignoresSafeArea()
                .scrollTargetBehavior(.paging)
            }
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
                affirmationsVM.setBackgroundColor()
                affirmationsVM.fetchAffirmations()
                locale = Locale.current.language.languageCode?.identifier == "en" ? "English" : "Русский"
            }
            .toolbarBackground(Color(affirmationsVM.backgroundColor), for: .navigationBar)
        }
    }
}

#Preview {
    AffirmationsView()
}
