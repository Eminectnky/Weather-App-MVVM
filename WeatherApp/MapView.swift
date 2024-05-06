//
//  MapView.swift
//  WeatherApp
//
//  Created by Emine CETINKAYA on 4.05.2024.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack{
            
            Map(coordinateRegion: .constant(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))))
            
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                HStack{
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }){
                        Image(systemName: "xmark")
                            .foregroundColor(.gray)
                            .font(.system(size: 50))
                            .font(.title)
                            .bold()
                            .padding()
                    }
                    Spacer()
                }
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}


#Preview {
    MapView()
}
