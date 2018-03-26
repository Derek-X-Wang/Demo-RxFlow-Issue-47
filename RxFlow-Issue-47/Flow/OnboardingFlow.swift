//
//  OnboardingFlow.swift
//  RxFlow-Issue-47
//
//  Created by Xinzhe Wang on 3/25/18.
//  Copyright © 2018 Xinzhe Wang. All rights reserved.
//

import Foundation
import RxFlow

class OnboardingFlow: Flow {
    
    var root: Presentable {
        return self.rootViewController
    }
    
    private lazy var rootViewController: UINavigationController = {
        let viewController = UINavigationController()
        return viewController
    }()
    
    private let services: OnboardingServices
    
    init(withServices services: AppServices) {
        self.services = OnboardingServices(services)
    }
    
    func navigate(to step: Step) -> NextFlowItems {
        guard let step = step as? DemoStep else { return NextFlowItems.none }
        
        switch step {
        case .signin1:
            return navigationToSignin1Screen()
        case .signin2:
            return navigationToSignin2Screen()
        case .signinCompleted:
            print(".signinCompleted")
            return NextFlowItems.end(withStepForParentFlow: DemoStep.onboardingCompleted)
        default:
            return NextFlowItems.none
        }
    }
    
    private func navigationToSignin1Screen() -> NextFlowItems {
        let signinViewController = Onboarding1ViewController()
        self.rootViewController.pushViewController(signinViewController, animated: false)
        return NextFlowItems.one(flowItem: NextFlowItem(nextPresentable: signinViewController, nextStepper: signinViewController))
    }
    
    private func navigationToSignin2Screen() -> NextFlowItems {
        let signin2ViewController = Onboarding2ViewController()
        self.rootViewController.pushViewController(signin2ViewController, animated: true)
        return NextFlowItems.one(flowItem: NextFlowItem(nextPresentable: signin2ViewController, nextStepper: signin2ViewController))
    }
    
}

struct OnboardingServices {
    init(_ parentService: AppServices) {
    }
}
