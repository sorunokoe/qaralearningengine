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

public struct LearningPlan {
    let id: UUID = .init()
    public let lesson: Lesson
    public let method1: S1Method
    public let method2: S2Method?
    public let method3: S3Method?

    public init(lesson: Lesson, method1: S1Method, method2: S2Method?, method3: S3Method?) {
        self.lesson = lesson
        self.method1 = method1
        self.method2 = method2
        self.method3 = method3
    }
}

public struct QaraLearningEngineView: View {
    private let navigator = DefaultNavigator()
    @State private var stepViews: [any View] = []
    
    private let plan: [LearningPlan]
    let onDidFinish: (FlowResult) -> Void
    
    public init(plan: [LearningPlan],
         onDidFinish: @escaping (FlowResult) -> Void) {
        self.plan = plan
        self.onDidFinish = onDidFinish
    }

    public var body: some View {
        FlowView(stepViews: stepViews, 
                 navigator: navigator,
                 onDidFinish: onDidFinish)
            .onAppear {
                self.stepViews = plan.flatMap { item in
                    var views: [any View] = [
                        S1View(viewModel: S1View.ViewModel(
                            lesson: item.lesson,
                            method: item.method1,
                            navigator: navigator
                        )),
                    ]
                    if let method2 = item.method2 {
                        views.append(S2View(viewModel: S2View.ViewModel(
                            lesson: item.lesson,
                            method: method2,
                            navigator: navigator
                        )))
                    }
                    if let method3 = item.method3 {
                        views.append(S3View(viewModel: S3View.ViewModel(
                            lesson: item.lesson,
                            method: method3,
                            navigator: navigator
                        )))
                    }
                    return views
                }
            }
    }
}

#Preview {
    QaraLearningEngineView(plan: []) { _ in
        
    }
}
