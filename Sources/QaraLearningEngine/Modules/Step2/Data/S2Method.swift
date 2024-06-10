//
//  S1Method.swift
//  Alqissa
//
//  Created by SALGARA, YESKENDIR on 14.03.24.
//

import Foundation

public struct ImageVariant {
    var id = UUID()
    var text: String
    var image: String
    
    public init(id: UUID = UUID(), text: String, image: String) {
        self.id = id
        self.text = text
        self.image = image
    }
}

public struct S2Method {
    let voice: String
    let value: String
    let answer: String
    let variants: [ImageVariant]
    let title: String
    let icon: String
    
    public init(voice: String, value: String, answer: String, variants: [ImageVariant], title: String, icon: String) {
        self.voice = voice
        self.value = value
        self.answer = answer
        self.variants = variants
        self.title = title
        self.icon = icon
    }
}
