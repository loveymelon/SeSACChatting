//
//  ChattingRoomTableViewCell.swift
//  SeSACChatting
//
//  Created by 김진수 on 1/12/24.
//

import UIKit

class ChattingRoomTableViewCell: UITableViewCell {
    
    static let chattingRoomIdentifier = "ChattingRoomTableViewCell"

    @IBOutlet var userImageView: UIImageView!
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var chatLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var backView: UIView!
    
    let format = DateFormatter()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backView.layer.cornerRadius = 10
        self.backView.layer.borderColor = UIColor.lightGray.cgColor
        self.backView.layer.borderWidth = 1
        self.chatLabel.numberOfLines = 0
    }
    
    func configureCell(data: Chat) {
        self.userNameLabel.text = data.user.profileImage
        self.userImageView.image = UIImage(named: data.user.profileImage)
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
