//
//  AppFlow.swift
//  RxFlow-Issue-47
//
//  Created by Xinzhe Wang on 3/25/18.
//  Copyright © 2018 Xinzhe Wang. All rights reserved.
//

import Foundation

import RxFlow

class AppFlow: Flow {
    
    var root: Presentable {
        return self.rootWindow
    }
    
    private let rootWindow: UIWindow
    private let services: AppServices
    
    init(withWindow window: UIWindow, andServices services: AppServices) {
        self.rootWindow = window
        self.services = services
    }
    
    func navigate(to step: Step) -> NextFlowItems {
        guard let step = step as? DemoStep else { return NextFlowItems.none }
        
        switch step {
        case .onboarding, .mainCompleted:
            print(".onboarding, .mainCompleted")
            return navigationToOnboardingFlow()
        case .onboardingCompleted, .main:
            print(".onboardingCompleted, .main")
            return navigationToMainFlow()
        default:
            return NextFlowItems.none
        }
    }
    
    private func navigationToOnboardingFlow() -> NextFlowItems {
        let onboardingFlow = OnboardingFlow(withServices: self.services)
        Flows.whenReady(flow1: onboardingFlow) { [unowned self] (root) in
            self.rootWindow.rootViewController = root
        }
        return NextFlowItems.one(flowItem: NextFlowItem(nextPresentable: onboardingFlow, nextStepper: OneStepper(withSingleStep: DemoStep.signin1)))
    }
    
    private func navigationToMainFlow() -> NextFlowItems {
        let mainFlow = MainFlow(withServices: self.services)
        Flows.whenReady(flow1: mainFlow) { [unowned self] (root) in
            self.rootWindow.rootViewController = root
        }
        return NextFlowItems.one(flowItem: NextFlowItem(nextPresentable: mainFlow, nextStepper: OneStepper(withSingleStep: DemoStep.main)))
    }
    
}

struct AppServices {
}

class AppStepper: Stepper {
    init(withServices services: AppServices) {
        self.step.accept(DemoStep.onboarding)
    }
}
