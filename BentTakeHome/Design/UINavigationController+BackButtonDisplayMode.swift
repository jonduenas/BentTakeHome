//
//  UINavigationController+BackButtonDisplayMode.swift
//  BentTakeHome
//
//  Created by Jon Duenas on 6/24/23.
//

import UIKit

// Kinda hacky and affects all navigation controllers -- but the quickest and easiest solution
// for removing the "Back" text on NavigationStack.
extension UINavigationController {
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        navigationBar.topItem?.backButtonDisplayMode = .minimal
    }
}
