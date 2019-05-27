//
//  AppFlowController.swift
//  Hotspot
//
//  Created by Hotspot Team on 2018-11-17.
//  Copyright © 2018 Hotspot. All rights reserved.
//


import UIKit

class AppFlowController: UIViewController {
    
    private let splashViewController = SplashViewController()
    private let homeFlowController = HomeTabBarController()
    private var isLoggedIn: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        
        start()
    }
    
    func start() {
        presentSplashViewController()
    }
}

// MARK: - SplashViewController Flow
extension AppFlowController {
    func presentSplashViewController() {
        add(childController: splashViewController)
        let deadline = DispatchTime.now() + 4.5
        DispatchQueue.main.asyncAfter(deadline: deadline, execute: {
            self.dismissSplashViewController()
        })
    }
    
    func dismissSplashViewController() {
        remove(childController: splashViewController)
        if isLoggedIn {
            startHomeFlowController()
        } else {
            startAuthFlowController()
        }    }
}

// MARK: - Start Child FlowControllers
extension AppFlowController {
    func startHomeFlowController() {
        homeFlowController.modalTransitionStyle = .crossDissolve
        present(homeFlowController, animated: true, completion: nil)
    }
    
    func startAuthFlowController() {
        
    }
}

