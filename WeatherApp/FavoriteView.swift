//
//  FavoriteView.swift
//  WeatherApp
//
//  Created by Emine CETINKAYA on 4.05.2024.
//

import SwiftUI

struct FavoriteView: View {
    
    @State private var searchText = ""
    
    var body: some View {
        
        NavigationView{
            ZStack{
                Image("sky")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Text("Weather")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .font(.system(size: 30))
                        .bold()
                        .padding(.top, 50)
                
                    SearchBar(text: $searchText)
                        .padding(.horizontal, 20)
                        .padding(.top, 20)
                    
                   Text("")
                        .frame(width: 300, height: 90)
                    .padding()
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(10)
                    .padding(40)
                    
                    Spacer()
                    
                }
             
            }
        }
     
    }
}

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField("Search...", text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 10)
                .overlay(
                                   HStack {
                                       Image(systemName: "magnifyingglass")
                                           .foregroundColor(.gray)
                                           .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                           .padding(.leading, 15)
                                       
                                       if !text.isEmpty {
                                           Button(action: {
                                               self.text = ""
                                           }) {
                                               Image(systemName: "multiply.circle.fill")
                                                   .foregroundColor(.gray)
                                                   .padding(.trailing, 15)
                                           }
                                       }
                                   }
                               )
          
        }
    }
}
#Preview {
    FavoriteView()
}
