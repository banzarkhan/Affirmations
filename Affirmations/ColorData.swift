//
//  ColorData.swift
//  Affirmations
//
//  Created by Ariuna Banzarkhanova on 04/08/24.
//

import Foundation
import SwiftUI

struct ColorData {
    private var COLOR_KEY = "COLOR_KEY"
    private var userDefaults = UserDefaults.standard
    
    func saveColor(color: Color) {
        let color = UIColor(color).cgColor
        
        if let components = color.components {
            userDefaults.set(components, forKey: COLOR_KEY)
            print("Color saved")
        }
    }
    
    func loadColor() -> Color {
        guard let array = userDefaults.object(forKey: COLOR_KEY) as? [CGFloat] else { return Color.black }
        
        let color = Color(.sRGB,
                          red: array[0],
                          green: array[1],
                          blue: array[2],
                          opacity: array[3]
        )
        
        print("Color loaded")
        return color
    }
}
