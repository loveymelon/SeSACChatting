//
//  TravelTalkViewController.swift
//  SeSACChatting
//
//  Created by 김진수 on 1/12/24.
//

import UIKit

class TravelTalkViewController: UIViewController {

    @IBOutlet var friendLabel: UILabel!
    @IBOutlet var magImageView: UIImageView!
    @IBOutlet var backView: UIView!
    @IBOutlet var lineView: UIView!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        designUI()
    }
    
}

extension TravelTalkViewController {
    func designLabel() {
        self.friendLabel.setBodyLabel(text: "친구 이름을 검색해보세요", color: .lightGray)
    }
    
    func designImageView() {
        self.magImageView.setBodyUIImageView(image: UIImage(systemName: "magnifyingglass"), color: .lightGray)
    }
}

extension TravelTalkViewController: ConfiguerUI {
    func designNav() {
        self.navigationItem.title = "TRAVEL TALK"
    }
    
    func designUI() {
        settingTableView()
        designView()
        designLabel()
        designImageView()
        designNav()
    }
    
    func settingTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        let nib = UINib(nibName: ChatTableViewCell.chatIdentifier, bundle: nil)
        let groupNib = UINib(nibName: GroupTableViewCell.groupTableIdentifier, bundle: nil)
        
        self.tableView.register(nib, forCellReuseIdentifier: ChatTableViewCell.chatIdentifier)
        self.tableView.register(groupNib, forCellReuseIdentifier: GroupTableViewCell.groupTableIdentifier)
        
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.separatorStyle = .none
    }
    
    func designView() {
        self.lineView.backgroundColor = .lightGray
        self.backView.backgroundColor = .systemGray5
    }
    
}

extension TravelTalkViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ChatList.mockChatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if ChatList.mockChatList[indexPath.row].chatroomImage.count == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ChatTableViewCell.chatIdentifier, for: indexPath) as! ChatTableViewCell
            //        let row = Chat
            
            //보내줘야될거 ChatList.mockChatList[indexPath.row],
            let row = ChatList.mockChatList[indexPath.row]
            
            cell.configureCell(data: row)
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: GroupTableViewCell.groupTableIdentifier, for: indexPath) as! GroupTableViewCell
            
            let row = ChatList.mockChatList[indexPath.row]
            
            cell.configureCell(data: row)
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: ChattingRoomViewController.chattingRoomIdentifier) as! ChattingRoomViewController
        
        vc.navTitle = ChatList.mockChatList[indexPath.row].chatroomName
        vc.chatCount = ChatList.mockChatList[indexPath.row].chatList.count
        vc.roomNumber = ChatList.mockChatList[indexPath.row].chatroomId
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
