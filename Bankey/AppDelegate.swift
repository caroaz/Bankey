//
//  AppDelegate.swift
//  Bankey
//
//  Created by Mobdev on 06-09-22.
//

import UIKit
let appColor :  UIColor = .systemTeal

@main
class AppDelegate: UIResponder, UIApplicationDelegate{
    
    


    var window : UIWindow?
    let loginViewController = LoginViewController()
    let onboardingViewController = OnboardingContainerViewController()

    let mainViewController = MainViewController()
    
//    var hasOnboraded = false
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        loginViewController.delegate = self
        onboardingViewController.delegate = self
    
        let vc = mainViewController
        vc.setStatusBar()
        
        
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().backgroundColor = appColor
            
        window?.rootViewController = vc
            
        return true
        
//        window?.rootViewController = OnboardingViewController(heroImageName: "delorean", titleText: "Bankey is faster, easier to use, and has a brand new look and feel that will make you feel like you are back in 1989.")
      
    }
    
}

extension AppDelegate : LoginViewControllerDelegate {
    func didLogin() {
        if LocalState.hasOnboarded {
                   setRootViewController(mainViewController) // here
               } else {
                   setRootViewController(onboardingViewController)
               }
    }
    
    
}

extension AppDelegate: OnboardingContainerViewControllerDelegate{
    func didFinishOnboarding() {
        LocalState.hasOnboarded = true
        setRootViewController(mainViewController) // here
    }
    
    
    
    
}
extension AppDelegate: LogoutDelegate{
    func didLogout() {
        setRootViewController(loginViewController)
    }
}

//MARK: - Extension AppDelegate

extension AppDelegate{
    
    func setRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }

        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window,
                          duration: 0.3,
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: nil)
    }
}
