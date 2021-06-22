//
//  NetworkManager.swift
//  ACT-Assignment
//
//  Created by unthinkable-mac-0025 on 21/06/21.
//

import Foundation

struct NetworkManager{
    func getApiData<T:Codable>(forUrl : URL, resultType:T.Type, completionHandler:@escaping(Result<T, ResponseStatus>)-> Void){
        
        URLSession.shared.dataTask(with: forUrl) { (data, response, error) in
            
            guard error == nil else{
                print("Error in Api Call")
                completionHandler(.failure(.error(err: error!.localizedDescription)))
                return
            }
            guard data != nil else{
                print("No Data Recieved")
                completionHandler(.failure(.invalidData))
                return
            }
            guard response != nil else{
                print("No Response Recieved")
                completionHandler(.failure(.invalidResponse))
                return
            }
            do{
                let result = try JSONDecoder().decode(T.self, from: data!)
                completionHandler(.success(result))
               // print(result)
                
                
            }catch let err{
                print("Error Parsing JSON \(err.localizedDescription)")
                completionHandler(.failure(.error(err: err.localizedDescription)))
            }
        }.resume()
    }
    
    
    func postApiData<T:Codable>(requestUrl: URL, requestBody: Data, resultType: T.Type, completionHandler:@escaping(Result<T, ResponseStatus>)-> Void){
        
        var urlRequest = URLRequest(url: requestUrl)
        urlRequest.httpMethod = "post"
        urlRequest.httpBody = requestBody
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-type")

        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            guard error == nil else{
                print("Error in Api Call")
                completionHandler(.failure(.error(err: error!.localizedDescription)))
                return
            }
            guard data != nil else{
                print("No Data Recieved")
                completionHandler(.failure(.invalidData))
                return
            }
            guard response != nil else{
                print("No Response Recieved")
                return
            }
            do{
                let result = try JSONDecoder().decode(T.self, from: data!)
//                _ = completionHandler(result, .success)
                completionHandler(.success(result))
               // print(result)
                
                
            }catch let err{
                print("Error Parsing JSON \(err.localizedDescription)")
                completionHandler(.failure(.decodingError(err: err.localizedDescription)))
            }
            
        }.resume()
    }
}

enum ResponseStatus : Error{
    case error(err : String)
    case invalidResponse
    case invalidData
    case decodingError(err : String)
}
