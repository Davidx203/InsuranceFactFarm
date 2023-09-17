//
//  QuizView.swift
//  TipFarm
//
//  Created by David's Guest on 9/16/23.
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
        Question(text: "2+2", answers: ["2", "3", "4", "1"] , correctAnswerIndex: 2),
        Question(text: "2+2", answers: ["2", "3", "4", "1"] , correctAnswerIndex: 2),
        Question(text: "2+2", answers: ["2", "3", "4", "1"] , correctAnswerIndex: 2)
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
                    /*
                    Text(currentQuestion[<#Dictionary<Int, (tip: String, questions: [String], choices: [String], correctChoice: String)>.Index#>])
                        .font(.largeTitle)
                        .font(.system(size: 18, weight: .bold))
                        .padding()
                    
                    */
                    
                    
                    ForEach(0..<currentQuestion.answers.count, id: \.self) { index in
                        Button(action: {
                            //checkAnswer(index)
                            
                        }){
                        Text(currentQuestion.answers[index])
                            .font(.title)
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        
                      
                        
                    }
                    .onAppear{
                        //contentVM.provideTipsAndQuestionsForCurrentWeek()
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
                
            }
            
        }
     
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
    }
    /*
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
     */
    struct QuizEnds_Previews: PreviewProvider {
        static var previews: some View {
            QuizEnds(contentVM: ContentViewModels())
        }
    }
}
