//
//  MainFlow.swift
//  RxFlow-Issue-47
//
//  Created by Xinzhe Wang on 3/25/18.
//  Copyright © 2018 Xinzhe Wang. All rights reserved.
//

import Foundation
import RxFlow

class MainFlow: Flow {
    
    var root: Presentable {
        return self.rootViewController
    }
    
    private lazy var rootViewController: UINavigationController = {
        let viewController = UINavigationController()
        return viewController
    }()
    private let services: AppServices
    
    init(withServices services: AppServices) {
        self.services = services
    }
    
    func navigate(to step: Step) -> NextFlowItems {
        guard let step = step as? DemoStep else { return NextFlowItems.none }
        
        switch step {
        case .main:
            return navigateToMainScreen()
        case .signOutCompleted:
            print(".signOutCompleted")
            return NextFlowItems.end(withStepForParentFlow: DemoStep.mainCompleted)
        default:
            return NextFlowItems.none
        }
        
    }
    
    private func navigateToMainScreen() -> NextFlowItems {
        let mainViewController = MainViewController()
        self.rootViewController.pushViewController(mainViewController, animated: true)
        return NextFlowItems.one(flowItem: NextFlowItem(nextPresentable: mainViewController, nextStepper: mainViewController))
    }
}
