//
//  ContentView.swift
//  TipFarm
//
//  Created by David Perez on 9/16/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var contentVM = ContentViewModels()
    @State var trimLoginCount = 0
    @State var appearCircle = true
    @State var isQuizTapped = false
    @State var isCarTapped = false
    var body: some View {
        NavigationStack{
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
                            VStack{
                                HStack{
                                    VStack{
                                        HStack{
                                            Text("Welcome")
                                                .font(.largeTitle)
                                                .fontWeight(.bold)
                                            Spacer()
                                        }
                                        HStack{
                                            Text("David")
                                            Spacer()
                                        }
                                    }
                                    Circle()
                                        .stroke(lineWidth: 10)
                                        .foregroundColor(Color.red)
                                        .opacity(0.2)
                                        .overlay(content: {
                                            Circle()
                                                .trim(from: 0, to: CGFloat(trimLoginCount)/7)
                                                .stroke(
                                                    Color.pink,
                                                    lineWidth: 10
                                                )
                                            if trimLoginCount % 7 != 0 || trimLoginCount == 0{
                                                Text("\(trimLoginCount) 🔥")
                                                    .font(.title)
                                            } else {
                                                Button(action: {
                                                    UserDefaults.standard.set(0, forKey: "myDataKey")
                                                    isQuizTapped = true
                                                }, label: {
                                                    Text("Display Quiz")
                                                })
                                            }
                                        })
                                        .frame(width: 90)
                                }
                                HStack{
                                    VStack{
                                        Button(action: {
                                            
                                        }, label: {
                                            Image(systemName: "person")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .foregroundColor(.black)
                                            
                                        })
                                        .padding()
                                        .background(content: {
                                            Color.red
                                                .opacity(0.5)
                                        })
                                        .cornerRadius(30)
                                        .padding(.horizontal)
                                        Text("Account")
                                    }
                                    VStack{
                                        Button(action: {
                                            
                                        }, label: {
                                            Image(systemName: "hammer")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .foregroundColor(.black)
                                        })
                                        .padding()
                                        .background(content: {
                                            Color.red
                                                .opacity(0.5)
                                        })
                                        .cornerRadius(30)
                                        .padding(.horizontal)
                                        Text("Service")
                                    }
                                    VStack{
                                        Button(action: {
                                            
                                        }, label: {
                                            Image(systemName: "checkmark")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .foregroundColor(.black)
                                        })
                                        .padding()
                                        .background(content: {
                                            Color.red
                                                .opacity(0.5)
                                        })
                                        .cornerRadius(30)
                                        .padding(.horizontal)
                                        Text("Claim")
                                    }
                                    VStack{
                                        Button(action: {
                                            
                                        }, label: {
                                            Image(systemName: "phone")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .foregroundColor(.black)
                                        })
                                        .padding()
                                        .background(content: {
                                            Color.red
                                                .opacity(0.5)
                                        })
                                        .cornerRadius(30)
                                        .padding(.horizontal)
                                        Text("Support")
                                    }
                                }
                                .padding(.top, 25)
                                .onAppear{
                                    self.trimLoginCount = contentVM.checkLoginActivity(currentTime: Date())
                                    contentVM.provideTipsAndQuestionsForCurrentWeek()
                                    contentVM.updateTip()
                                }
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
                                    VStack{
                                        let earnedPoints = CGFloat(contentVM.earnedPoints)  // Ensure contentVM.earnedPoints is a valid value
                                        let width = (earnedPoints / 300) * 350
                                        HStack{
                                            Text("Tips Points Goal")
                                                .font(.title2)
                                                .fontWeight(.bold)
                                            Spacer()
                                            Text("\(contentVM.earnedPoints)/300")
                                        }
                                        .padding()
                                        Rectangle()
                                            .cornerRadius(20)
                                            .frame(width: 350, height: 20)
                                            .padding()
                                            .overlay(content: {
                                                HStack{
                                                    Rectangle()
                                                        .cornerRadius(20)
                                                        .frame(width: 100, height: 20, alignment: .leading)
                                                        .padding(.vertical)
                                                        .foregroundColor(.red)
                                                }
                                                .frame(width: 350, height: 20, alignment: .leading)
                                            })
                                    }
                                }
                                .background(content: {
                                    Color.white
                                })
                                .cornerRadius(20)
                                .shadow(radius: 10)
                                Image("Car")
                                    .resizable()
                                    .frame(height: 180)
                                    .overlay(content: {
                                        VStack(content: {
                                            HStack{
                                                Text("Chevy Cruze")
                                                    .font(.title2)
                                                    .fontWeight(.bold)
                                                Text("2015")
                                                    .font(.subheadline)
                                            }
                                            
                                        })
                                        .frame(maxWidth: .infinity, maxHeight: 200, alignment: .topLeading)
                                        .padding(5)
                                    })
                                    .onTapGesture {
                                        isCarTapped = true
                                    }
                                ScrollView(.horizontal){
                                    HStack{
                                        VStack{
                                            HStack{
                                                Text("Driving Habits")
                                                    .font(.title2)
                                                Spacer()
                                                    .frame(maxWidth: .infinity)
                                            }
                                            
                                            HStack(spacing: 15){
                                                VStack{
                                                    Circle()
                                                        .stroke(lineWidth: 10)
                                                        .foregroundColor(Color.red)
                                                        .opacity(0.2)
                                                        .overlay(content: {
                                                            Circle()
                                                                .trim(from: 0, to: 2/7)
                                                                .stroke(
                                                                    Color.pink,
                                                                    lineWidth: 10
                                                                )
                                                            
                                                        })
                                                        .frame(width: 90)
                                                    Text("Speed")
                                                }
                                                VStack{
                                                    Circle()
                                                        .stroke(lineWidth: 10)
                                                        .foregroundColor(Color.red)
                                                        .opacity(0.2)
                                                        .overlay(content: {
                                                            Circle()
                                                                .trim(from: 0, to: 3/7)
                                                                .stroke(
                                                                    Color.pink,
                                                                    lineWidth: 10
                                                                )
                                                            
                                                        })
                                                        .frame(width: 90)
                                                    Text("Braking")
                                                }
                                                VStack{
                                                    Circle()
                                                        .stroke(lineWidth: 10)
                                                        .foregroundColor(Color.red)
                                                        .opacity(0.2)
                                                        .overlay(content: {
                                                            Circle()
                                                                .trim(from: 0, to: 5/7)
                                                                .stroke(
                                                                    Color.pink,
                                                                    lineWidth: 10
                                                                )
                                                            
                                                        })
                                                        .frame(width: 90)
                                                    Text("Turning")
                                                }
                                                
                                            }
                                            
                                        }
                                        Spacer()
                                            .frame(width: 50)
                                        VStack{
                                            Text("Driving Tips")
                                            Text("Drive slower on turns because it")
                                            Text("causes you to brake harder. It also")
                                            Text("makes you at risk of getting into an accident.")
                                        }
                                        
                                    }
                                }
                                
                            }
                            .padding(.horizontal)
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(content: {
                })
                .navigationDestination(isPresented: $isQuizTapped, destination: {
                    QuizEnds(contentVM: contentVM)
                })
                .navigationDestination(isPresented: $isCarTapped, destination: {
                    CarView()
                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
