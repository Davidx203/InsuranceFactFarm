import Foundation
class main: ObservableObject {
    @Published var currentTip: String = ""
    @Published var currentDay: Int = 1
  
  var tipAndQuestionDictionary: [Int: (tip: String, questions: [String])]     = [:] // Dictionary to store tips and questions for each day

  // List of tips
  let tips = [
    "Tip 1: Always stay hydrated.",
    "Tip 2: Get enough sleep for better focus.",
    "Tip 3: Eat a balanced diet.",
    // Add more tips as needed
  ]

  let randomQuestions = ["Question 1", "Question 2", "Question 3"]

  // Populate tipAndQuestionDictionary with random tips and questions,           distributing them across days
  func provideTipsAndQuestionsForCurrentWeek(){
    for day in 1...7 {
        let randomTipIndex = Int.random(in: 0..<tips.count)
        let randomTip = tips[randomTipIndex]
    
      // Add random questions for the day (you can customize this)
        let randomQuestion = randomQuestions[randomTipIndex]
    
        tipAndQuestionDictionary[day] = (tip: randomTip, questions:         
        [randomQuestion])
    }
  }
    
  init() {
        updateTip()
        
        // Create a timer to advance to the next day every 24 hours
        Timer.scheduledTimer(withTimeInterval: 24 * 60 * 60, repeats: true)         { _ in
            self.nextDay()
        }
    }
    
    func nextDay() {
        currentDay += 1
        updateTip()
    }
    
    private func updateTip() {
        if let (tip, _) = tipAndQuestionDictionary[currentDay] {
            currentTip = "Day \(currentDay) Tip: \(tip)"
        } else {
            currentTip = "No tip found for Day \(currentDay)."
        }
      // Check if it's the end of the week (e.g., every 7 days)
        if currentDay % 7 == 0 {
            print("End of the week - Quiz Time!")
            // Call a function to conduct the quiz with questions from the                 past week
            conductQuizForPastWeek()
        }
    }
    // Function to conduct a quiz with questions from the past week
    func conductQuizForPastWeek() {
        let weekStartDay = currentDay - 6
        var quizQuestions: [String] = []
    
        // Collect questions from the past week's tips
        for day in weekStartDay...currentDay {
            if let (_, questions) = tipAndQuestionDictionary[day] {
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
    for _ in 1...4 { // Run for 4 weeks as an example
      provideTipsAndQuestionsForCurrentWeek()
      sleep(7 * 24 * 60 * 60) // Sleep for a week (adjust as needed)
    }
}
