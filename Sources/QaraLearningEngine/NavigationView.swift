//
//  NavigationView.swift
//  Alqissa
//
//  Created by SALGARA, YESKENDIR on 19.03.24.
//

import QaraDesignSystem
import SwiftUI

public enum FlowResult {
    case success, failed
}

struct NavigationView: View {
    
    private let navigator = DefaultNavigator()
    
    let onDidFinish: (FlowResult) -> Void
    
    var body: some View {
        FlowView(stepViews: [
            S1View(viewModel: S1View.ViewModel(
                lesson: Lesson.mockS1(),
                method: S1Method.mock(),
                navigator: navigator
            )),
            S2View(viewModel: S2View.ViewModel(
                lesson: Lesson.mockS2(),
                method: S2Method.mock(),
                navigator: navigator
            )),
            S3View(viewModel: S3View.ViewModel(
                lesson: Lesson.mockS3(),
                method: S3Method.mock(),
                navigator: navigator
            )),
        ], navigator: navigator, onDidFinish: onDidFinish)
    }
}

#Preview {
    NavigationView(onDidFinish: {_ in  })
}
