//
//  CLLocationCoordinate2D+places.swift
//  iMap
//
//  Created by ksd on 02/10/2024.
//

import CoreLocation

extension CLLocationCoordinate2D {
    static var erhvervsakademiAarhus: CLLocationCoordinate2D {
        .init(latitude: 56.119657, longitude: 10.158651)
    }
    static var mcDonaldsViby: CLLocationCoordinate2D {
        .init(latitude: 56.129637119054145, longitude: 10.160731432605544)
    }
    
    static let Copenhagen: Self = .init(
        latitude: 55.676704,
        longitude: 12.568478
    )
    
    static let DanishParliament: Self = .init(
        latitude: 55.676266,
        longitude: 12.580601
    )
    
    static let ChristianVII: Self = .init(
        latitude: 55.683779,
        longitude: 12.592124
    )
    
    static let Opera: Self = .init(
        latitude: 55.682018,
        longitude: 12.600623
    )
    
    static let Tivoli: Self = .init(
        latitude: 55.673682,
        longitude: 12.568311
    )
    
    static let Zoo: Self = .init(
        latitude: 55.672418,
        longitude: 12.521077
    )
}
