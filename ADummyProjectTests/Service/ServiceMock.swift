//
//  ServiceMock.swift
//  ADummyProjectTests
//
//  Created by Eraldo Jr. on 25/10/22.
//

import Foundation

@testable import ADummyProject

internal final class ServiceMock: ServiceProtocol {

    internal func fetchPosts(completion: @escaping (Result<[Post], Error>) -> Void) {
        completion(.success([]))
    }

    internal func fetchCommentsByPost(postId: Int, completion: @escaping (Result<[Comment], Error>) -> Void) {
        completion(.success([]))
    }

}
