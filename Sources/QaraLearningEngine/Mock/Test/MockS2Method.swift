//
//  MockS2Method.swift
//  Alqissa
//
//  Created by SALGARA, YESKENDIR on 14.03.24.
//

#if DEBUG
import Foundation

extension S2Method {
    
    struct ImageVariant {
        var id = UUID()
        var text: String
        var image: String
    }
    
    static func mock() -> S2Method {
        return S2Method(voice: "",
                        answer: "Heart",
                        variants: [ImageVariant(text: "Variant 1", image: "circle.hexagongrid.circle.fill"),
                                   ImageVariant(text: "Variant 2", image: "rectangle.3.group.fill"),
                                   ImageVariant(text: "Heart", image: "heart.square"),
                                   ImageVariant(text: "Variant 3", image: "star.circle.fill")],
                        title: "Select the correct image",
                        icon: "bala")
    }
    
}
#endif
