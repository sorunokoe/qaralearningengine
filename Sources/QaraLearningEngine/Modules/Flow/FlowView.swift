//
//  FlowView.swift
//  Alqissa
//
//  Created by SALGARA, YESKENDIR on 16.03.24.
//

import SwiftUI
import QaraDesignSystem

public struct FlowView: View {
    
    var stepViews: [any View]
    @State var navigator: Navigator
    @State private var currentView: (any View)?
    @State private var currentIndex: Int = 0
    
    @EnvironmentObject var coordinator: Coordinator
    
    public var body: some View {
        VStack {
            HStack {
                Button(action: {
                    coordinator.navPath.removeLast(coordinator.navPath.count)
                }, label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .tint(.black)
                })
                Spacer()
                QaraProgressView(progress: CGFloat(currentIndex)/CGFloat(stepViews.count),
                                 cornerRadius: 8,
                                 background: .gray,
                                 tint: .green)
                .padding(14)
                Spacer()
                Button(action: {}, label: {
                    Image("baursaki-food")
                        .resizable()
                        .frame(width: 28, height: 28)
                        .tint(.red)
                })
            }
            .frame(height: 42)
            .padding([.trailing, .leading], 32)
            Spacer()
            if let currentView {
                AnyView(currentView)
            }
        }
        .task {
            currentView = stepViews[currentIndex]
            navigator.nextStep = {
                if currentIndex < stepViews.count - 1 {
                    withAnimation {
                        currentIndex += 1
                        currentView = stepViews[currentIndex]
                    }
                } else {
                    coordinator.navPath.append(Route.congrats)
                }
            }
        }

    }
}

#Preview {
    let navigator = DefaultNavigator()
    return FlowView(stepViews: [
        S1View(viewModel: S1View.ViewModel(lesson: Lesson.mockS1(),
                                                         method: S1Method.mock(),
                                                         navigator: navigator)),
        S2View(viewModel: S2View.ViewModel(lesson: Lesson.mockS2(),
                                                  method: S2Method.mock(),
                                                  navigator: navigator)),
        S3View(viewModel: S3View.ViewModel(lesson: Lesson.mockS3(),
                                                  method: S3Method.mock(),
                                                  navigator: navigator))
    ], navigator: navigator)
}
