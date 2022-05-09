//
//  Result.swift
//  imc-kobe
//
//  Created by Larissa Alves Ferreira on 06/05/22.
//

import Foundation
import UIKit

class ResultViewController: UIViewController {
    
    var calcResult: String = ""
    var resultInfo: String = ""
    
    
    @IBAction func CalculateAgain(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var labelCalcResult: UILabel!
    @IBOutlet weak var labelResultInfo: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelCalcResult?.text = calcResult
        
        labelResultInfo?.text = resultInfo
        
        
    }
}
