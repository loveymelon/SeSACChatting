//
//  ChattingRoomViewController.swift
//  SeSACChatting
//
//  Created by 김진수 on 1/12/24.
//

import UIKit

class ChattingRoomViewController: UIViewController {
    
    static let chattingRoomIdentifier = "ChattingRoomViewController"

    @IBOutlet var tableView: UITableView!
    @IBOutlet var textView: UITextView!
    
    var chatCount: Int?
    var roomNumber: Int?
    var navTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        designUI()
        print(self.tableView.heightAnchor)
    }
    
    @IBAction func tappedGastrue(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
}

extension ChattingRoomViewController: ConfiguerUI {
    func designUI() {
        settingTableView()
        designNav()
        designTextView()
    }
    
    func settingTableView() {
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.separatorStyle = .none
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let nib = UINib(nibName: ChattingRoomTableViewCell.chattingRoomIdentifier, bundle: nil)
        let userNib = UINib(nibName: UserTableViewCell.userTableViewCellIdentifier, bundle: nil)
        
        self.tableView.register(nib, forCellReuseIdentifier: ChattingRoomTableViewCell.chattingRoomIdentifier)
        self.tableView.register(userNib, forCellReuseIdentifier: UserTableViewCell.userTableViewCellIdentifier)
    }
    
    func designNav() {
//        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        
        self.navigationItem.title = navTitle ?? "없음"
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.topItem?.titleView?.tintColor = .black
    }
    
    func designTextView() {
        self.textView.delegate = self
        
        self.textView.textColor = .gray
        self.textView.text = "내용을 입력해주세요"
        self.textView.font = .systemFont(ofSize: 24)
        self.textView.backgroundColor = .systemGray5
    }
    
}

extension ChattingRoomViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
        textView.textColor = .black
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        print(#function)
        if textView.text.isEmpty {
            textView.text = "메세지를 입력하세요"
            textView.textColor = .lightGray
        }
    }
    
}

extension ChattingRoomViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatCount!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(indexPath.row)
        if ChatList.mockChatList[roomNumber! - 1].chatList[indexPath.row].user != .user {
            let cell = tableView.dequeueReusableCell(withIdentifier: ChattingRoomTableViewCell.chattingRoomIdentifier, for: indexPath) as! ChattingRoomTableViewCell
            
            let row = ChatList.mockChatList[roomNumber! - 1].chatList[indexPath.row]
            
            cell.configureCell(data: row)
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.userTableViewCellIdentifier, for: indexPath) as! UserTableViewCell
            
            print("aaa")
            
            let row = ChatList.mockChatList[roomNumber! - 1].chatList[indexPath.row]
            
            cell.configureCell(data: row)
            
            return cell
        }
    }
    
    
}
