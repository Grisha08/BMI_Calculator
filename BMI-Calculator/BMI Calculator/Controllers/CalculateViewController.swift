//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    @IBOutlet weak var sliderWeight: UISlider!
    @IBOutlet weak var sliderHeight: UISlider!
    @IBOutlet weak var labelHeight: UILabel!
    @IBOutlet weak var labelWeight: UILabel!
    
    var BMI : Float = 0.0
    var calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }

    @IBAction func heightSlider(_ sender: UISlider) {
        labelHeight.text = calculatorBrain.getLabelHeight(height: sender.value)
    }
    
    @IBAction func weightSlideer(_ sender: UISlider) {
        labelWeight.text = calculatorBrain.getLabelWeight(weight: sender.value)
    }
    
    @IBAction func Calculate(_ sender: UIButton) {
        let weight = sliderWeight.value
        let height = sliderHeight.value
  calculatorBrain.calBMI(weight: weight, height: height)
       
        self.performSegue(withIdentifier:"goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destiationVC = segue.destination as! ResultViewController
            destiationVC.bmiValue = calculatorBrain.getBMIValue()
            destiationVC.color = calculatorBrain.getColor()
            destiationVC.advice = calculatorBrain.getAdvice()
        }
    }
}

