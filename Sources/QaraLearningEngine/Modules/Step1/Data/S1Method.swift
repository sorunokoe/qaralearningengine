//
//  S1Method.swift
//  Alqissa
//
//  Created by SALGARA, YESKENDIR on 10.03.24.
//

import Foundation

public struct S1Method {
    let voice: String
    let value: String
    let answer: String
    let variants: [String]
    let title: String
    let icon: String
    
    public init(voice: String, value: String, answer: String, variants: [String], title: String, icon: String) {
        self.voice = voice
        self.value = value
        self.answer = answer
        self.variants = variants
        self.title = title
        self.icon = icon
    }
}
