//
//  MockLesson.swift
//  Alqissa
//
//  Created by SALGARA, YESKENDIR on 10.03.24.
//

#if DEBUG
extension Lesson {
    
    static func mockS1() -> Lesson {
        let sentenceTranslation: String = "Hi!"
        let translation: [String: String] = ["Сәлем!": "Hi!"]
        let sentence = Sentence(elements: ["Сәлем!"],
                                translation: translation,
                                sentenceTranslation: sentenceTranslation)
        
        return Lesson(sentence: sentence)
    }
    
    static func mockS2() -> Lesson {
        let sentenceTranslation: String = "Heart"
        let translation: [String: String] = ["Жүрек": "Heart"]
        let elements: [String] = ["Жүрек"]
        let sentence = Sentence(elements: elements,
                                translation: translation,
                                sentenceTranslation: sentenceTranslation)
        return Lesson(sentence: sentence)
    }
    
    static func mockS3() -> Lesson {
        let sentenceTranslation: String = "Hi!"
        let translation: [String: String] = [
            "Қалың қалай?": "How are you?"
        ]
        let sentence = Sentence(elements: ["Сәлем!", "Қалың қалай?"],
                                translation: translation,
                                sentenceTranslation: sentenceTranslation)
        return Lesson(sentence: sentence)
    }
    
}
#endif
