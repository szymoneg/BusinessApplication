//
//  SetCurrencyViewController.swift
//  BusinessApplication
//
//  Created by Szymon Biliński on 04/04/2021.
//

import UIKit
import RxSwift

class SetCurrencyViewController: UIViewController {

    //na odwrot
    @IBOutlet weak var currencyValue: UILabel!
    @IBOutlet weak var symbolLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var setButton: UIButton!
    
    private let selectedCurrencyVariable = Variable("EUR")
    var selectedCurrency:Observable<String>{
        return selectedCurrencyVariable.asObservable()
    }
    
    var valueCurrency = ""
    var realValue = ""
    var descritionValue = ""
     
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Set currency value!"
        currencyValue.text = valueCurrency
        symbolLabel.text = realValue
        descriptionLabel.text = descritionValue
        
        setButton.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
        setButton.layer.cornerRadius = 15.0
        setButton.tintColor = UIColor.white
    }
    
    
    @IBAction func setCurrenyValue(_ sender: UIButton) {
        print("set currency working...")
        selectedCurrencyVariable.value = valueCurrency
    }
    

}
