//
//  Service.swift
//  ADummyProject
//
//  Created by Eraldo Jr. on 25/10/22.
//

import Foundation

internal enum Request {

    case posts
    case commentsByPost(Int)

    internal var route: String {
        switch self {
        case .posts:
            return "posts"
        case let .commentsByPost(postId):
            return "post/\(postId)/comments"
        }
    }

}

internal protocol ServiceProtocol {

    func fetchPosts(completion: @escaping (Result<[Post], Error>) -> Void)
    func fetchCommentsByPost(postId: Int, completion: @escaping (Result<[Comment], Error>) -> Void)

}

internal class RequestError: Error {

}

internal class Service: ServiceProtocol {

    internal static let shared = Service()

    private init() {

    }

    private let baseURL = "https://jsonplaceholder.typicode.com"

    private func fetch<T: Codable>(_ route: String, completion: @escaping  (Result<T, Error>) -> Void) {
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

    internal func fetchPosts(completion: @escaping (Result<[Post], Error>) -> Void) {
        self.fetch(Request.posts.route, completion: completion)
    }

    internal func fetchCommentsByPost(postId: Int, completion: @escaping (Result<[Comment], Error>) -> Void) {
        self.fetch(Request.commentsByPost(postId).route, completion: completion)
    }

}
