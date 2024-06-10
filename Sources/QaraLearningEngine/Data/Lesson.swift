//
//  Lesson.swift
//  Alqissa
//
//  Created by SALGARA, YESKENDIR on 10.03.24.
//

import Foundation

public struct Sentence {
    var value: String
    var elements: [String]
    var translation: [String: String]
    var sentenceTranslation: String
    
    
    public init(elements: [String], 
         translation: [String: String],
         sentenceTranslation: String) {
        self.value = elements.joined(separator: " ")
        self.elements = elements
        self.translation = translation
        self.sentenceTranslation = sentenceTranslation
    }
}


public struct Lesson {
    let sentence: Sentence
    
    public init(sentence: Sentence) {
        self.sentence = sentence
    }
}
