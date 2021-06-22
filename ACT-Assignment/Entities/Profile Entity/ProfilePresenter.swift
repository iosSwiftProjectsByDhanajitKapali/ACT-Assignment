//
//  ProfilePresenter.swift
//  ACT-Assignment
//
//  Created by unthinkable-mac-0025 on 21/06/21.
//

import Foundation

protocol ProfilePresenterDelegate : AnyObject{
    func presentAlert(title : String, message : String)
    func stopAndHideLoader()
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
            NetworkManager().postApiData(requestUrl: url!, requestBody: encodedRequest, resultType: MessageResponse.self) { (result) in
                switch result{
                case .success(let message):
                    print(message.id)
                    self.delegate?.stopAndHideLoader()
                case .failure(let error):
                    self.delegate?.presentAlert(title: "Error" , message: error.localizedDescription)
                    self.delegate?.stopAndHideLoader()
                }
            }
        }catch let err{
            print(err)
            self.delegate?.presentAlert(title: "Error" , message: err.localizedDescription)
            self.delegate?.stopAndHideLoader()
        }
    } //:makePostApiCall
    
    public func makeGetApiCall(){
        //getOnePost()
        getAllPosts()
    }
    
    public func getVaccineAppointmentFor(pincode : String, withDate : String){
        var urlString = "https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByPin?"
        urlString += "pincode=\(pincode)&date=\(withDate)"
        let url = URL(string: urlString)
        
        //make the call
        NetworkManager().getApiData(forUrl: url!, resultType: VaccineCenters.self) { (result) in
            switch result{
            case .success(let details):
                for i in 0...details.sessions.count-1{
                    print(details.sessions[i].name)
                    print("\n")
                }
                self.delegate?.stopAndHideLoader()
            case .failure(let error):
                print(error.localizedDescription)
                self.delegate?.stopAndHideLoader()
                self.delegate?.presentAlert(title: "Error" , message: error.localizedDescription)
            }
        }
    }
    
    private func getAllPosts(){
        let allPostUrl = "https://jsonplaceholder.typicode.com/posts"
        let url = URL(string: allPostUrl)
        
        //make the call
        NetworkManager().getApiData(forUrl: url!, resultType: [MessageResponse].self) { (result) in
            switch result{
            case .success(let messages):
                if(messages.count != 0){
                    for message in messages{
                        print(message.id)
                    }
                }
                self.delegate?.stopAndHideLoader()
            case .failure(let error):
                print(error.localizedDescription)
                self.delegate?.presentAlert(title: "Error" , message: error.localizedDescription)
                self.delegate?.stopAndHideLoader()
            }
        }
    }
    
    private func getOnePost(){
        let onePostUrl = "https://jsonplaceholder.typicode.com/posts/1"
        let url = URL(string: onePostUrl)
        //make the call
        NetworkManager().getApiData(forUrl: url!, resultType: MessageResponse.self) { (result) in
            switch result{
            case .success(let message):
                print(message.id)
                self.delegate?.stopAndHideLoader()
            case .failure(let error):
                print(error.localizedDescription)
                self.delegate?.presentAlert(title: "Error" , message: error.localizedDescription)
                self.delegate?.stopAndHideLoader()
            }
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




