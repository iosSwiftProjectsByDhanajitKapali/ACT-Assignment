//
//  NetworkManager.swift
//  ACT-Assignment
//
//  Created by unthinkable-mac-0025 on 21/06/21.
//

import Foundation

struct NetworkManager{
    func getApiData<T:Codable>(forUrl : URL, resultType:T.Type, completionHandler:@escaping(_ result : T)-> Void){
        
        URLSession.shared.dataTask(with: forUrl) { (data, response, error) in
            
            guard error == nil else{
                print("Error in Api Call")
                return
            }
            guard data != nil else{
                print("No Data Recieved")
                return
            }
            guard response != nil else{
                print("No Response Recieved")
                return
            }
            do{
                let result = try JSONDecoder().decode(T.self, from: data!)
                _ = completionHandler(result)
               // print(result)
                
                
            }catch let err{
                print("Error Parsing JSON \(err.localizedDescription)")
            }
        }.resume()
    }
    
    
    func postApiData<T:Codable>(requestUrl: URL, requestBody: Data, resultType: T.Type, completionHandler:@escaping(_ result: T)-> Void){
        
        var urlRequest = URLRequest(url: requestUrl)
        urlRequest.httpMethod = "post"
        urlRequest.httpBody = requestBody
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-type")

        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            guard error == nil else{
                print("Error in Api Call")
                return
            }
            guard data != nil else{
                print("No Data Recieved")
                return
            }
            guard response != nil else{
                print("No Response Recieved")
                return
            }
            do{
                let result = try JSONDecoder().decode(T.self, from: data!)
                _ = completionHandler(result)
               // print(result)
                
                
            }catch let err{
                print("Error Parsing JSON \(err.localizedDescription)")
            }
            
        }.resume()
    }
}
