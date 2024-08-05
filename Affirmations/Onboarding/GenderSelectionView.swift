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
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color.blueCustom
                .ignoresSafeArea()
            VStack(spacing: 50) {
                    Text("What gender best describes you?")
                        .font(.title)
                        .multilineTextAlignment(.center)
                    VStack {
                        Button("Male"){
                            selectedGender = "Male"
                        }
                        .buttonStyle(SelectButtonStyle(isSelected: selectedGender == "Male"))
                        Button("Female"){
                            selectedGender = "Female"
                        }
                        .buttonStyle(SelectButtonStyle(isSelected: selectedGender == "Female"))
                    }
                }
            .padding()
            VStack {
                Spacer()
                Button("Continue") {
                    UserDefaults.standard.set(selectedGender, forKey: "Gender")
                    needsOnboarding = false
                    dismiss()
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
