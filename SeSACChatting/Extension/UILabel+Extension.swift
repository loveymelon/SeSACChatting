//
//  UILabel+Extension.swift
//  SeSACChatting
//
//  Created by 김진수 on 1/12/24.
//

import Foundation
import UIKit

extension UILabel {
    func setBodyLabel(text: String, color: UIColor, lines: Int = 1) {
        self.text = text
        self.textColor = color
        self.numberOfLines = lines
    }
}
