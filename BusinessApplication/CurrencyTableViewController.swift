//
//  CurrencyTableViewController.swift
//  BusinessApplication
//
//  Created by Szymon Biliński on 22/03/2021.
//

import UIKit


class CurrencyTableViewController: UITableViewController {
    
    let obj = ApiService()
    var emptyDoubles:[Double] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Currency Table"
        obj.getPopularMoviesData{ (result) in
            self.emptyDoubles.append(try! result.get().rates.AUD)
            print(result)
        }
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emptyDoubles.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyCell", for: indexPath)

        cell.textLabel?.text = "Value \(emptyDoubles[indexPath.row])"
        
        return cell
    }
    


}
