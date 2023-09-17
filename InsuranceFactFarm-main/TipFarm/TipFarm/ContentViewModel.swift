//
//  ContentViewModel.swift
//  TipFarm
//
//  Created by David Perez on 9/16/23.
//

import Foundation
import WidgetKit

class ContentViewModels: ObservableObject {
    @Published private var streakCount = 0
    @Published private var loginCount = 0
    @Published private var previousLoginTime: Date? = nil
    @Published private var displayQuiz = false
    @Published var currentTip: String = ""
    @Published var currentDay: Int = 1
    @Published var earnedPoints = 0
    
    public func getStreakCount() -> Int {
        return streakCount
    }
    
    public func getLoginCount() -> Int {
        return loginCount
    }
    
    public func getDisplayQuiz() -> Bool {
        return displayQuiz
    }
    
    public func setNewPoints(points: Int) {
        earnedPoints += points
    }
    
    public func checkLoginActivity(currentTime: Date) -> Int {
        let previousLoginTime = UserDefaults.standard.object(forKey: "myDataKey2") as? Date
        loginCount = UserDefaults.standard.object(forKey: "myDataKey") as? Int ?? 0
        if let previousLoginTime = previousLoginTime {
            print("previous \(previousLoginTime)")
            print("current \(currentTime)")
            if currentTime > previousLoginTime{
                loginCount += 1
                UserDefaults.standard.set(loginCount, forKey: "myDataKey")
                if let sharedDefaults = UserDefaults(suiteName: "your.app.group.identifier") {
                    sharedDefaults.set( loginCount, forKey: "mySharedValue")
                    sharedDefaults.synchronize()
                }
                self.previousLoginTime = currentTime
                UserDefaults.standard.set(self.previousLoginTime, forKey: "myDataKey2")
                //UserDefaults.standard.synchronize()
            }
        } else {
            self.previousLoginTime = currentTime
            UserDefaults.standard.set(self.previousLoginTime, forKey: "myDataKey2")
        }
        print("test \(UserDefaults.standard.object(forKey: "myDataKey") as? Int ?? 0)")
        //var loginCount = UserDefaults.standard.integer(forKey: "myDataKey")
        let widgetController = WidgetCenter.shared
        widgetController.reloadTimelines(ofKind: "YourWidgetKind")
        
        return loginCount
    }
    
    var tipAndQuestionDictionary: [Int: (tip: String, questions: [String], choices: [String], correctChoice: String)]     = [:] // Dictionary to store tips and questions for each day
    
    // List of tips
    let tips = [
        "The deductible is what you pay when an accident occurs, before your policy covers the loss.",
        
        "The premium is the amount that the insured owes the insurance company.",
        
        "A claim is an official request from the insured to the insurance company for money for a covered loss.",
        
        "Bodily Injury covers you in the event that you cause an accident that physically harms the indivudual who is not at fault.",
        
        "Property Damage and Personal Injury Protection are required coverages in Florida.",
        
        "Property Damage covers the property of a third party in the case of an at-fault accident by the insured",
        
        "Personal Injury Protection covers bodily harm for the insured even while acting as a passenger, it's required by all drivers in Florida, and it covers regardless of fault."
        // Add more tips as needed
    ]
    
    let randomQuestions = ["What is a deductable?", "What is premium?", "What is a claim?", "What is 'Bodily Injury' coverage?", "Which of the following is a required coverage for all drivers in Florida?", "What is 'Property Damage' coverage?", "What is true about Personal Injury Protection?"]
    
