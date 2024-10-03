//
//  ContentView.swift
//  iMap
//
//  Created by ksd on 25/09/2024.
//

/*
 Opgaven består af følgende punkter:
 1.     Ændre markers så det er et array af en egen datastruktur.
 Denne datastruktur skal indeholde:
 a. id, navn, coordinates (CLLocationCoordinate2D)
 b. være Identifyable
 2.     Når der klikkes på kortet (.onTabGesture) skal et sheet vises i
 halv størrelse (.small)
 3.     Sheetet viser et view, hvor du indtaster et navn på det coordinate
 du har klikket på. Viewet skal altså have det klikkede koordinat
 med som argument!! :)
 4.     Når du er færdig med at taste navn ind, lukkes sheetet og der oprettes
 en instans af den datastruktur du lavede under pkt. 1
 Herefter tilføjes denne til markers i din Controller
 5.     Alle markers vises på kortet med Navnet fra datastrukturen
 (6.)   Tilføj GPS (fra sidste opgave) til appen og gør det muligt
 at lave en navigation (blå streg) fra din lokation til det sted
 på kortet du klikkede på
 */

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var cameraPosition: MapCameraPosition = .camera(
        MapCamera(
            centerCoordinate: .Copenhagen,
            distance: 12000, //3729,
            heading: 100,
            pitch: 30
        )
    )
    
    @State private var showAddMarkerSheet = false
    
    @Environment(MarkerController.self) var viewModel: MarkerController
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        MapReader { mapProxy in
            Map(position: $cameraPosition, interactionModes: [.all]){
                ForEach(viewModel.markers, id: \.latitude){ marker in
                    Marker("Et sted", coordinate: marker)
                        .tint(.blue)
                }
            }
            .onTapGesture { screenCoordinate in
                showAddMarkerSheet = true
                if let newMarkerCoordinates = mapProxy.convert(screenCoordinate, from: .local){
                    viewModel.addMarker(newMarkerCoordinates)
                }
            }
        }
        .mapStyle(.imagery(elevation: .realistic))
        .sheet(isPresented: $showAddMarkerSheet) {
            VStack{
                /// Her laves et view til opgaven
                Text("Hej")
                    .presentationDetents([.medium])
                Button("Close") {
                    showAddMarkerSheet = false
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    ContentView().environment(MarkerController())
}



extension MKCoordinateRegion {
    static var erhvervsakademiAarhus: MKCoordinateRegion {
        .init(center: .erhvervsakademiAarhus,
              latitudinalMeters: 500,
              longitudinalMeters: 500)
    }
    static var mcDonaldsViby: MKCoordinateRegion {
        .init(center: .mcDonaldsViby,
              latitudinalMeters: 500,
              longitudinalMeters: 500)
    }
}

