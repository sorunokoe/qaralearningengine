//
//  MockLesson.swift
//  Alqissa
//
//  Created by SALGARA, YESKENDIR on 10.03.24.
//

#if DEBUG
extension Lesson {
    
    static func mockS1() -> Lesson {
        let sentenceTranslation: [Language: String] = [
            .eng: "Hi!",
            .rus: "Привет!"
        ]
        let translations: [String: [Language: String]] = ["Сәлем!": [
            .eng: "Hi!",
            .rus: "Привет!"
        ]]
        let sentence = Sentence(elements: ["Сәлем!"],
                                translations: translations,
                                sentenceTranslation: sentenceTranslation)
        
        return Lesson(sentence: sentence)
    }
    
    static func mockS2() -> Lesson {
        let sentenceTranslation: [Language: String] = [
            .eng: "Heart",
            .rus: "Сердце"
        ]
        let translations: [String: [Language: String]] = ["Жүрек": [
            .eng: "Heart",
            .rus: "Сердце"
        ]]
        let elements: [String] = ["Жүрек"]
        let sentence = Sentence(elements: elements,
                                translations: translations,
                                sentenceTranslation: sentenceTranslation)
        return Lesson(sentence: sentence)
    }
    
    static func mockS3() -> Lesson {
        let sentenceTranslation: [Language: String] = [
            .eng: "Hi!",
            .rus: "Привет!"
        ]
        let translations: [String: [Language: String]] = [
            "Қалың қалай?": [
                .eng: "How are you?",
                .rus:"Как твои дела?"
            ],
        ]
        let sentence = Sentence(elements: ["Сәлем!", "Қалың қалай?"],
                                translations: translations,
                                sentenceTranslation: sentenceTranslation)
        return Lesson(sentence: sentence)
    }
    
}
#endif
