//
//  MockGetFavoriteDetailRepository.swift
//  DetailTests
//
//  Created by Dzulfaqar on 21/06/22.
//

import Foundation
import Combine
import Common
import Core

@testable import Profile
public class MockGetFavoriteDetailRepository<Locale: LocaleDataSource, Transformer: Mapper>: Repository
where Locale.Response == FavoriteEntity,
      Transformer.Response == Any,
      Transformer.Entity == [FavoriteEntity],
      Transformer.Domain == [FavoriteModel] {

  public typealias Request = Int
  public typealias Response = [FavoriteModel]

  var isSuccess = true
  var responseValue: [FavoriteModel]?
  var errorValue: Error?
  var functionWasCalled = false

  func verify() -> Bool {
    return functionWasCalled
  }

  public func execute(request: Int?) -> AnyPublisher<[FavoriteModel], Error> {
    functionWasCalled = true
    return Future<[FavoriteModel], Error> { completion in
      if self.isSuccess {
        if let responseValue = self.responseValue {
          completion(.success(responseValue))
        }
      } else {
        if let errorValue = self.errorValue {
          completion(.failure(errorValue))
        }
      }
    }.eraseToAnyPublisher()
  }
}
