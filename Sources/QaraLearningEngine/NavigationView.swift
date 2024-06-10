//
//  NavigationView.swift
//  Alqissa
//
//  Created by SALGARA, YESKENDIR on 19.03.24.
//

import QaraDesignSystem
import SwiftUI

#if DEBUG
enum Route {
    case learning, congrats
}

class Coordinator: ObservableObject {
    @Published var navPath = NavigationPath()
}

struct NavigationView: View {
    @State private var routes: [Route] = []
    @ObservedObject private var coordinator = Coordinator()

    var body: some View {
        NavigationStack(path: $coordinator.navPath) {
            VStack {
                QaraButton(
                    text: "Start learning language",
                    backgroundColor: .blue,
                    foregroundColor: .white,
                    action: { coordinator.navPath.append(Route.learning) }
                )
            }
            .padding([.leading, .trailing], 32)
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .learning:
                    let navigator = DefaultNavigator()
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
                    ], navigator: navigator)
                        .environmentObject(coordinator)
                        .navigationBarBackButtonHidden()
                case .congrats:
                    CongratulationView()
                        .environmentObject(coordinator)
                        .navigationBarBackButtonHidden()
                }
            }
        }
    }
}

#Preview {
    NavigationView()
}
#endif
