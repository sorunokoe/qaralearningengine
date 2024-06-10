//
//  FixtureLesson.swift
//  Alqissa
//
//  Created by SALGARA, YESKENDIR on 10.03.24.
//

#if DEBUG
extension S1Method {
    
    static func mock() -> S1Method {
        return S1Method(voice: "", 
                        value: "Salem!",
                        answer: "Hi!",
                        variants: ["Good!", "Yes!", "Hi!"],
                        title: "Select the correct translation",
                        icon: "bala")
    }
    
}
#endif
