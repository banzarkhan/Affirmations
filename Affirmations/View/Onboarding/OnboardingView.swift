//
//  OnboardingView.swift
//  Affirmations
//
//  Created by Ariuna Banzarkhanova on 03/08/24.
//

import SwiftUI

struct OnboardingView: View {
    
    var body: some View {
        ZStack {
            Color.blueCustom
                .ignoresSafeArea()
            VStack {
                CategorySelectionView()
            }
        }
    }
}

#Preview {
    OnboardingView()
}
