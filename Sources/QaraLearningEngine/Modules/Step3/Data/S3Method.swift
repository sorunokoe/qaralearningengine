//
//  S3Method.swift
//  Alqissa
//
//  Created by SALGARA, YESKENDIR on 16.03.24.
//

import Foundation

public struct S3Method {
    let voice: String
    let answer: String
    let variants: [String]
    let title: String
    let icon: String
    var isNewWord: Bool = false
    
    public init(voice: String, answer: String, variants: [String], title: String, icon: String, isNewWord: Bool) {
        self.voice = voice
        self.answer = answer
        self.variants = variants
        self.title = title
        self.icon = icon
        self.isNewWord = isNewWord
    }
}
