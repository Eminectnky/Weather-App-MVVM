//
//  ContentView.swift
//  WeatherApp
//
//  Created by Emine CETINKAYA on 3.05.2024.
//

import SwiftUI
import MapKit

struct WeatherView: View {
    
    
    @State private var showMap = false
    @ObservedObject var viewModel: WeatherViewModel
    
    var body: some View {
        
        NavigationView{
            ZStack{
                Image("sky")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    Text(viewModel.cityName)
                        .font(.largeTitle)
                        .padding()
                    Text(viewModel.temperature)
                        .font(.system(size: 75))
                        .bold()
                    Text(viewModel.weatherIcon)
                        .font(.largeTitle)
                        .padding()
                    Text(viewModel.weatherDescription)
                        .font(.system(size: 25))
                    
                    Spacer()
                    NavigationLink(destination: MapView()) {
                                         Text("Show On Map")
                                             .font(.headline)
                                             .foregroundColor(.white)
                                             .padding()
                                             .background(Color.blue)
                                             .cornerRadius(10)
                                     }                    .padding()
                    
                                   }
                .foregroundColor(.white)
                .onAppear(perform: viewModel.refresh)
            }
            
            
            
            
            .navigationBarItems(trailing:
                                    NavigationLink(destination: FavoriteView()){
                Image(systemName: "plus")
                    .font(.title)
                    .foregroundColor(.white)
            }
                .padding()
            )
        }
    }
}

#if DEBUG
struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(viewModel: WeatherViewModel(weatherService: WeatherService()))
    }
}
#endif
