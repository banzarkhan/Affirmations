//
//  BackgroundColorSelectionView.swift
//  Affirmations
//
//  Created by Ariuna Banzarkhanova on 02/08/24.
//

import SwiftUI

struct BackgroundColorSelectionView: View {
    @State var selectedBackground: String = ""
    @State var isSelected = false
    @State var isOpenNextView = false
    
    private var colorData = ColorData()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.blueCustom
                    .ignoresSafeArea()
                VStack(spacing: 50) {
                    Text("Pick a background colour you like")
                        .font(.title)
                        .multilineTextAlignment(.center)
                    VStack {
                        Button("Blue"){
                            isSelected = true
                        }
                        .buttonStyle(SelectButtonStyle(isSelected: selectedBackground == "Blue"))
                        Button("Red"){
                            selectedBackground = "Red"
                            isSelected = true
                        }
                        .buttonStyle(SelectButtonStyle(isSelected: selectedBackground == "Red"))
                    }
                }
                .padding()
                VStack {
                    Spacer()
                    Button("Continue") {
                        UserDefaults.standard.set(selectedBackground, forKey: "BackgroundColor")
                        isOpenNextView = true
                    }
                    .buttonStyle(OnboardingButtonStyle(isSelected: isSelected))
                    .disabled(!isSelected)
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
