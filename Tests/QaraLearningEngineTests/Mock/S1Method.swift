//
//  File.swift
//  
//
//  Created by SALGARA, YESKENDIR on 10.06.24.
//

import Foundation
@testable import QaraLearningEngine

extension S1Method {
    
    static func mock() -> S1Method {
        return S1Method(voice: "",
                              answer: "Hi!",
                              variants: ["Good!", "No!", "Yes!", "Hi!"],
                              title: "Select the correct translation",
                              icon: "bala")
    }
    
}
