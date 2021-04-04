//
//  SetCurrencyViewController.swift
//  BusinessApplication
//
//  Created by Szymon Biliński on 04/04/2021.
//

import UIKit
import RxSwift

class SetCurrencyViewController: UIViewController {

    @IBOutlet weak var currencyValue: UILabel!
    
    private let selectedCurrencyVariable = Variable("EUR")
    var selectedCharacter:Observable<String>{
        return selectedCurrencyVariable.asObservable()
    }
    
    var valueCurrency = ""
     
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Set currency value!"
        currencyValue.text = valueCurrency
    }
    
    
    @IBAction func setCurrenyValue(_ sender: UIButton) {
        print("set currency working...")
        selectedCurrencyVariable.value = valueCurrency
    }
    

}
