//
//  Lesson.swift
//  Alqissa
//
//  Created by SALGARA, YESKENDIR on 10.03.24.
//

import Foundation

//public struct Sentence {
//    var value: String
//    var elements: [String]
//    var translation: [String: String]
//    var sentenceTranslation: String
//    
//    
//    public init(elements: [String], 
//         translation: [String: String],
//         sentenceTranslation: String) {
//        self.value = elements.joined(separator: " ")
//        self.elements = elements
//        self.translation = translation
//        self.sentenceTranslation = sentenceTranslation
//    }
//}

public struct Example {
    var value: String
    var translation: String
    
    public init(value: String, translation: String) {
        self.value = value
        self.translation = translation
    }
}

public struct Word {
    var value: String
    var translation: String
    var example: Example
    
    public init(value: String, translation: String, example: Example) {
        self.value = value
        self.translation = translation
        self.example = example
    }
}

public struct Lesson {
    let word: Word
    
    public init(word: Word) {
        self.word = word
    }
}
