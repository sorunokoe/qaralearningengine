//
//  MockS3Method.swift
//  Alqissa
//
//  Created by SALGARA, YESKENDIR on 16.03.24.
//

#if DEBUG
import Foundation

extension S3Method {
    
    static func mock() -> S3Method {
        return S3Method(voice: "",
                        answer: "Hi! How are you?",
                        variants: ["Hi!", "doing?", "How", "are", "you?", "good"],
                        title: "Translate this sentence",
                        icon: "bala",
                        isNewWord: true)
    }
    
}
#endif
