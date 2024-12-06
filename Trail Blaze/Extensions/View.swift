//
//  View.swift
//  Fixel Support
//
//  Created by Udani Fernando on 25/09/2024.
//

import Foundation
import SwiftUI

// Helper to round specific corners
extension View {
    
    func getScreenWidth() -> CGFloat{
        return UIScreen.main.bounds.width
    }
    
    func getScreenHeight() -> CGFloat{
        return UIScreen.main.bounds.height
    }
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