    let answerChoices = [["The amount you pay monthly.",
                          "What you pay when an accident occurs, before your policy covers the loss.",
                          "An optional coverage on your policy.",
                          "The amount your insurance owes you from a filed claim."],
                         ["The amount that the insured owes the insurance company.",
                          "A type of policy that offers better coverage than standard policies.",
                          "A one time fee that must be paid when a policy is made.",
                          "What the insurance company owes the insured when a claim is filed."],
                         ["The rights that the insured has according to the contract that they made with their insurance company.",
                          "The way an insurance company determines what you pay for insurance.",
                          "An official request from the insured to the insurance company for money for a covered loss.",
                          "The rights that insurace companies have in the agreement made with the insured."],
                         ["This covers you in the event that you cause an accident that physically harms the indivudual who is not at fault.",
                          "This covers your vehicle in the event that it gets damaged.",
                          "This covers the third party's vehicle in the event that you are at fault for a car accident.",
                          "This covers any bodily harm that the insured suffers."],
                         ["Personal Injury Protection",
                          "Bodily Injury Protection",
                          "Comprehensive Coverage",
                          "Collision Coverage"],
                         ["This covers damage to the insured's vehicle when the insured is not at-fault.",
                          "This covers damage to any property that is not a vehicle.",
                          "This covers the insured's property, excluding the vehicle.",
                          "This covers the property of a third party in the case of an at-fault accident by the insured."],
                         ["This covers bodily harm for the insured even while acting as a passenger.",
                          "This coverage is required by all drivers in Florida.",
                          "This covers bodily harm that the insured suffers regardless of fault.",
                          "All of the above."]]
    
    let correctChoice = ["What you pay when an accident occurs, before your policy covers the loss.",
                         "The amount that the insured owes the insurance company.", "An official request from the insured to the insurance company for money for a covered loss.",
                         "This covers you in the event that you cause an accident that physically harms the indivudual who is not at fault.", "Personal Injury Protection",
                         "This covers the property of a third party in the case of an at-fault accident by the insured.", "All of the above."]
    
    func provideTip() {
        //for day in 1...7 {
        let randomTipIndex = Int.random(in: 0..<tips.count)
        let randomTip = tips[randomTipIndex]
        
        currentTip = randomTip
        //}
    }
    
    // Populate tipAndQuestionDictionary with random tips and questions, distributing them across days
    public func provideTipsAndQuestionsForCurrentWeek(){
        for day in 1...7 {
            let randomTipIndex = Int.random(in: 0..<tips.count)
            let randomTip = tips[randomTipIndex]
            
            // Add random questions for the day (you can customize this)
            let randomQuestion = randomQuestions[randomTipIndex]
            let questionChoice1 = answerChoices[randomTipIndex][0]
            let questionChoice2 = answerChoices[randomTipIndex][1]
            let questionChoice3 = answerChoices[randomTipIndex][2]
            let questionChoice4 = answerChoices[randomTipIndex][3]
            let correctAnswer = correctChoice[randomTipIndex]
            
            tipAndQuestionDictionary[day] = (tip: randomTip, questions:
                                                [randomQuestion], choices: [questionChoice1, questionChoice2, questionChoice3, questionChoice4], correctChoice: correctAnswer)
        }
    }
    
    func randomizedQuestionsForQuiz(){
        
    }
    
    func isAnswerCorrect(forDay day: Int, userChoice: String) -> Bool {
        if let (_, _, choices, correctChoice) = tipAndQuestionDictionary[day] {
            // Check if the user's choice matches the correct choice
            return choices.contains(userChoice) && userChoice == correctChoice
        }
        return false
    }
    
    init() {
        updateTip()
        
        // Create a timer to advance to the next day every 24 hours
        //Timer.scheduledTimer(withTimeInterval: 24 * 60 * 60, repeats: true)         { _ in
        self.nextDay()
        //}
    }
    
    func nextDay() {
        currentDay += 1
        updateTip()
    }
    
    func updateTip(){
        if let (tip, _, _, _) = tipAndQuestionDictionary[currentDay] {
            currentTip = "Day \(loginCount) Tip: \(tip)"
        } else {
            currentTip = "No tip found for Day \(currentDay)."
        }
    }
    // Function to conduct a quiz with questions from the past week
    func conductQuizForPastWeek() {
        let weekStartDay = currentDay - 6
        var quizQuestions: [String] = []
        
        // Collect questions from the past week's tips
        for day in weekStartDay...currentDay {
            if let (_, questions, _, _) = tipAndQuestionDictionary[day] {
                quizQuestions += questions
            }
        }
        
        // Randomize quiz questions (you can implement your own shuffling logic)
        let shuffledQuizQuestions = quizQuestions.shuffled()
        
        // Present the quiz questions to the user and gather their responses
        for (index, question) in shuffledQuizQuestions.enumerated() {
            print("Question \(index + 1): \(question)")
            // Collect the user's response and evaluate it
            // You can implement a scoring system and feedback here
        }
    }
}
