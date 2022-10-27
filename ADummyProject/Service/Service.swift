//
//  Service.swift
//  ADummyProject
//
//  Created by Eraldo Jr. on 25/10/22.
//

import Foundation

internal enum Request {
    
    case fetchUsers
    
    internal var route: String {
        switch self {
        case .fetchUsers:
            return "users"
        }
    }
    
}

internal protocol ServiceProtocol {
    
    func fetchUsers(completion: @escaping (Result<[DummyUser], Error>) -> Void)
    
}

internal class RequestError: Error {
    
}

internal class Service: ServiceProtocol {
    
    internal static let shared = Service()
    
    private init() {
        
    }
    
    private let baseURL = "https://jsonplaceholder.typicode.com"
    
    private func fetch<T: Codable>(_ route: String, completion: @escaping  (Result<T, Error>) -> ()) {
        let base = URL(string: baseURL)
        guard let requestURL = base?.appendingPathComponent(route) else {
            return
        }
        URLSession.shared.dataTask(with: requestURL) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                }
                guard let data else {
                    completion(.failure(RequestError()))
                    return
                }
                
                do {
                    let response = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(response))
                } catch let err {
                    completion(.failure(err))
                }
            }
        }.resume()
    }
    
}

extension Service {

    internal func fetchUsers(completion: @escaping (Result<[DummyUser], Error>) -> Void) {
        self.fetch(Request.fetchUsers.route, completion: completion)
    }

}
