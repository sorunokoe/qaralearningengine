//
//  MockLesson.swift
//  Alqissa
//
//  Created by SALGARA, YESKENDIR on 10.03.24.
//

#if DEBUG
extension Lesson {
    
    static func mockS1() -> Lesson {
        let word = Word(value: "Сәлем!",
                        translation: "Hi!",
                        example: .init(value: "Сәлем!", translation: "Hi!"))
        return Lesson(word: word)
    }
    
    static func mockS2() -> Lesson {
        let word = Word(value: "Жүрек",
                        translation: "Heart",
                        example: .init(value: "Жүрек", translation: "Heart"))
        return Lesson(word: word)
    }
    
    static func mockS3() -> Lesson {
        let word = Word(value: "Қалың қалай?",
                        translation: "How are you?",
                        example: .init(value: "Қалың қалай?", translation: "How are you?"))
        return Lesson(word: word)
    }
    
}
#endif
