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
            let moviesURL = "http://api.exchangeratesapi.io/v1/latest?access_key=c10e8b32c392b724355ae693c6d02f1c"
            
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
