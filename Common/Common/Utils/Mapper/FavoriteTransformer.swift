//
//  FavoriteTransformer.swift
//  Common
//
//  Created by Dzulfaqar on 19/06/22.
//

import Foundation
import Core

public struct FavoriteTransformer: Mapper {
  public typealias Response = Any
  public typealias Entity = [FavoriteEntity]
  public typealias Domain = [FavoriteModel]

  public init() {}

  public func transformResponseToDomain(response: Any) -> [FavoriteModel] {
    fatalError()
  }

  public func transformResponseToEntity(response: Any) -> [FavoriteEntity] {
    fatalError()
  }

  public func transformEntityToDomain(entity: [FavoriteEntity]) -> [FavoriteModel] {
    return entity.map { data in
      return transformEntityToDomain(entity: data)
    }
  }

  public func transformEntityToDomain(entity: FavoriteEntity) -> FavoriteModel {
    return FavoriteModel(
      id: entity.id,
      image: entity.image,
      name: entity.name,
      released: entity.released,
      rating: entity.rating,
      date: entity.date
    )
  }

  public func transformDomainToEntity(domain: [FavoriteModel]?) -> [FavoriteEntity] {
    return domain?.map { data in
      return transformDomainToEntity(domain: data)
    } ?? []
  }

  public func transformDomainToEntity(domain: FavoriteModel) -> FavoriteEntity {
    return FavoriteEntity(
      id: domain.id,
      image: domain.image,
      name: domain.name,
      released: domain.released,
      rating: domain.rating,
      date: domain.date
    )
  }
}
