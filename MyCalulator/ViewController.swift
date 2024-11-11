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
        calculateResult.text = viewModel.calculateResultString(working: working)
    }
    
    @IBAction private func didSymbolPress(_ sender: UIButton) {
        addToWorking(value: sender.titleLabel?.text ?? "")
    }
    
    @IBAction private func didNumberButtonPress(_ sender: UIButton) {
        addToWorking(value: sender.titleLabel?.text ?? "")
    }
}
