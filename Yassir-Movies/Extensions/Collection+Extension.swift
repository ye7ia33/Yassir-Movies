//
//  Collection+Extension.swift
//  Yassir-Movies
//
//  Created by Yahia El-Dow on 25/04/2023.
//

import Foundation

extension Collection {
    /// Returns the element at the specified index iff it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
