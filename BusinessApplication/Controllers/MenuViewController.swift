//
//  MenuViewController.swift
//  BusinessApplication
//
//  Created by Szymon Biliński on 03/04/2021.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var goToExchangeButton: UIButton!
    @IBOutlet weak var goToCurrencyListButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        goToExchangeButton.layer.cornerRadius = 15.0
        goToCurrencyListButton.layer.cornerRadius = 15.0
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
