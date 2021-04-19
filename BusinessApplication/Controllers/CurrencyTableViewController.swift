//
//  CurrencyTableViewController.swift
//  BusinessApplication
//
//  Created by Szymon Biliński on 22/03/2021.
//

import UIKit
import RxSwift

class CurrencyTableViewCell: UITableViewCell {
    @IBOutlet weak var currencySymbol: UILabel!
    @IBOutlet weak var valueCurrency: UILabel!
    @IBOutlet weak var flagIcon: UIImageView!
}


class CurrencyTableViewController: UITableViewController {
    
    
    @IBOutlet weak var nameCurrency: UILabel!
    
    
    let disposeBag = DisposeBag()
    let fetchData = ApiService()
    var allRates: RatesDetailModel?
    var url: String = "EUR"
    private let refreshCtrl = UIRefreshControl()
    
    @objc func getData(){
        print(url)
        fetchData.fetchExchangeData(baseUrl: url){(result) in
            self.allRates = result
            self.tableView.reloadData()
        }
    }
    
//    func setupRefreshControl() {
//         if #available(iOS 10.0, *) {
//             tableView.refreshControl = refreshCtrl
//         } else {
//             tableView.addSubview(refreshCtrl)
//         }
//         refreshCtrl.addTarget(self, action: #selector(getData), for: .valueChanged)
//     }
    
    
    @IBAction func refreshTable(_ sender: UIRefreshControl) {
        getData()
        sender.endRefreshing()
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allRates?.rates.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyCell", for: indexPath) as! CurrencyTableViewCell
        
        guard let data = allRates?.rates else { return cell }
        let rateData = data[indexPath.row]
        
        //cell.textLabel?.text = "\(rateData.symbol): \(String(rateData.value))"
        cell.currencySymbol.text = rateData.symbol
        cell.valueCurrency.text = String(rateData.value)
        cell.flagIcon.image = UIImage(named: rateData.symbol.lowercased())
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let data = allRates?.rates else { return }
        let rateData = data[indexPath.row]

        
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "setCurrencyViewController") as! SetCurrencyViewController
        
        detailVC.valueCurrency = rateData.symbol
        detailVC.realValue = String(rateData.value)
        detailVC.descritionValue = rateData.currency
        
        
        detailVC.selectedCurrency
            .subscribe(onNext: { [weak self] character in
                self?.url = character
                self?.getData()
            }).disposed(by: disposeBag)
       
        navigationController?.pushViewController(detailVC, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Currency Table"
        
        getData()
    }
}
