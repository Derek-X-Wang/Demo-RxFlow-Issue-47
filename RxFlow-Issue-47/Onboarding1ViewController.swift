//
//  Onboarding1ViewController.swift
//  RxFlow-Issue-47
//
//  Created by Xinzhe Wang on 3/25/18.
//  Copyright © 2018 Xinzhe Wang. All rights reserved.
//

import UIKit
import RxFlow

class Onboarding1ViewController: UIViewController, Stepper {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.cyan
        let nextButton = UIButton(frame: CGRect(x: 10.0, y: 100.0, width: 130.0, height: 30.0))
        nextButton.setTitle("Onboarding2", for: .normal)
        nextButton.addTarget(self, action: #selector(nextVC), for: .touchUpInside)
        view.addSubview(nextButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func nextVC() {
        self.step.accept(DemoStep.signin2)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
