//
//  SettingsRowView.swift
//  Affirmations
//
//  Created by Ariuna Banzarkhanova on 05/08/24.
//

import SwiftUI

struct SettingsRowView: View {
    @State var rowName: String = "Text"
    @State var isChosen: Bool = false
    
    var body: some View {
        HStack {
            Text(rowName)
            Spacer()
            Label("Toggle Favorite", systemImage: "checkmark")
                .labelStyle(.iconOnly)
                .foregroundColor(isChosen ? .blue: .clear)
        }
    }
}

#Preview {
    SettingsRowView()
}
