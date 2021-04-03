//
//  ApiService.swift
//  BusinessApplication
//
//  Created by Szymon Biliński on 29/03/2021.
//

import Foundation


class ApiService {
    private var dataTask: URLSessionDataTask?
        
    func fetchExchangeData(completion: @escaping (RatesDetailModel) -> ()){
            let moviesURL = "https://api.ratesexchange.eu/client/latestdetails?apiKey=cbbec2bf-ab4c-4754-9843-c317a4e11d11"
            
            guard let url = URL(string: moviesURL) else {
                return
            }
            
            URLSession.shared.dataTask(with: url){ (data, response, error) in
                if error != nil{
                    //.completion(.failure(error))
                    print("Datatask error")
                    return
                }
                
                guard let response = response as? HTTPURLResponse else{
                    print("Empty response")
                    return
                }
                
                print("Response status code \(response.statusCode)")
                
                guard let data = data else{
                    print("Empty Data")
                    return
                }
                
                do{
                    let responseModel = try JSONDecoder().decode(RatesDetailModel.self, from: data)
                    
                    DispatchQueue.main.async {
                        completion(responseModel)
                    }
                    
                }catch let jsonErorr{
                    print(jsonErorr)
                }
            }.resume()
        }
}
