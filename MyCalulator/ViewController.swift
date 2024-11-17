//
//  ViewController.swift
//  MyCalulator
//
//  Created by Shailendu on 11/11/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var calculateNumber: UILabel!
    @IBOutlet weak var calculateResult: UILabel!
    @IBOutlet weak var resultView: UIView!
    
    private var working : String = " "
    private var viewModel: ViewModel = ViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func clearAll(){
        working = " "
        calculateNumber.text = " "
        calculateResult.text = " "
    }
    
    private func addToWorking(value : String){
        working = working + value
        calculateNumber.text = working
    }
    
    @IBAction func allclearBTN(_ sender: UIButton) {
        clearAll()
    }
    
    @IBAction func deleteBTN(_ sender: UIButton) {
        guard !working.isEmpty else { return }
        working.removeLast()
        calculateNumber.text = working
    }
    
    @IBAction func equalBTN(_ sender: UIButton){
        let value = viewModel.calculateResultString(working: working)
        let result = Double(value) ?? 0
        let newResult = result/1000
        
        if newResult >= 0 && newResult <= 1 { // 0 -- 1000 red color
            let redValue = result/1000
            resultView.backgroundColor = UIColor.red.withAlphaComponent(redValue)
        } else if newResult >= 1 && newResult <= 2 { // 1000 -- 2000 color green
            let greenValue = result/2000
            resultView.backgroundColor = UIColor.green.withAlphaComponent(greenValue)
        } else if newResult >= 2 && newResult <= 4 { // 2000 -- 4000 color blue
            let greenValue = result/4000
            resultView.backgroundColor = UIColor.blue.withAlphaComponent(greenValue)
        } else if newResult >= 4 && newResult <= 8 { // 4000 -- 8000 color yellow
            let greenValue = result/8000
            resultView.backgroundColor = UIColor.yellow.withAlphaComponent(greenValue)
        }else{
            resultView.backgroundColor = UIColor.black.withAlphaComponent(newResult)
        }
        calculateResult.text = value
        
        //0-1000 // red
        //1000-2000 // Green
        //2000-4000// blue
        //4000-8000 // black
        
    }
    
    
    
    @IBAction private func didSymbolPress(_ sender: UIButton) {
        addToWorking(value: sender.titleLabel?.text ?? "")
    }
    
    @IBAction private func didNumberButtonPress(_ sender: UIButton) {
        addToWorking(value: sender.titleLabel?.text ?? "")
    }
}
