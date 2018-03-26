//
//  DemoStep.swift
//  RxFlow-Issue-47
//
//  Created by Xinzhe Wang on 3/25/18.
//  Copyright © 2018 Xinzhe Wang. All rights reserved.
//

import RxFlow

enum DemoStep: Step {
    case onboarding
    case signin1
    case signin2
    case signinCompleted
    case onboardingCompleted
    
    case main
    case signOutCompleted
    case mainCompleted
}
