//
//  BackgroundColorSelectionView.swift
//  Affirmations
//
//  Created by Ariuna Banzarkhanova on 02/08/24.
//

import SwiftUI

struct BackgroundColorSelectionView: View {
    @State var selectedBackground: String? = nil
    @State var isOpenNextView = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack(spacing: 50) {
                    Text("Pick a background colour you like")
                        .font(.title)
                        .multilineTextAlignment(.center)
                    VStack {
                        Button("Blue"){
                            selectedBackground = "customBlue"
                        }
                        .buttonStyle(SelectButtonStyle(isSelected: selectedBackground == "blue"))
                        Button("Red"){
                            selectedBackground = "customRed"
                        }
                        .buttonStyle(SelectButtonStyle(isSelected: selectedBackground == "red"))
                    }
                }
                .padding()
                VStack {
                    Spacer()
                    Button("Continue") {
                        UserDefaults.standard.set(selectedBackground, forKey: "BackgroundColor")
                        isOpenNextView = true
                    }
                    .buttonStyle(OnboardingButtonStyle(isSelected: selectedBackground != nil))
                    .disabled(selectedBackground == nil)
                    .navigationDestination(isPresented: $isOpenNextView){
                        GenderSelectionView()
                    }
                }
            }
        }
    }
}

#Preview {
    BackgroundColorSelectionView()
}
