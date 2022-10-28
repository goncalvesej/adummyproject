//
//  ServiceMock.swift
//  ADummyProjectTests
//
//  Created by Eraldo Jr. on 25/10/22.
//

import Foundation

@testable import ADummyProject

internal final class ServiceMock: ServiceProtocol {

    internal func fetchUsers(completion: @escaping (Result<[DummyUser], Error>) -> Void) {
        completion(.success([]))
    }
}
