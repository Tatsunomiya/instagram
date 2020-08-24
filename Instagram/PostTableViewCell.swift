//
//  PostTableViewCell.swift
//  Instagram
//
//  Created by D on 2020/06/11.
//  Copyright © 2020 D. All rights reserved.
//

import UIKit
import FirebaseUI
import Firebase
import SVProgressHUD


class PostTableViewCell: UITableViewCell {
    
    

    
    
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    
    @IBAction func commentPostButton(_ sender: Any) {
        
        
        let postRef = Firestore.firestore().collection(Const.PostPath).document()

        
        
        let name = Auth.auth().currentUser?.displayName
        let postDic = [
            "name": name!,
//            "comment": self.commentField.text!,
            ] as [String : Any]
        postRef.setData(postDic)
        // HUDで投稿完了を表示する
        SVProgressHUD.showSuccess(withStatus: "投稿しました")
        
        
        
        
        

        
        
    }
    

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setPostData2(_ postData: PostData) {
        
//        self.commentLabel.text = "\(postData.name!) : \(postData.comment!) "
        
        
        


        
    }
    
    
    func setPostData(_ postData: PostData) {
        postImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        let imageRef = Storage.storage().reference().child(Const.ImagePath).child(postData.id + ".jpg")
        postImageView.sd_setImage(with: imageRef)
        
        
        
        
        

        
        
        
        self.captionLabel.text = "\(postData.name!) : \(postData.caption!)"
        
        self.dateLabel.text = ""
        

        

        

        
        
        if let date = postData.date{
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm"
            let dateString = formatter.string(from: date)
            self.dateLabel.text = dateString
            
        }
        
        let likeNumber = postData.likes.count
        likeLabel.text = "\(likeNumber)"
        
        if postData.isLiked {
            let buttonImage = UIImage(named: "like_exist")
            self.likeButton.setImage(buttonImage, for: .normal)
        }else {
            let buttonImage = UIImage(named: "like_none")
            self.likeButton.setImage(buttonImage, for: .normal)
            
        }
        
        
    }
    
}
