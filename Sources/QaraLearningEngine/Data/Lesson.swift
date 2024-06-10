//
//  Lesson.swift
//  Alqissa
//
//  Created by SALGARA, YESKENDIR on 10.03.24.
//

import Foundation

struct Sentence {
    var value: String
    var elements: [String]
    var translation: [String: String]
    var sentenceTranslation: String
    
    
    init(elements: [String], 
         translation: [String: String],
         sentenceTranslation: String) {
        self.value = elements.joined(separator: " ")
        self.elements = elements
        self.translation = translation
        self.sentenceTranslation = sentenceTranslation
    }
}

struct Explanation {
    var value: String
    var examples: [String]
}


struct Lesson {
    let sentence: Sentence
}
