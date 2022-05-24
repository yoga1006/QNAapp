//
//  ViewController.swift
//  QNAapp
//
//  Created by Yoga on 2022/5/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionSlider: UISlider!
    @IBOutlet weak var questionImageView: UIImageView!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var questionNumberLabel: UILabel!
    
    //產生問題的array
    var questions = [Question]()
    //題目
    var index = 0
    //顯示題數
    var count = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let question1 = Question(questionImage: "Q1", answer: "醋")
        questions.append(question1)
        let question2 = Question(questionImage: "Q2", answer: "奮")
        questions.append(question2)
        let question3 = Question(questionImage: "Q3", answer: "惜")
        questions.append(question3)
        let question4 = Question(questionImage: "Q4", answer: "模")
        questions.append(question4)
        let question5 = Question(questionImage: "Q5", answer: "慶")
        questions.append(question5)
        let question6 = Question(questionImage: "Q6", answer: "網")
        questions.append(question6)
        let question7 = Question(questionImage: "Q7", answer: "皇")
        questions.append(question7)
        let question8 = Question(questionImage: "Q8", answer: "獻")
        questions.append(question8)
        let question9 = Question(questionImage: "Q9", answer: "備")
        questions.append(question9)
        let question10 = Question(questionImage: "Q10", answer: "沉")
        questions.append(question10)
        
        //隨機出題
        questions.shuffle()
        //設定題目ImageView
        questionImageView.image = UIImage(named: questions[index].questionImage)
        answerLabel.text = ""
        questionNumberLabel.text = "\(count)/10"
        
    }

    //顯示答案
    @IBAction func showAnswer(_ sender: Any) {
        answerLabel.text = questions[index].answer
        
    }
    
    //下一題
    @IBAction func nextQuestion(_ sender: Any) {
        //題目
        index = index+1
        //題數
        count = count+1
        
        //當題數(11)等於題目的所有數量(10)+1，初始化
        if count == questions.count+1{
            index = 0
            count = 1
            questions.shuffle()
            
        }
        
        questionNumberLabel.text = "\(count)/10"
        //index讓最後一題可以按回第一題(index=0)
        index = index%questions.count
        answerLabel.text = ""
        questionImageView.image = UIImage(named:  questions[index].questionImage)
        questionSlider.value = Float(count)
        
        
    }
    
    
}

