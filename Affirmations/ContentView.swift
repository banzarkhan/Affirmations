//
//  ContentView.swift
//  Affirmations
//
//  Created by Ariuna Banzarkhanova on 02/08/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("NeedsOnboarding") var needsOnboarding = true
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("redCustom")
                if needsOnboarding {
                    OnboardingView()
                } else {
                    AffirmationsView()
                }
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    ContentView()
}
