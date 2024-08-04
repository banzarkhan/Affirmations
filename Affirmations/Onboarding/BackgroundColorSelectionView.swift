//
//  BackgroundColorSelectionView.swift
//  Affirmations
//
//  Created by Ariuna Banzarkhanova on 02/08/24.
//

import SwiftUI

struct BackgroundColorSelectionView: View {
    @State var selectedBackground: Color = .clear
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
                            selectedBackground = .blueCustom
                            isSelected = true
                        }
                        .buttonStyle(SelectButtonStyle(isSelected: selectedBackground == .blueCustom))
                        Button("Red"){
                            selectedBackground = .redCustom
                            isSelected = true
                        }
                        .buttonStyle(SelectButtonStyle(isSelected: selectedBackground == .redCustom))
                    }
                }
                .padding()
                VStack {
                    Spacer()
                    Button("Continue") {
                        colorData.saveColor(color: selectedBackground)
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
