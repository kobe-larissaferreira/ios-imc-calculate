//
//  ViewController.swift
//  imc-kobe
//
//  Created by Larissa Alves Ferreira on 28/04/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var height : Double = 0
    var weight : Double = 0
    var imc: Double = 0

    @IBOutlet weak var labelHeight: UILabel!
    
    @IBOutlet weak var labelIMC: UILabel!
  
    @IBOutlet weak var labelInfoIMC: UILabel!
    
    @IBAction func heigthStepper(_ sender: UIStepper) {
        height = sender.value
        labelHeight.text = String(format: "%.0f", height)
    }
        
    @IBOutlet weak var labelWeight: UILabel!
        
    @IBAction func weightStepper(_ sender: UIStepper) {
        weight = sender.value
        labelWeight.text = String(format: "%.0f",weight)
    }
    
    func calcIMC() -> Double {
        let w : Double = Double(labelWeight.text!) ?? 0;
        let h : Double = Double(labelHeight.text!) ?? 0;
        
        let imc: Double = w/pow(h/100, 2)
        
        return imc
    }
    
    @IBAction func calculateIMC(_ sender: Any) {
        let imc : Double! = calcIMC();
        let imcFormatted : String! = String(format: "%.1f", imc)
        labelIMC.text = imcFormatted
        labelInfoIMC.text = defineLabel(imc: imc)
    }
    
    func defineLabel(imc: Double) -> String {
           if imc < 18.5 {
 
               return "Peso abaixo do normal"
           }
           else if (imc >= 18.5 && imc <= 24.9) {
  
               return "Peso Normal"
           }
           else if (imc >= 25 && imc <= 29.9){
  
               return "Sobrepeso"
           }
           else if (imc >= 30 && imc <= 34.9){
               return "Obesidade Grau I"
           }
           else if (imc > 35 && imc <= 39.9) {

               return "Obesidade Grau II"
           }
          return  "Obesidade Grau III ou Mórbida"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let vc = segue.destination as? ResultViewController
        
        imc = calcIMC()
        
        vc?.calcResult = String(format: "%.1f", imc)
        
        vc?.resultInfo = defineLabel(imc: imc)
        
    }
}


