//
//  ViewModel.swift
//  MyCalulator
//
//  Created by Bhagyadhar Sahoo on 11/11/24.
//

import Foundation


//MARK: 
class ViewModel {
    
    private func formatResult(result : Double) -> String {
        if(result.truncatingRemainder(dividingBy: 1) == 0 ){
            return String(format: "%.0f", result)
        }
        else{
            return String(format: "%.2f", result)
        }
    }
    
    func calculateResultString(working: String) -> String {
        let expresion = NSExpression(format: working)
        let result = expresion.expressionValue(with: nil, context: nil) as! Double
        let resultString = formatResult(result: result)
        return resultString
    }
}
