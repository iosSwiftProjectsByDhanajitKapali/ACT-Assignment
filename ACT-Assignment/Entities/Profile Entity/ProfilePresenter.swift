//
//  ProfilePresenter.swift
//  ACT-Assignment
//
//  Created by unthinkable-mac-0025 on 21/06/21.
//

import Foundation

protocol ProfilePresenterDelegate : AnyObject{
    
}

class ProfilePresenter{
    
    weak var delegate : ProfilePresenterDelegate?
    
    init(withDelegate delegate : ProfilePresenterDelegate) {
        self.delegate  = delegate
    }
    
    public func makePostApiCall(title : String, body : String , id : Int){
        //create the URL
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts/")
        let request = MessageRequest(title: title, body: body, userId: id)
        
        //encode the data
        do{
            let encodedRequest = try JSONEncoder().encode(request)
            NetworkManager().postApiData(requestUrl: url!, requestBody: encodedRequest, resultType: MessageResponse.self) { (message) in
                print(message.id)
            }

        }catch let err{
            print(err)
        }
    } //:makePostApiCall
    
    public func makeGetApiCall(){
        //getOnePost()
        getAllPosts()
    }
    
    private func getAllPosts(){
        let allPostUrl = "https://jsonplaceholder.typicode.com/posts"
        let url = URL(string: allPostUrl)
        
        //make the call
        NetworkManager().getApiData(forUrl: url!, resultType: [MessageResponse].self) { (messages) in
            if(messages.count != 0){
                for message in messages{
                    print(message.id)
                }
            }
        }
    }
    
    private func getOnePost(){
        let onePostUrl = "https://jsonplaceholder.typicode.com/posts/1"
        let url = URL(string: onePostUrl)
        //make the call
        NetworkManager().getApiData(forUrl: url!, resultType: MessageResponse.self) { (message) in
            print(message.id)
        }
    }
    
}

struct MessageRequest : Codable{
    let title : String
    let body : String
    let userId : Int
}


struct MessageResponse : Codable {
    let id : Int
    let title : String
    let body : String
    let userId : Int
}

