//
//  Font.swift
//  Todo
//
//  Created by 상선 on 11/12/23.
//

import SwiftUI

enum Pretendard: String {
    case medium = "Pretendard-Medium"
    case reguler = "Pretendard-Regular"
    case semiBold = "Pretendard-SemiBold"
}

enum Steretch: String {
    case pro = "StretchProRegular"
}

extension Font {
    struct Todo {
        static var title: Font { .custom(Steretch.pro.rawValue, size: 24) }
        static var sb16: Font { .custom(Pretendard.semiBold.rawValue, size: 16) }
        static var m16: Font { .custom(Pretendard.medium.rawValue, size: 16)}
        static var r16: Font { .custom(Pretendard.reguler.rawValue, size: 16)}
        static var m13: Font { .custom(Pretendard.medium.rawValue, size: 13)}
        static var r12: Font { .custom(Pretendard.reguler.rawValue, size: 12)}
    }
}
