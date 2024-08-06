//
//  AffirmationView.swift
//  Affirmations
//
//  Created by Ariuna Banzarkhanova on 06/08/24.
//

import SwiftUI

struct AffirmationView: View {
    var affirmation = ""
    
    var body: some View {
        VStack {
            Spacer()
            Text(affirmation)
                .font(.title)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
            Spacer()
        }
    }
}

#Preview {
    AffirmationView()
}
