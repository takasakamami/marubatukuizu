//
//  ViewController.swift
//  marubatu
//
//  Created by 高坂まみ on 2019/06/08.
//  Copyright © 2019 高坂まみ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        showQuestion()
    }

    @IBOutlet weak var monndai: UILabel!
    
    var currentQuestionNum:Int = 0
    
    let questions: [[String:Any]] =
        [
        [
            "question": "iPhoneアプリを開発する統合環境はZcodeである",
        "answer": false
    ],
    [
    "question": "Xcode画面の右側にはユーティリティーズがある",
    "answer": true
    ],
    [
    "question": "UILabelは文字列を表示する際に利用する",
    "answer": true
    ]]
    
    func showQuestion() {
        let question = questions[currentQuestionNum]
        
        if let que = question["question"] as? String{
                monndai.text = que
        }
    }
    
    func checkAnswer(yourAnswer: Bool) {
        
        let question = questions[currentQuestionNum]
        
        if let ans = question["answer"] as? Bool{
            if yourAnswer == ans{
//                true
                currentQuestionNum += 1
                showAlert(message: "正解")
            } else {
                showAlert(message: "不正解")
//                false
            }
        }else{
                print("こたえがありません")
                return
            }
        
        if currentQuestionNum >= questions.count{
            currentQuestionNum = 0
        }
        
            showQuestion()

        }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil,
        message: message,preferredStyle: .alert)
        
        let close = UIAlertAction(title: "とじる", style:.cancel, handler: nil)
        
        alert.addAction(close)
        
        present(alert, animated: true,completion: nil)
        
        
    }
    
    
    
    @IBAction func maru(_ sender: Any) {
        
        checkAnswer(yourAnswer: true)
    }
    
    
    @IBAction func batu(_ sender: Any) {
        checkAnswer(yourAnswer: false)
        
    }
    


}

