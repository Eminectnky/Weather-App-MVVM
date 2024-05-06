//
//  FavoritesView.swift
//  WeatherApp
//
//  Created by Emine CETINKAYA on 4.05.2024.
//

import CoreLocation
import SwiftUI

struct FavoritesView: View {
    @ObservedObject var viewModel: WeatherViewModel
    
    var body: some View {
        NavigationStack {
            ZStack{
                Image("sky")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Text("Favorites")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .font(.system(size: 30))
                        .bold()
                        .padding(20)
                    
                        
                    Spacer()
                }
            }
        }
        
    }
}


#if DEBUG
struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView(viewModel: WeatherViewModel(weatherService: WeatherService()))
    }
}
#endif
