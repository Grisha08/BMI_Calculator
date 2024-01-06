//
//  CalculaterBrain.swift
//  BMI Calculator
//
//  Created by Grisha Borodavka on 03/12/2023.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain{
    
    var bmi : BMI?
    
     mutating func calBMI(weight:Float,height:Float) {
         let bmiValue = weight / pow(height, 2)
        
         if bmiValue < 18.5{
             bmi = BMI(value: bmiValue, advice: "Eat more", color: .blue)
         }
         else if  bmiValue < 24.9 {
             bmi = BMI(value: bmiValue, advice: "Nice bro", color: .green)
         }
         else{
             bmi = BMI(value: bmiValue, advice: "Stop eat", color: .red)
         }
    }
    
    func   getLabelHeight(height:Float)-> String {
       return (String(format: "%.2f", height) + "m")
    }
    
    func  getLabelWeight(weight:Float)-> String {
       return (String(format: "%.2f", weight) + "kg")
    }
    
      func getBMIValue()-> String {
          let valueBmi = String(format: "%.1f", bmi?.value ?? 0.0)
        return valueBmi
    }
    
    func getAdvice()-> String{
        return   bmi?.advice ?? ""
    }
    func getColor()-> UIColor{
        return   bmi?.color ?? .clear
    }
}












