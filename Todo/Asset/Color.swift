//
//  Color.swift
//  Todo
//
//  Created by 상선 on 11/12/23.
//

import SwiftUI

extension Color {
    struct Todo {
        static let snow: Color = Color(hex: "#FFFFFF")
        static let black: Color = Color(hex: "#000000")
        static let grayGuGu: Color = Color(hex: "#999999")
        static let grayAbby: Color = Color(hex: "#ABABAB")
        static let grayCeci: Color = Color(hex: "#CCCCCC")
        static let grayEunbi: Color = Color(hex: "#EBEBEB")
        static let grayFry: Color = Color(hex: "#F6F6F6")
        
        static let red: Color = Color(hex: "#FF3434")
        static let pink: Color = Color(hex: "#FFD2D2")
        static let blue: Color = Color(hex: "#5182FF")
        static let skyblue: Color = Color(hex: "#E2EFFF")
        static let lightblue: Color = Color(hex: "#F8FBFF")
        static let ashblue: Color = Color(hex: "#C9DBF0")
    }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >>  8) & 0xFF) / 255.0
        let b = Double((rgb >>  0) & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
}
