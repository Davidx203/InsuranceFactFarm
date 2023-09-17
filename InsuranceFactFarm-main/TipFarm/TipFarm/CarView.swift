//
//  ClaimView.swift
//  TipFarm
//
//  Created by David Perez on 9/17/23.
//

import SwiftUI

struct CarView: View {
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Spacer()
                    Text("Factfarm")
                        .italic()
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(content: {
                    Color.red
                        .ignoresSafeArea()
                })
                .shadow(radius: 10)
                .font(.headline)
                ScrollView{
                    HStack{
                        Text("Selecting Car")
                            .font(.title)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    VStack{
                        HStack{
                            Text("Tips:")
                            Spacer()
                        }
                        Text("When selecting a car, you should look for cars that are highly rated for crash safety. Based on your driving habits cars that are slower are likely to help you lower your insurance")
                    }
                    .padding()
                    .background(content: {
                        Color.white
                    })
                    .cornerRadius(20)
                    .shadow(radius: 20)
                    VStack{
                        HStack{
                            Text("Honda")
                            Spacer()
                        }
                        HStack{
                            Image("Carone")
                            
                        }
                        Text("Car Coverage Price: $193")
                    }
                    .padding()
                    .background(content: {
                        Color.white
                    })
                    .cornerRadius(20)
                    .shadow(radius: 20)
                    VStack{
                        HStack{
                            Text("Corvette")
                            Spacer()
                        }
                        HStack{
                            Image("Cartwo")
                            
                        }
                        Text("Car Coverage Price: $353")
                    }
                    .padding()
                    .background(content: {
                        Color.white
                    })
                    .cornerRadius(20)
                    .shadow(radius: 20)
                    VStack{
                        HStack{
                            Text("Acura")
                            Spacer()
                        }
                        HStack{
                            Image("Carthree")
                            
                        }
                        Text("Car Coverage Price: $237")
                    }
                    .padding()
                    .background(content: {
                        Color.white
                    })
                    .cornerRadius(20)
                    .shadow(radius: 20)
                    
                }
                .padding()
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
    }
}

struct CarView_Previews: PreviewProvider {
    static var previews: some View {
        CarView()
    }
}
