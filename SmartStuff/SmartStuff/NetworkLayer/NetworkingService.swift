//
//  NetworkingService.swift
//  SmartStuff
//
//  Created by Григорий Виняр on 18.08.2021.
//

import Foundation

protocol NetworkingServiceProtocol: AnyObject {
    func getListOfDevices(completion: @escaping (Result<[Device], Error>) -> Void)
    func deleteDevice(from id: Int)
    func resetDeletedDevices()
}

class NetworkingService: NetworkingServiceProtocol {
    
    func resetDeletedDevices() {
        let configuration = URLSessionConfiguration.default
        
        let session = URLSession(configuration: configuration)
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "dev.api.sls.ompr.io"
        urlComponents.path = "/api/v1/test/devices/reset-deleted"
        urlComponents.queryItems = [
            URLQueryItem(name: "key", value: "Accept"),
            URLQueryItem(name: "type", value: "text"),
            URLQueryItem(name: "value", value: "application/json"),
            URLQueryItem(name: "disabled", value: "true")
        ]
        
        guard let url = urlComponents.url else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = urlComponents.percentEncodedQuery?.data(using: .utf8)
        
        let dataTask = session.dataTask(with: request) { data, response, error in
            if error != nil {
                return
            }
            
            guard let data = data else { return }
            RequestHelper.log(data: data, response: response as? HTTPURLResponse, error: error)
        }
        dataTask.resume()
    }
    
    func deleteDevice(from id: Int) {
        
        let configuration = URLSessionConfiguration.default
        
        let session = URLSession(configuration: configuration)
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "dev.api.sls.ompr.io"
        urlComponents.path = "/api/v1/test/devices/\(id)"
        
        guard let url = urlComponents.url else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
        let dataTask = session.dataTask(with: request) { data, response, error in
            if error != nil {
                return
            }
            
            guard let data = data else {
                print("Error: Did not receive data")
                return
            }
            
            guard let result = String(data: data, encoding: .utf8) else { return }
            print(result)
            
        }
        dataTask.resume()
    }
    
    func getListOfDevices(completion: @escaping (Result<[Device], Error>) -> Void) {
        
        let configuration = URLSessionConfiguration.default
        configuration.urlCache = URLCache(memoryCapacity: 50 * 1000,
                                          diskCapacity: 50 * 1000,
                                          diskPath: "devices")
        let session = URLSession(configuration: configuration)
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "dev.api.sls.ompr.io"
        urlComponents.path = "/api/v1/test/devices"
        
        guard let url = urlComponents.url else { return }
        
        var request = URLRequest(url: url)
        request.cachePolicy = .useProtocolCachePolicy
        
        let dataTask = session.dataTask(with: request) { data, response, error in
            if error != nil {
                completion(.failure(error!))
                return
            }
            
            guard let data = data else { return }
            RequestHelper.log(data: data, response: response as? HTTPURLResponse, error: error)
            do {
                let devices = try JSONDecoder().decode(DeviceData.self, from: data).data
                DispatchQueue.main.async {
                    completion(.success(devices))
                }
            } catch {
                completion(.failure(error))
            }
        }
        dataTask.resume()
    }
    
}
