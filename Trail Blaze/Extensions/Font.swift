//
//  Font.swift
//  Fixel Support
//
//  Created by Udani Fernando on 23/09/2024.
//

import Foundation
import SwiftUI

extension Font {
    static func roboto(_ type: RobotoFontType, size: CGFloat = 12) -> Font {
            return .custom(type.fontName, size: size)
        }
}

enum RobotoFontType: String {
    case regular = "Roboto-Regular"
    case bold = "Roboto-Bold"
    case italic = "Roboto-Italic"
    case thin = "Roboto-Thin"
    case thinItalic = "Roboto-ThinItalic"
    case light = "Roboto-Light"
    case lightItalic = "Roboto-LightItalic"
    case medium = "Roboto-Medium"
    case mediumItalic = "Roboto-MediumItalic"
    case boldItalic = "Roboto-BoldItalic"
    case black = "Roboto-Black"
    case blackItalic = "Roboto-BlackItalic"
    
    var fontName: String {
        return self.rawValue
    }
}
