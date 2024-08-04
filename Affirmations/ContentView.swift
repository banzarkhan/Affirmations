//
//  ContentView.swift
//  Affirmations
//
//  Created by Ariuna Banzarkhanova on 02/08/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("NeedsOnboarding") var needsOnboarding = true
    
    @State var isSettingsOpen = false
    
    var affirmations: [String] = [
        "I am worthy of love and deserve to receive love in abundance",
        "My heart is open to giving and receiving love",
        "I am surrounded by love every day and in every way",
        "I attract love and loving relationships into my life",
        "Love flows to me and through me effortlessly",
        "I radiate love and others reflect love back to me"
    ]
    
    @State private var currentIndex = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.redCustom
                VStack {
                    ZStack {
                        Text(affirmations[currentIndex])
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
            .fullScreenCover(isPresented: $needsOnboarding) {
                OnboardingView()
            }
        }
    }
}

#Preview {
    ContentView()
}
