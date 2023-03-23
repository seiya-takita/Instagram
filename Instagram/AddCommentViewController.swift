//
//  AddCommentViewController.swift
//  Instagram
//
//  Created by 滝田　勢也 on 2023/03/22.
//

import UIKit
import Firebase

class AddCommentViewController: UIViewController {
    @IBOutlet weak var commentTextField: UITextField!
    
    var postData: PostData?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onTouchAddCommentButton(_ sender: Any) {
        if let displayName = Auth.auth().currentUser?.displayName, let text = commentTextField.text, !text.isEmpty {
            let updateValue = FieldValue.arrayUnion(["\(displayName): \(text)"])
            
            let postRef = Firestore.firestore().collection(Const.PostPath).document(postData!.id)
            postRef.updateData(["comments": updateValue])
        }
        self.dismiss(animated: true, completion: nil)
    }
}
