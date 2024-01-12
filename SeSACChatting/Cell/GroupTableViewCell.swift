//
//  GroupTableViewCell.swift
//  SeSACChatting
//
//  Created by 김진수 on 1/12/24.
//

import UIKit

class GroupTableViewCell: UITableViewCell {
    
    static let groupTableIdentifier = "GroupTableViewCell"

    @IBOutlet var groupImageViews: [UIImageView]!
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var detailLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    let format = DateFormatter()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        designImageViews()
        
        self.userNameLabel.font = .boldSystemFont(ofSize: 16)
        
        self.detailLabel.font = .systemFont(ofSize: 15)
        self.detailLabel.textColor = .lightGray
        self.detailLabel.numberOfLines = 0
        
        self.dateLabel.font = .systemFont(ofSize: 14)
        self.dateLabel.textColor = .lightGray
    }
    
    func designImageViews() {
        for i in groupImageViews {
            i.clipsToBounds = true
            i.layer.cornerRadius = 5
        }
    }
    
    func configureCell(data: ChatRoom) {
        let chatIndex = data.chatList.count - 1
        let date = data.chatList[chatIndex].date
        
        for i in 0...groupImageViews.count - 1 {
            self.groupImageViews[i].image = UIImage(named: data.chatroomImage[i])
        }
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
