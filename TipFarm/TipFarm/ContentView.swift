//
//  ContentView.swift
//  TipFarm
//
//  Created by David Perez on 9/16/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var contentVM = ContentViewModel()
    @State var trimLoginCount = 0
    @State var appearCircle = true
    @State var isQuizTapped = false
    var body: some View {
        NavigationStack{
            ZStack{
                VStack{
                    HStack{
                        Text("FACTFARM")
                        Spacer()
                        Text("\(contentVM.getStreakCount())")
                        Image(systemName: "flame")
                    }
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(content: {
                        Color.red
                            .ignoresSafeArea()
                    })
                    .shadow(radius: 10)
                    .font(.headline)
                    VStack{
                        if appearCircle {
                            HStack{
                                Circle()
                                    .stroke(lineWidth: 30)
                                    .foregroundColor(Color.red)
                                    .opacity(0.2)
                                    .overlay(content: {
                                        Circle()
                                            .trim(from: 0, to: CGFloat(trimLoginCount)/7)
                                            .stroke(
                                                Color.pink,
                                                lineWidth: 30
                                            )
                                        if trimLoginCount % 7 != 0 || trimLoginCount == 0{
                                            Text("\(contentVM.getStreakCount()) 🔥")
                                                .font(.largeTitle)
                                        } else {
                                            Button(action: {
                                                isQuizTapped = true
                                            }, label: {
                                                Text("Display Quiz")
                                            })
                                        }
                                    })
                                    .padding()
                            }
                            .padding(.horizontal, 75)
                            .onAppear{
                                self.trimLoginCount = contentVM.checkLoginActivity(currentTime: Date())
                            }
                        }
                        Button(action: {
                            appearCircle.toggle()
                        }, label: {
                            Text("remove cirlce")
                        })
                        VStack{
                            HStack{
                                Text("Tip of the day")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                Spacer()
                            }
                            .padding()
                            Text("\(contentVM.currentTip)")
                                .padding()
                        }
                        .background(content: {
                            Color.white
                        })
                        .cornerRadius(20)
                        .shadow(radius: 10)
                    }
                    .padding(.horizontal)
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationDestination(isPresented: $isQuizTapped, destination: {
                QuizView()
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
