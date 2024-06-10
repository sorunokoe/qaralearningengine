//
//  StepView.swift
//  Alqissa
//
//  Created by SALGARA, YESKENDIR on 16.03.24.
//

import SwiftUI

public protocol Navigator {
    var nextStep: (() -> Void)? { get set }
    func didFinishStep()
}

public final class DefaultNavigator: Navigator {
    public var nextStep: (() -> Void)?
    public func didFinishStep() {
        nextStep?()
    }
}

protocol StepView: View {
    
}
