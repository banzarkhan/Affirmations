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
                VStack {
                    ZStack {
                        Text(locale == "English" ? affirmationsVM.affirmations[0].english ?? "" : affirmationsVM.affirmations[0].russian ?? "")
                            .font(.title)
                            .fontWeight(.semibold)
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
                affirmationsVM.fetchAffirmations()
                affirmationsVM.setBackgroundColor()
                locale = Locale.current.language.languageCode?.identifier == "en" ? "English" : "Русский"
            }
        }
    }
}

#Preview {
    AffirmationsView()
}
