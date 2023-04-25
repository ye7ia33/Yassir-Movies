//
//  ViewModel.swift
//  Ovasta
//
//  Created by Yahia El-Dow on 5/8/20.
//  Copyright © 2020 Yahia El-Dow. All rights reserved.
//

import Foundation

class ViewModel {
    var showLoader:()->Void = { }
    var hideLoader:()->Void = { }
    var completionHandler:()->Void = { }
    var completionHandlerWithErrorMessage:(_ message: String)->Void = { message in }
}
