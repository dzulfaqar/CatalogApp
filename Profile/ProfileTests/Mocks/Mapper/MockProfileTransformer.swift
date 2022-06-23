//
//  MockProfileTransformer.swift
//  ProfileTests
//
//  Created by Dzulfaqar on 23/06/22.
//

import Common
import Core
import Profile

class MockProfileTransformer: Mapper {
  public typealias Response = Any
  public typealias Entity = ProfileEntity
  public typealias Domain = ProfileModel

  private var functionWasCalled = false
  var responseEntity: ProfileEntity?
  var responseDomain: ProfileModel?

  func verify() -> Bool {
    return functionWasCalled
  }

  func transformResponseToDomain(response: Any) -> ProfileModel {
    fatalError()
  }

  func transformResponseToEntity(response: Any) -> ProfileEntity {
    fatalError()
  }

  func transformEntityToDomain(entity: ProfileEntity) -> ProfileModel {
    functionWasCalled = true
    return responseDomain!
  }

  func transformDomainToEntity(domain: ProfileModel?) -> ProfileEntity {
    functionWasCalled = true
    return responseEntity!
  }
}
