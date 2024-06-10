//
//  File.swift
//  
//
//  Created by SALGARA, YESKENDIR on 10.06.24.
//

import XCTest
@testable import QaraLearningEngine

final class S1ViewTests: XCTestCase {

    var sut: S1View.ViewModel!

    override func setUp() {
        let lesson = Lesson.mockS1()
        let method = S1Method.mock()
        sut = S1View.ViewModel(lesson: lesson, method: method, navigator: DefaultNavigator())
    }
    
    func testAnswerInVariants() {
        XCTAssertNotNil(sut.method.variants.first(where: { $0 == sut.method.answer }))
    }
    
    
    func testCorrectAnswer() {
        sut.check(variant: sut.method.answer)
        XCTAssertEqual(sut.isCorrectAnswer, true)
    }
    
    func testWrongAnswer() {
        sut.check(variant: "wrong answer")
        XCTAssertEqual(sut.isCorrectAnswer, false)
    }
    
    
}
