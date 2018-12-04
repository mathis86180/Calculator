//
//  ViewController.swift
//  Calculator
//
//  Created by formation 8 on 28/11/2018.
//  Copyright © 2018 formation 8. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var uiTextLabelResult: UILabel!
    var sign: String?
    var oldNumber: Double = 0
    


    @IBAction func onOperatorTap(_ sender: UIButton) {
        
        guard let text = uiTextLabelResult.text else {
            return
        }
        
        if let previousValue = Double(text)
        {
            oldNumber = previousValue
        } else {
            
        }
        uiTextLabelResult.text = "0";
        sign = sender.titleLabel?.text
    }
    
    @IBAction func onDigitTap(_ sender: UIButton) {
        
        guard let textButton = sender.titleLabel?.text else {
            return
        }
        if uiTextLabelResult.text == "0" {
            if textButton != "."{
                uiTextLabelResult.text = ""
            }
        }
        uiTextLabelResult.text?.append(textButton)
    }
    
    
    @IBAction func onEqualsTap(_ sender: UIButton) {
        
        var result: Double = 0
        
        /*
         le guard let permet de vérifier que la valeur n'est pas
         null et permet a actualValue d'etre lisible dans le reste
         de la fonction
        */
        guard let actualValue = uiTextLabelResult.text else {
            return
        }
        
        guard let secondOperand = Double(actualValue) else  {
          return
        }
        
        switch sign {
        case "+":
            result = oldNumber + secondOperand
            break
        case "-":
            result = oldNumber - secondOperand
            break
        case "X":
            result = oldNumber * secondOperand
            break
        case "/":
            /**
             Pour eviter l'erreur de la division par 0
            **/
            
            guard secondOperand != 0 else {
                result = oldNumber
                return
            }
            result = oldNumber / secondOperand
            break
        default:
            break
        }
        /**
         Permet de récupérer seulement deux chiffres appès la
         virgule
        **/
        uiTextLabelResult.text = String(format: "%.2f", result)
    }
    
    
    @IBAction func onClearTap(_ sender: Any) {
        uiTextLabelResult.text = "0"
        sign = ""
        oldNumber = 0
    }
}

