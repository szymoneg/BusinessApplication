//
//  DetailsViewController.swift
//  BusinessApplication
//
//  Created by Szymon Biliński on 02/04/2021.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var valueFromLabel: UILabel!
    @IBOutlet weak var valueToLabel: UILabel!
    @IBOutlet weak var valueFromPicker: UIPickerView!
    @IBOutlet weak var inputFrom: UITextField!
    @IBOutlet weak var inputTo: UITextField!
    
    
    let values = ["EUR","USD","PLN"]
    var selected1 = "EUR"
    var selected2 = "USD"
    
    var valueFrom = "0"
    var valueTo = "0"
    let apiConn = ApiService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Details"
        valueFromPicker.dataSource = self
        valueFromPicker.delegate = self
    }

    @IBAction func sendNudes(_ sender: UIButton) {
        getData()
        valueFrom = inputFrom.text ?? "0"
    }
    
    @objc func getData(){
        apiConn.exchangeValue(symbolFrom: selected1, symbolTo: selected2, value: String(valueFrom)){ (result) in
            self.inputTo.text = String(result.rates[0].value)
        }
    }
    
}

extension DetailsViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        values.count
    }
}

extension DetailsViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return values[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selected1 = values[pickerView.selectedRow(inComponent: 0)]
        selected2 = values[pickerView.selectedRow(inComponent: 1)]
    }
}
