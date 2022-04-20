//
//  UIViewExtension.swift
//  DogCeoChallenge
//
//  Created by Mobdev on 20-04-22.
//

import UIKit

extension UIView {
    
    func pin(to superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.topAnchor),
            leadingAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.leadingAnchor),
            trailingAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.trailingAnchor),
            bottomAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
}
