//
//  SettingsRowView.swift
//  Affirmations
//
//  Created by Ariuna Banzarkhanova on 05/08/24.
//

import SwiftUI

struct SettingsRowView: View {
    var rowName: String = "Text"
    var isChosen: Bool = false
    var action: () -> Void
    
    var body: some View {
        HStack {
            Text(rowName)
            Spacer()
            Label("Toggle Favorite", systemImage: "checkmark")
                .labelStyle(.iconOnly)
                .foregroundColor(isChosen ? .blue: .clear)
        }
        .contentShape(Rectangle())
        .onTapGesture {
            action()
        }
    }
}

//#Preview {
//    SettingsRowView()
//}
