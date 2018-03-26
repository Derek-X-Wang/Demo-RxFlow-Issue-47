//
//  AppDelegate.swift
//  RxFlow-Issue-47
//
//  Created by Xinzhe Wang on 3/25/18.
//  Copyright © 2018 Xinzhe Wang. All rights reserved.
//

import UIKit
import RxFlow
import RxSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let disposeBag = DisposeBag()
    var coordinator = Coordinator()
    var appFlow: AppFlow!
    lazy var appServices = {
        return AppServices()
    }()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        guard let window = self.window else { return false }
        //RxFlow
        coordinator.rx.didNavigate.subscribe(onNext: { (flow, step) in
            print ("did navigate to flow=\(flow) and step=\(step)")
        }).disposed(by: self.disposeBag)
//        coordinator.rx.willNavigate.subscribe(onNext: { (flow, step) in
//            print ("will navigate to flow=\(flow) and step=\(step)")
//        }).disposed(by: self.disposeBag)
        self.appFlow = AppFlow(withWindow: window, andServices: self.appServices)
        coordinator.coordinate(flow: self.appFlow, withStepper: AppStepper(withServices: self.appServices))
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

