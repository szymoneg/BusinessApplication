//
//  CurrencyTableViewController.swift
//  BusinessApplication
//
//  Created by Szymon Biliński on 22/03/2021.
//

import UIKit


class CurrencyTableViewController: UITableViewController {
    
    let obj = ApiService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        obj.getPopularMoviesData{ (result) in
            print(result)
        }
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyCell", for: indexPath)

        cell.textLabel?.text = "Row \(indexPath.row)"
        
        return cell
    }
    


}
