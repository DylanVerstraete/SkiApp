import Foundation
import Alamofire

class UserService{
    static let url = "http://127.0.0.1:5000/api/"
    
    static var userToken: String?
    static var email: String?
    
    static func login(email: String, password: String, succes: @escaping () -> Void, failure: @escaping (_ error: Any) -> Void){
        let params: Parameters = [
            "email":email,
            "password":password
        ]
        
        Alamofire.request(url + "login", method: .post, parameters: params,  encoding: JSONEncoding.default).responseJSON {
            response in
            
            if(response.result.isSuccess){
                if response.response?.statusCode == 401{
                    failure("foute username of passwoord")
                }
                else{
                    let json = response.result.value as! [String: Any]
                    
                    self.userToken = json["token"] as? String
                    self.email = email
                    succes()
                }
            } else {
                failure("connectie naar server mislukt")
            }
        }
    }
    
    static func register(email: String, password: String, succes: @escaping () -> Void, failure: @escaping (_ error: Any) -> Void){
        let params: Parameters = [
            "email":email,
            "password":password
        ]
        
        Alamofire.request(url + "signup", method: .post, parameters: params,  encoding: JSONEncoding.default).responseJSON {
            response in
            
            if(response.result.isSuccess){
                if response.response?.statusCode == 401{
                    failure("email of password is niet correct")
                }
                else{
                    _ = response.result.value as! [String: Any]
                    
                    //self.userToken = json["token"] as? String
                    self.email = email
                    
                    succes()
                }
            } else {
                failure("connectie naar server mislukt")
            }
        }
    }
    
    static func getCurrentUser(succes: @escaping (_ user: User) -> Void, failure: @escaping (_ error: Any) -> Void){
        let headers = [
            "Authorization": "Bearer " + self.userToken!
        ]
        Alamofire.request(url + "users/" + self.email!, method: .get, encoding: JSONEncoding.default, headers: headers).responseJSON {
            response in
            
            if(response.result.isSuccess){
                if response.response?.statusCode == 401{
                    failure("User niet gevonden")
                }
                else{
                    let json = response.result.value as! [String: Any]
                    
                    var member = json["member"] as! [String: Any]

                    let userObj = User(email: self.email!, firstname: (json["firstname"] as? String)!, lastname: (json["lastname"] as? String)!, address: (json["address"] as? String)!, addresspostalcode: (json["addresspostalcode"] as? String)!, addresscity: (json["addresscity"] as? String)!, addressnumber: (json["addressnumber"] as? String)!, telephonenumber: (json["telephonenumber"] as? String)!)
                    
                    userObj.totalskiturns = (json["totalskiturns"] as? Int)!
                    
                    var skicards = json["skicards"] as! [[String: Any]]

                    userObj.totalskicards = skicards.count
                    //for skicard in skicards {
                        //let skicard = Skicard(payed: skicard["payed"], numberOfTurns: skicard["numberOfTurn"])
                        //userObj.skicards.append(skicard)
                    //}

                    if(member["isMember"] as? Int == 1){
                        userObj.member.isMember = true
                    }else{
                        userObj.member.isMember = false
                    }
                    if(member["pending"] as? Int == 1){
                        userObj.member.pending = true
                    }else{
                        userObj.member.pending = false
                    }

                    succes(userObj)
                }
            } else {
                failure("connectie naar server mislukt")
            }
        }
    }
    
    static func updateUser(user: User, succes: @escaping () -> Void, failure: @escaping (_ error: Any) -> Void){
        let headers = [
            "Authorization": "Bearer " + self.userToken!
        ]
        let params: Parameters = [
            "email":self.email!,
            "firstname":user.firstname ?? "",
            "lastname":user.lastname ?? "",
            "address":user.address ?? "",
            "addressnumber":user.addressnumber ?? "",
            "addresspostalcode":user.addresspostalcode ?? "",
            "addresscity":user.addresscity ?? "",
            "telephonenumber":user.telephonenumber ?? ""
        ]
        Alamofire.request(url + "users/edit/" + self.email!, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers).responseJSON {
            response in
            
            if(response.result.isSuccess){
                if response.response?.statusCode == 401{
                    failure("User niet gevonden")
                }
                else{
                    succes()
                }
            } else {
                failure("connectie naar server mislukt")
            }
        }
    }
    
    static func addCard(succes: @escaping () -> Void, failure: @escaping (_ error: Any) -> Void){
        let headers = [
            "Authorization": "Bearer " + self.userToken!
        ]
        let params: Parameters = [
            "email":self.email!,
        ]
        Alamofire.request(url + "users/requestCard/", method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers).responseJSON {
            response in
            
            if(response.result.isSuccess){
                if response.response?.statusCode == 401{
                    failure("User niet gevonden")
                }
                else{
                    succes()
                }
            } else {
                failure("connectie naar server mislukt")
            }
        }
    }
    
    static func deleteMember(succes: @escaping () -> Void, failure: @escaping (_ error: Any) -> Void){
        let headers = [
            "Authorization": "Bearer " + self.userToken!
        ]
        let params: Parameters = [
            "email":self.email!,
            ]
        Alamofire.request(url + "add/member", method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers).responseJSON {
            response in
            
            if(response.result.isSuccess){
                if response.response?.statusCode == 401{
                    failure("User niet gevonden")
                }
                else{
                    succes()
                }
            } else {
                failure("connectie naar server mislukt")
            }
        }
    }
    
    static func AddMember(succes: @escaping () -> Void, failure: @escaping (_ error: Any) -> Void){
        let headers = [
            "Authorization": "Bearer " + self.userToken!
        ]
        let params: Parameters = [
            "email":self.email!,
            ]
        Alamofire.request(url + "delete/member", method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers).responseJSON {
            response in
            
            if(response.result.isSuccess){
                if response.response?.statusCode == 401{
                    failure("User niet gevonden")
                }
                else{
                    succes()
                }
            } else {
                failure("connectie naar server mislukt")
            }
        }
    }
    
    static func GetImages(succes: @escaping (_ images: [Image]) -> Void, failure: @escaping (_ error: Any) -> Void){
        let headers = [
            "Authorization": "Bearer " + self.userToken!
        ]
        Alamofire.request(url + "image/all", method: .get, encoding: JSONEncoding.default, headers: headers).responseJSON {
            response in
            
            if(response.result.isSuccess){
                if response.response?.statusCode == 401{
                    failure("User niet gevonden")
                }
                else{
                    let json = response.result.value as! [[String: Any]]
                    //print(json)
                    var images: [Image] = []
                    for image in json{
                        //print(image)
                        let image = Image(value: image["value"] as! String, fileName: image["filename"] as! String)
                        images.append(image)
                    }

                    succes(images)
                }
            } else {
                failure("connectie naar server mislukt")
            }
        }
    }
    
    static func AddImage(image: Image, succes: @escaping () -> Void, failure: @escaping (_ error: Any) -> Void){
        print(image)
        let headers = [
            "Authorization": "Bearer " + self.userToken!
        ]
        let params: Parameters = [
            "email":self.email!,
            "filename":image.fileName,
            "value":image.value
        ]
        Alamofire.request(url + "image/add", method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers).responseJSON {
            response in
            
            if(response.result.isSuccess){
                if response.response?.statusCode == 401{
                    failure("User niet gevonden")
                }
                else{
                    print(image)
                    succes()
                }
            } else {
                failure("connectie naar server mislukt")
            }
        }
    }
    
    
}

