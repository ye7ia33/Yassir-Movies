//
//  Storyboarded.swift
//  CoordinatorLearn
//
//  Created by Yahia El-Dow on 29/11/2022.
//

import UIKit

protocol Storyboarded {
    static func instantiate(storyboardName: String) -> Self
}

extension Storyboarded where Self: UIViewController {
    
    static func instantiate(storyboardName: String) -> Self {
         // this pulls out "MyApp.MyViewController"
         let fullName = NSStringFromClass(self)

         // this splits by the dot and uses everything after, giving "MyViewController"
         let className = fullName.components(separatedBy: ".")[1]

         // load our storyboard
         let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)

         // instantiate a view controller with that identifier, and force cast as the type that was requested
         return storyboard.instantiateViewController(withIdentifier: className) as! Self
     }
}
