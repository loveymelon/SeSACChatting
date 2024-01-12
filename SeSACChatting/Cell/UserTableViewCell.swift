//
//  UserTableViewCell.swift
//  SeSACChatting
//
//  Created by 김진수 on 1/12/24.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    static let userTableViewCellIdentifier = "UserTableViewCell"

    @IBOutlet var backView: UIView!
    @IBOutlet var chatLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    let format = DateFormatter()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backView.layer.cornerRadius = 10
        self.backView.layer.borderColor = UIColor.lightGray.cgColor
        self.backView.layer.borderWidth = 1
        self.backView.backgroundColor = .systemGray5
        self.chatLabel.numberOfLines = 0
    }
    
    func configureCell(data: Chat) {
        self.chatLabel.text = data.message
        self.dateLabel.text = settingFormat(date: data.date)
    }
    
    func settingFormat(date: String) -> String {
        self.format.dateFormat = "yyyy-MM-dd HH:mm"
        
        let tempDate = format.date(from: date)!
        
        self.format.dateFormat = "HH:mm"
        
        return format.string(from: tempDate)
    }
}
