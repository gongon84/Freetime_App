//
//  ViewController.swift
//  testswift
//
//  Created by 能美真也 on 2020/06/25.
//  Copyright © 2020年 能美真也. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, CatchProtocol{

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var plantime: UILabel!
    @IBOutlet weak var wakeTime: UITextField!
    @IBOutlet weak var sleepTime: UITextField!

    var wakecount = 0
    var plancount = 0
    var sleepcount = 24
    var pickerView0 = UIPickerView()
    var pickerView02 = UIPickerView()
    let datalist0 = [
        "1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24"
    ]
    let datalist02 = [
        "18","19","20","21","22","23","24","25","26","27","28"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeLabel.text = "24 h"
        plantime.text = "0 h"
        
        CreatPickerView0()
        CreatPickerView02()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //UIPicker0作成 起床
    func CreatPickerView0(){
        pickerView0.delegate = self
        wakeTime.inputView = pickerView0
    }
    
    //UIPicker02作成　就寝
    func CreatPickerView02(){
        pickerView02.delegate = self
        sleepTime.inputView = pickerView02
    }
    
    //UIPicker0と02の設定
    //列の数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //行数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView == pickerView0{
         return datalist0.count
        } else {
            return datalist02.count
        }
    }
    
    //表示する文字列
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == pickerView0{
            return datalist0[row]
        } else {
            return datalist02[row]
        }
    }
    
    //選択されたとき
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == pickerView0{
            wakeTime.text = datalist0[row]
            wakecount = Int(datalist0[row])!
        } else {
            sleepTime.text = datalist02[row]
            sleepcount = Int(datalist02[row])!
        }
    }
    
    //pickerをタッチで終了
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        wakeTime.endEditing(true)
        sleepTime.endEditing(true)
        timeLabel.text = String(sleepcount - (wakecount + plancount)) + " h"
        wakeTime.text = String(wakecount) + ":00"
        sleepTime.text = String(sleepcount) + ":00"
    }
    
    
    //リセットを押したとき
    @IBAction func resetLabel(_ sender: Any) {
        wakecount = 0
        plancount = 0
        sleepcount = 24
        timeLabel.text = "24 h"
        plantime.text = "0 h"
        wakeTime.text = "未設定"
        sleepTime.text = "24:00"
    }
    
    //nextViewControllerから受け取った値
    func CatchData(count: Int) {
        plantime.text = String(count) + " h"
        plancount = count
        timeLabel.text = String(sleepcount - (wakecount + plancount)) + " h"
    }
    
    //予定を押したとき
    @IBAction func nextpage(_ sender: Any) {
        performSegue(withIdentifier: "next", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! NextViewController
        nextVC.delegate = self
    }
    
    
    

}

