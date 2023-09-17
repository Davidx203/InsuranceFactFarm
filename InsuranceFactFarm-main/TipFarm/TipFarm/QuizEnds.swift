//
//  QuizEnds.swift
//  TipFarm
//
//  Created by David Perez on 9/16/23.
//


import SwiftUI

struct Question {
    let text: String
    let answers: [String]
    let correctAnswerIndex: Int
}

struct QuizEnds: View {
    @State private var score = 0
    @State private var questionNumber = 0
    @State private var pointsPerQuestion = 50
    @State private var isQuizActive = true
    @ObservedObject var contentVM: ContentViewModels
    
    let questions: [Question] = [
        Question(text: "What is a deductable?", answers: ["The amount you pay monthly.",
                                                          "What you pay when an accident occurs, before your policy covers the loss.",
                                                          "An optional coverage on your policy.",
                                                          "The amount your insurance owes you from a filed claim."] , correctAnswerIndex: 1),
        Question(text: "What is a claim?", answers: ["The amount that the insured owes the insurance company.",
                                        "A type of policy that offers better coverage than standard policies.",
                                        "A one time fee that must be paid when a policy is made.",
                                        "What the insurance company owes the insured when a claim is filed."] , correctAnswerIndex: 0),
        Question(text: "What is 'Bodily Injury' coverage?", answers:["The rights that the insured has according to the contract that they made with their insurance company.",
                                                                     "The way an insurance company determines what you pay for insurance.",
                                                                     "An official request from the insured to the insurance company for money for a covered loss.",
                                                                     "The rights that insurace companies have in the agreement made with the insured."] , correctAnswerIndex: 2)
    ]
    var currentQuestion: Question {
        questions[questionNumber]
    }
    
    var body: some View {
        VStack {
            
            if isQuizActive == true{
                Text("Question \(questionNumber + 1)")
                    .font(.system(size: 18, weight: .bold))
                Spacer()
                    .frame(height: 100)
                VStack{
                    Text(currentQuestion.text)
                        .font(.largeTitle)
                        .font(.system(size: 18, weight: .bold))
                        .padding()
                    
                    
                    
                    
                    ForEach(0..<currentQuestion.answers.count, id: \.self) { index in Button(action: {checkAnswer(index)}){
                        Text(currentQuestion.answers[index])
                            .font(.title)
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        
                      
                        
                    }
                        
                    }
                    Text("Current Score: \(score)")
                        .padding(100)
                }
                Spacer()
            } else{
                Text("Quiz Finished")
                    .font(.system(size: 35, weight: .bold))
                    .foregroundColor(.red)
                
                Text("Final Score: \(score)/\(questions.count)")
                    .font(.system(size: 25, weight: .bold))
                    .padding()
                
                Text("CONGRATULATIONS, YOU EARNED") + Text(" \(score*pointsPerQuestion)").bold() +
                Text(" POINTS")
                    
                ShareLink(item: "I just completed my factfarm quiz! Scored \(score*pointsPerQuestion) out of 150") {
                    Label("Share", image: "MyCustomShareIcon")
                }.onAppear{
                    contentVM.setNewPoints(points: score*pointsPerQuestion)
                }
                
            }
            
        }
        .padding(.horizontal)
     
        /*
        .onAppear {
            // Add observer for app entering the background
            NotificationCenter.default.addObserver(
                forName: UIApplication.willResignActiveNotification,
                object: nil,
                queue: .main
            ) { _ in
                // App is entering the background, reset the score and question number
                score = 0
                questionNumber = 0
            }
        }
        .onDisappear {
            // Remove observer when the view disappears
            NotificationCenter.default.removeObserver(self)
        }
         */
    }
    func checkAnswer(_ selectedAnswerIndex: Int) {
        if selectedAnswerIndex == currentQuestion.correctAnswerIndex {
            score += 1
            
        }
        
        if questionNumber < questions.count - 1 {
            questionNumber += 1
        } else {
            isQuizActive = false
          
        }
    }
    struct QuizEnds_Previews: PreviewProvider {
        static var previews: some View {
            QuizEnds(contentVM: ContentViewModels())
        }
    }
}
