//
//  Lesson.swift
//  Alqissa
//
//  Created by SALGARA, YESKENDIR on 10.03.24.
//

import Foundation


enum Language {
    case rus, eng
}

struct Sentence {
    var value: String
    var elements: [String]
    var translations: [String: [Language: String]]
    var sentenceTranslation: [Language: String]
    
    
    init(elements: [String], 
         translations: [String: [Language: String]],
         sentenceTranslation: [Language: String]) {
        self.value = elements.joined(separator: " ")
        self.elements = elements
        self.translations = translations
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
