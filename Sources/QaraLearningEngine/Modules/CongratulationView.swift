//
//  CongratulationView.swift
//  Alqissa
//
//  Created by SALGARA, YESKENDIR on 19.03.24.
//

import QaraDesignSystem
import SwiftUI

public struct CongratulationView: View {
    enum Achievement {
        case xp(value: String),
             time(value: String),
             acc(value: String)

        var label: String {
            switch self {
            case .xp:
                return "Total XP"
            case .time:
                return "Time"
            case .acc:
                return "GOOD"
            }
        }

        var value: String {
            switch self {
            case .xp(let value):
                return value
            case .time(let value):
                return value
            case .acc(let value):
                return value
            }
        }

        var color: Color {
            switch self {
            case .xp:
                return .yellow
            case .time:
                return .orange
            case .acc:
                return .green
            }
        }
    }

    var achievements: [Achievement] = [
        .xp(value: "24"),
        .time(value: "4:05"),
        .acc(value: "88%"),
    ]

    @EnvironmentObject var coordinator: Coordinator

    @State var isAnimating = false

    public var body: some View {
        GeometryReader { geo in
            Text("✨")
                .font(.system(size: 32))
                .position(.init(
                    x: geo.size.width / 2,
                    y: isAnimating ? 115 : 120
                ))
                .onAppear {
                    withAnimation(.easeInOut(duration: 2).repeatForever()) {
                        self.isAnimating = true
                    }
                }
            VStack(alignment: .center, spacing: 32) {
                Spacer()
                VStack(alignment: .center, spacing: 16) {
                    Image("nomad")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100)
                    Text("Word wizard!")
                        .font(.system(size: 24, weight: .medium))
                        .foregroundStyle(.orange)
                    Text("You learned 8 new words!")
                        .font(.system(size: 18, weight: .regular))
                }
                VStack {
                    HStack(alignment: .center) {
                        ForEach(achievements, id: \.label) { item in
                            VStack(alignment: .center, spacing: 8) {
                                Text(item.label)
                                    .font(.system(size: 14, weight: .medium))
                                Text(item.value)
                                    .font(.system(size: 18, weight: .medium))
                            }
                            .padding(16)
                            .frame(width: max(geo.size.width / 3 - 8, 0))
                            .background {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(.clear)
                                    .stroke(item.color, lineWidth: 2)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                }
                Spacer()
                QaraButton(
                    text: "Continue",
                    backgroundColor: .blue,
                    foregroundColor: .white,
                    action: { coordinator.navPath.removeLast(coordinator.navPath.count) }
                )
            }
        }
        .padding([.leading, .trailing], 32)
    }
}

#Preview {
    CongratulationView()
}
