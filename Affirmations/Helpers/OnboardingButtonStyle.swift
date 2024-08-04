//
//  OnboardingButtonStyle.swift
//  Affirmations
//
//  Created by Ariuna Banzarkhanova on 02/08/24.
//

import Foundation
import SwiftUI

struct OnboardingButtonStyle: ButtonStyle {
    var isSelected: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(isSelected ? .redCustom : .gray)
                .frame(height: 61)
            configuration.label
                .foregroundStyle(isSelected ? .black : .secondary)
        }
        .padding()
    }
}
