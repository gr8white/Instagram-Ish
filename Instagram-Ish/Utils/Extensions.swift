//
//  Extensions.swift
//  Instagram-Ish
//
//  Created by Cool-Ish on 7/18/23.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

