//
//  AppDelegate.swift
//  DogCeoChallenge
//
//  Created by Mobdev on 20-04-22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        let restApiCall = APICall()
        let breedsListViewController = BreedsListViewController()
        breedsListViewController.restApiCall = restApiCall
        
        let navigationController = UINavigationController(rootViewController: breedsListViewController)
        window?.rootViewController = navigationController
        
        return true
        
    }
    
}
