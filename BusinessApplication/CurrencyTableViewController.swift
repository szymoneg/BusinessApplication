//
//  CurrencyTableViewController.swift
//  BusinessApplication
//
//  Created by Szymon Biliński on 22/03/2021.
//

import UIKit


class CurrencyTableViewController: UITableViewController {
    
    @IBOutlet weak var textFiield: UILabel!
    
    var index = 0
    
    let fetchData = ApiService()
    var allRates: RatesDetailModel?
    private let refreshCtrl = UIRefreshControl()
    
    @objc func getData(){
        fetchData.fetchExchangeData{(result) in
            self.allRates = result
            self.tableView.reloadData()
        }
    }
    
    func setupRefreshControl() {
         if #available(iOS 10.0, *) {
             tableView.refreshControl = refreshCtrl
         } else {
             tableView.addSubview(refreshCtrl)
         }
         refreshCtrl.addTarget(self, action: #selector(getData), for: .valueChanged)
     }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allRates?.rates.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyCell", for: indexPath)
        
        guard let data = allRates?.rates else { return cell }
        let rateData = data[indexPath.row]
        
        cell.textLabel?.text = "\(rateData.symbol): \(String(rateData.value))"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let data = allRates?.rates else { return }
        let rateData = data[indexPath.row]
        
        let vc = storyboard?.instantiateViewController(identifier: "setCurrencyViewController") as? SetCurrencyViewController
        vc?.value = String(rateData.value)
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Currency Table"
        
        setupRefreshControl()
        getData()
    }
}
