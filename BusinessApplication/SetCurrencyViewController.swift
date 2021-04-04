//
//  SetCurrencyViewController.swift
//  BusinessApplication
//
//  Created by Szymon Biliński on 04/04/2021.
//

import UIKit

class SetCurrencyViewController: UIViewController {

    @IBOutlet weak var currencyValue: UILabel!
    
    var value = ""
     
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Set currency value!"
        currencyValue.text = value
    }
    
    

}
