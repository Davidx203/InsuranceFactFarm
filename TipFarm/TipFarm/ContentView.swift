//
//  ContentView.swift
//  TipFarm
//
//  Created by David Perez on 9/16/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Text("FACTFARM")
                    Spacer()
                    Text("89")
                    Image(systemName: "flame")
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(content: {
                    Color.red
                        .ignoresSafeArea()
                })
                .shadow(radius: 10)
                
                HStack{
                    Rectangle()
                        .frame(height: 20)
                        .cornerRadius(20)
                        .overlay(content: {
                            Rectangle()
                                .foregroundColor(.green)
                                .cornerRadius(20)
                                .padding(.trailing)
                            
                        })
                    Text("0/7")
                }
                .padding(.horizontal)
                 
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
