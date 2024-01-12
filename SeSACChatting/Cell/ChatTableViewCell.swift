//
//  ChatTableViewCell.swift
//  SeSACChatting
//
//  Created by 김진수 on 1/12/24.
//

import UIKit

class ChatTableViewCell: UITableViewCell {
    
    static let chatIdentifier = "ChatTableViewCell"
    
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var detailLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    let format = DateFormatter()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.userNameLabel.font = .boldSystemFont(ofSize: 16)
        
        self.detailLabel.font = .systemFont(ofSize: 15)
        self.detailLabel.textColor = .lightGray
        self.detailLabel.numberOfLines = 0
        
        self.dateLabel.font = .systemFont(ofSize: 14)
        self.dateLabel.textColor = .lightGray
    }
    
    override func draw(_ rect: CGRect) {
        self.profileImageView.clipsToBounds = true
        self.profileImageView.layer.cornerRadius = self.profileImageView.frame.width / 2
    }
    
    func configureCell(data: ChatRoom) {
        let chatIndex = data.chatList.count - 1
        let date = data.chatList[chatIndex].date
        
        self.profileImageView.image = UIImage(named: data.chatroomImage[0])
        self.userNameLabel.text = data.chatroomName
        self.dateLabel.text = settingFormat(date: date)
        self.detailLabel.text = data.chatList[chatIndex].message
    }
    
    func settingFormat(date: String) -> String {
        self.format.dateFormat = "yyyy-MM-dd HH:mm"
        
        let tempDate = format.date(from: date)!
        
        self.format.dateFormat = "yy.MM.dd"
        
        return format.string(from: tempDate)
    }
    
}
