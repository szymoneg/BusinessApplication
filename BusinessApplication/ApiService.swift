//
//  ApiService.swift
//  BusinessApplication
//
//  Created by Szymon Biliński on 29/03/2021.
//

import Foundation


class ApiService {
    private var dataTask: URLSessionDataTask?
        
        func getPopularMoviesData(completion: @escaping (Result<CurrencyData, Error>) -> Void){
            let moviesURL = "https://api.exchangeratesapi.io/latest?base=USD?access_key=a0915eb86a90b91d32e153e5b07c9c0c"
            
            guard let url = URL(string: moviesURL) else {
                return
            }
            
            dataTask = URLSession.shared.dataTask(with: url){ (data, response, error) in
                if let error = error{
                    completion(.failure(error))
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
                    let decoder = JSONDecoder()
                    let jsonData = try decoder.decode(CurrencyData.self, from: data)
                    
                    DispatchQueue.main.async {
                        completion(.success(jsonData))
                    }
                    
                }catch let error{
                    completion(.failure(error))
                }
            }
            dataTask?.resume()
        }
}
