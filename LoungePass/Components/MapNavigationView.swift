//
//  NavigationView.swift
//  LoungePass
//
//  Created by Rain Poon on 18/11/2023.
//

//
//  ContentView.swift
//  Directions
//

import MapKit
import SwiftUI
import UIKit

struct MapNavigationView: View {
    
    @State private var directions: [String] = []
    @State private var showDirections = false
    @State private var currentLocation = CLLocationCoordinate2D(latitude: 22.3159, longitude: 113.9366)
    
    @State private var destination = CLLocationCoordinate2D(latitude: 22.3142, longitude: 113.9246)
    
    var body: some View {
        ZStack {
            MapView(directions: $directions, currentLocation: $currentLocation, destination: $destination)
                .edgesIgnoringSafeArea(.all)
            
            Button(action: {
                self.showDirections.toggle()
            }, label: {
                Text("Show Directions")
                    .padding()
                    .background (
                        Color.white
                            .cornerRadius(30)
                    )
            })
            .disabled(directions.isEmpty)
            .padding()
            .offset(y: UIScreen.main.bounds.height*0.35)
        }.sheet(isPresented: $showDirections, content: {
            VStack(spacing: 0) {
                Text("Directions")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                Divider().background(Color(UIColor.systemBlue))
                
                List(0..<self.directions.count, id: \.self) { i in
                    Text(self.directions[i]).padding()
                }
            }
        })
    }
}

struct MapView: UIViewRepresentable {
    
    typealias UIViewType = MKMapView
    
    @Binding var directions: [String]
    @Binding var currentLocation: CLLocationCoordinate2D
    @Binding var destination: CLLocationCoordinate2D
    
    func makeCoordinator() -> MapViewCoordinator {
        return MapViewCoordinator()
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        
        // Cathay City
        let p1 = MKPlacemark(coordinate: currentLocation)
        
        // Hong Kong International Airport (HKIA)
        let p2 = MKPlacemark(coordinate: destination)
        
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: p1)
        request.destination = MKMapItem(placemark: p2)
        request.transportType = .walking
        
        let directions = MKDirections(request: request)
        directions.calculate { response, error in
            guard let route = response?.routes.first else { return }
            mapView.addAnnotations([p1, p2])
            mapView.addOverlay(route.polyline)
            mapView.setVisibleMapRect(
                route.polyline.boundingMapRect,
                edgePadding: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20),
                animated: true)
            self.directions = route.steps.map { $0.instructions }.filter { !$0.isEmpty }
        }
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
    }
    
    class MapViewCoordinator: NSObject, MKMapViewDelegate {
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let renderer = MKPolylineRenderer(overlay: overlay)
            renderer.strokeColor = .systemBlue
            renderer.lineWidth = 5
            return renderer
        }
    }
}

struct MapNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        MapNavigationView()
    }
}
