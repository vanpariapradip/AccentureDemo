//
//  BaseClient.swift
//  AccentureDemo
//
//  Created by Pradip Vanparia on 17/10/22.
//

import Foundation

class BaseClient {
    
    let baseURL: String = "https://private-anon-cf651c58e0-androidtestmobgen.apiary-mock.com"
    
    func getRequest(_ path: String) -> URLRequest? {
        guard let url = URL(string: baseURL)?.appendingPathComponent(path) else {
            return nil
        }
        
        var requst = URLRequest(url: url)
        requst.httpMethod = "GET"
        return requst
    }
    
    func downloadData<T: Decodable>(_ path: String, _ completion: @escaping ([T]?, Error?) -> ()) {
        guard let request = getRequest(path) else {
            return completion(nil, nil)
        }
        
        URLSession.shared.dataTask(with: request) { (data, urlResponse, error) in
            if let data = data {
                let jsonDecoder = JSONDecoder()
                do {
                    let responseData = try jsonDecoder.decode([T].self, from: data)
                    completion(responseData, nil)
                    
                } catch (let e) {
                    completion(nil, e)
                    
                }
            } else {
                completion(nil, error)
            }
        }.resume()
    }
}
