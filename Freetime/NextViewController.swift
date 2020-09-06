//
//  NextViewController.swift
//  testswift
//
//  Created by 能美真也 on 2020/07/09.
//  Copyright © 2020年 能美真也. All rights reserved.
//

import UIKit

//値を渡すためのもの
protocol CatchProtocol {
    func CatchData(count:Int)
}


class NextViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var workText: UITextField!
    @IBOutlet weak var privateText: UITextField!
    
    
    var delegate:CatchProtocol?
    var count = 0
    var workcount = 0
    var privatecount = 0
    var pickerView1 = UIPickerView()
    var pickerView2 = UIPickerView()
    let datalist = [
        "0","1","2","3","4","5","6","7","8","9","10","11","12"
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CreatPickerView()
        CreatPickerView2()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //UIPicker1作成
    func CreatPickerView(){
        pickerView1.delegate = self
        workText.inputView = pickerView1
    }
    
    //UIPicker2作成
    func CreatPickerView2(){
        pickerView2.delegate = self
        privateText.inputView = pickerView2
    }
    
    //UIPickerの設定
    //列の数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //行数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return datalist.count
    }
    
    //表示する文字列
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return datalist[row]
    }
    
    //選択されたときの挙動
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == pickerView1{
            workText.text = datalist[row] + " h"
            workcount = Int(datalist[row])!
        } else {
            privateText.text = datalist[row] + " h"
            privatecount = Int(datalist[row])!
        }
    }
    
    //textfieldをタッチで終了
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        workText.endEditing(true)
        privateText.endEditing(true)
        count = privatecount + workcount
    }
    
    //戻るを押したとき
    @IBAction func back(_ sender: Any) {
        delegate?.CatchData(count: count)
        dismiss(animated: true, completion: nil)
    }


}
