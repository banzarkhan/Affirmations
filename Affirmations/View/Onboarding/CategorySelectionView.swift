//
//  CategorySelectionView.swift
//  Affirmations
//
//  Created by Ariuna Banzarkhanova on 02/08/24.
//

import SwiftUI

struct CategorySelectionView: View {
    @State private var selectedCategory: String? = nil
    @State var isOpenNextView = false
    
    var body: some View {
        NavigationStack{
            ZStack {
                Color.blueCustom
                VStack(spacing: 50) {
                    Text("What area of your life would you like to improve?")
                        .font(.title)
                        .multilineTextAlignment(.center)
                    VStack {
                        Button("Love") {
                            selectedCategory = "Love"
                        }
                        .buttonStyle(SelectButtonStyle(isSelected: selectedCategory == "Love"))
                        Button("Friendship") {
                            selectedCategory = "Friendship"
                        }
                        .buttonStyle(SelectButtonStyle(isSelected: selectedCategory == "Friendship"))
                    }
                }
                .padding()
                VStack {
                    Spacer()
                    Button("Continue") {
                        UserDefaults.standard.set(selectedCategory, forKey: "Category")
                        isOpenNextView = true
                    }
                    .buttonStyle(OnboardingButtonStyle(isSelected: selectedCategory != nil))
                    .disabled(selectedCategory == nil)
                    .navigationDestination(isPresented: $isOpenNextView){
                        BackgroundColorSelectionView()
                    }
                }
            }
        }
    }
}

#Preview {
    CategorySelectionView()
}
