//
//  Client.swift
//  GenericRequestLibrary
//
//  Created by user198829 on 6/20/21.
//

import Foundation

class Client: NetworkGeneric {
    
    var baseURL:String
    var session: URLSession
    
    init(baseURL:String, path:String, session: URLSession) {
        self.baseURL = baseURL
        self.session = session
    }
    
    func get<T: Decodable>(path: String, type:T.Type, complete: @escaping (Result<T, ApiError>) -> Void) {
        let url = URL(string: "\(baseURL)\(path)")
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        self.fetch(type: T.self, with: request, completion: complete)
    }
    
    //func postJson(album: Album, complete:  @escaping (Feed) -> Void) {
    func post<T: Decodable>(path:String, body: [String: Any], type:T.Type, complete: @escaping (Result<T, ApiError>) -> Void){
        let url = URL(string: "\(baseURL)\(path)")
        
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let data = try! JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
        request.httpBody = data
        
        self.fetch(type: T.self, with: request, completion: complete)
        
    }
    
    func put<T: Decodable>(path:String, body: [String: Any], type: T.Type, complete: @escaping (Result<T, ApiError>) -> Void) {
            let url = URL(string: "\(baseURL)\(path)")
            
            var request = URLRequest(url: url!)
            request.httpMethod = "PUT"
            
            let data = try! JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
                request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
            request.httpBody = data
                        
            self.fetch(type: T.self, with: request, completion: complete)
        }
    
    func delete<T: Decodable>(path: String, type:T.Type,  complete: @escaping (Result<T, ApiError>) -> Void) {
            let url = URL(string: "\(baseURL)\(path)")
        
            var request = URLRequest(url: url!)
            request.httpMethod = "DELETE"
            
            self.fetch(type: T.self, with: request, completion: complete)
        }
}

    
    // Ejemplo1
  /*  func post(album: Album, complete: @escaping (Feed) -> Void) {
        let path = "coming-soon/all/50/explicit.json"
        let url = URL(string: "\(baseURL)\(path)")
        
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        
        let parameters: [String: Any] = [
            "id": album.id,
            "name": album.name,
            "artistName": album.artistName
        ]
        
        request.httpBody = parameters.toData()
        
        self.fetch(type: Feed.self, with: request) { resut in
            switch resut{
            case .success(let feed):
                complete(feed)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    // Ejemplo 2
    func postJson(album: Album, complete:  @escaping (Feed) -> Void) {
        let path = "coming-soon/all/50/explicit.json"
        let url = URL(string: "\(baseURL)\(path)")
        
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let data = try! JSONEncoder().encode(album)
        request.httpBody = data
        
        self.fetch(type: Feed.self, with: request) { resut in
            switch resut{
            case .success(let feed):
                complete(feed)
            case .failure(let error):
                print(error)
            }
        }
    
    }*/

