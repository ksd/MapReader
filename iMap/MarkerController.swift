//
//  MarkerController.swift
//  iMap
//
//  Created by ksd on 02/10/2024.
//

import CoreLocation

@Observable
class MarkerController {
    var markers: [CLLocationCoordinate2D] = [
        .ChristianVII,
        .DanishParliament,
        .Opera,
        .Tivoli,
        .Zoo
    ]
    
    func addMarker(_ coordinate: CLLocationCoordinate2D) {
        markers.append(coordinate)
    }
}
