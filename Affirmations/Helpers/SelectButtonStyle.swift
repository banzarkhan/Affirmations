//
//  SelectButtonStyle.swift
//  Affirmations
//
//  Created by Ariuna Banzarkhanova on 02/08/24.
//

import Foundation
import SwiftUI

struct SelectButtonStyle: ButtonStyle {
    var isSelected: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(.white)
                .frame(height: 61)
                .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(isSelected ? Color.gray : Color.clear, lineWidth: 1)
                    )
            configuration.label
                .foregroundStyle(.black)
        }
        .padding(.horizontal)
    }
}
