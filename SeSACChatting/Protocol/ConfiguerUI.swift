//
//  ConfiguerUI.swift
//  SeSACChatting
//
//  Created by 김진수 on 1/12/24.
//

import Foundation
import UIKit

@objc
protocol ConfiguerUI {
    func designUI()
    func settingTableView()
    @objc optional func designView()
    func designNav()
}
