//
//  GenderSelectionView.swift
//  Affirmations
//
//  Created by Ariuna Banzarkhanova on 02/08/24.
//

import SwiftUI

struct GenderSelectionView: View {
    @AppStorage("NeedsOnboarding") var needsOnboarding = true
    @State var selectedGender: String? = nil
    
    var body: some View {
        ZStack {
            VStack(spacing: 50) {
                    Text("What gender best describes you?")
                        .font(.title)
                        .multilineTextAlignment(.center)
                    VStack {
                        Button("Male"){
                            selectedGender = "male"
                        }
                        .buttonStyle(SelectButtonStyle(isSelected: selectedGender == "male"))
                        Button("Female"){
                            selectedGender = "female"
                        }
                        .buttonStyle(SelectButtonStyle(isSelected: selectedGender == "female"))
                    }
                }
            .padding()
            VStack {
                Spacer()
                Button("Continue") {
                    UserDefaults.standard.set(selectedGender, forKey: "Gender")
                    needsOnboarding = false
                }
                .buttonStyle(OnboardingButtonStyle(isSelected: selectedGender != nil))
                .disabled(selectedGender == nil)
            }
        }
    }
}

#Preview {
    GenderSelectionView()
}
