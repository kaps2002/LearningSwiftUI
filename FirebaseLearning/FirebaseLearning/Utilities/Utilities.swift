//
//  Utilities.swift
//  FirebaseLearning
//
//  Created by Roro on 06/05/24.
//

import Foundation
import UIKit

final class Utilities {
    static let shared = Utilities()
    private init() {}
    
    func getTopViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {

            if let nav = base as? UINavigationController {
                return getTopViewController(base: nav.visibleViewController)

            } else if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
                return getTopViewController(base: selected)

            } else if let presented = base?.presentedViewController {
                return getTopViewController(base: presented)
            }
            return base
        }
}
