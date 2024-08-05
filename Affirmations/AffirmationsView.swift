//
//  AffirmationsView.swift
//  Affirmations
//
//  Created by Ariuna Banzarkhanova on 04/08/24.
//

import SwiftUI

struct AffirmationsView: View {
    @State var isSettingsOpen = false
    
    @Environment(\.locale) var locale: Locale
    
    @StateObject private var affirmationsVM = AffirmationsViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(affirmationsVM.backgroundColor)
                VStack {
                    ZStack {
                        Text(affirmationsVM.affirmations[0].english ?? "")
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
                affirmationsVM.fetchAffirmations()
                affirmationsVM.setBackgroundColor()
            }
        }
    }
}

#Preview {
    AffirmationsView()
}
