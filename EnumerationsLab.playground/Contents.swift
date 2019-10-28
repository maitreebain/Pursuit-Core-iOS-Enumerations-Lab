import UIKit

// Question One

// a. Define an enumeration called iOSDeviceType with member values iPhone, iPad, iWatch. Create a variable called myiPad and assign it to .iPad.

// Your code here

enum iOSDeviceType {
    case iPhone
    case iPad
    case iWatch
}

// Uncomment the lines below to test your solution

let myiPad = iOSDeviceType.iPad
assert(myiPad == .iPad)

// b. Adjust your code above so that iPhone and iPad have associated values of type String which represents the model number.  Create an instance of a .iPhone("8+") and assign it to a variable called myPhone

// Your code here

enum modelNum {
    case iPhone(model: String)
    case iPad
}
let myPhone = modelNum.iPhone(model: "8+")

    func modelNumber(myPhone: modelNum){
        switch myPhone{
        case .iPhone(let model):
            print(model)
        case .iPad:
            print(" I don't have your iPad's model number")
    }
}

// Uncomment the lines below to test your solution

switch myPhone {
case let .iPhone(model): assert(model == "8+", "Was expecting a model type of 8+, but got \(model)")
default: fatalError("Was expecting an iPhone but got \(myPhone)")
}

// Question Two

// Write a function named getPosition(startingAt:afterSteps:) that takes an array of Steps, and a starting location of (Int, Int) and returns an (Int, Int) tuple representing the final position.

//A step .up will increase the y coordinate by 1.
//A step .down will decrease the y coordinate by 1.
//A step .right will increase the x coordinate by 1.
//A step .left will decrease the x coordinate by 1.


enum Step {
    case up(Int)
    case down(Int)
    case left(Int)
    case right(Int)
}

// Your function here

let startingLocation = (x: 0, y: 0)
//let steps: [Step] = [.up, .up, .left, .down, .left]

//ATTEMPT:
//func getPosition(startingAt x: [Int], afterSteps y: (Int, Int)) -> (Int, Int) {
//    var xCounter = 0
//    var yCounter = 0
//    for step in Step {
//        switch self{
//        case Step.up:
//            yCounter += 1
//        case Step.down:
//            yCounter -= 1
//        case Step.left:
//            xCounter -= 1
//        case Step.right:
//            xCounter += 1
//
//    }
//    }
//}
// Uncomment the lines below to test your solution

//let startingLocation = (x: 0, y: 0)
//let steps: [Step] = [.up, .up, .left, .down, .left]
//let expectedEndPosition = (x: -2, y: 1)
//let endPosition = getPosition(startingAt: startingLocation, afterSteps: steps)
//
//assert(endPosition == expectedEndPosition, "Was expecting \(expectedEndPosition) but got \(endPosition)")

// Question Three

// You are given a Coin enumeration which describes different coin values. Write a function called getTotalValue(from:) that takes in an array of tuples of type (number: Int, coin: Coin), and returns the total value of all coins in cents.

enum Coin: Int {
    case penny = 1
    case nickle = 5
    case dime = 10
    case quarter = 25
}

// Your function here

func getTotalValue (from: [(Int ,Coin)]) -> Double {
    var totalNumberOfCents = 0
    for tuple in from{
        switch tuple.1 {
        case .penny:
            totalNumberOfCents += Coin.penny.rawValue * tuple.0
        case .nickle:
            totalNumberOfCents += Coin.nickle.rawValue * tuple.0
        case .dime:
            totalNumberOfCents += Coin.dime.rawValue * tuple.0
        case .quarter:
            totalNumberOfCents += Coin.quarter.rawValue * tuple.0
        }
    }
    return Double(totalNumberOfCents)
}


// Uncomment the lines below to test your solution

//let coinArr: [(Int, Coin)] = [
//    (10, .penny),
//    (15, .nickle),
//    (3, .quarter),
//    (20, .penny),
//    (3, .dime),
//    (7, .quarter)
//]
//
//let expectedTotal = 385
//let total = getTotalValue(from: coinArr)
//assert(total == expectedTotal, "Was expecting \(expectedTotal), but got \(total)")

// Question Four

// Write an enum called Day to represent the days of the week with a raw value of type String.
// Write a method inside Day that returns whether or not it is a weekday (Monday - Friday)

// Your code here

enum Day: String {
    case monday = "Monday"
    case tuesday = "Tuesday"
    case wednesday = "Wednesday"
    case thursday = "Thursday"
    case friday = "Friday"
    case saturday = "Saturday"
    case sunday = "Sunday"
    
    func isWeekday () {
        switch self{
        case .monday:
            print("Moday is a weekday")
        case .tuesday:
            print("Tuesday is a weekday")
        case .wednesday:
            print("Wednesday is a weekday")
        case .thursday:
            print("Thursday is a weekday")
        case .friday:
            print("Friday is a weekday")
        case .saturday:
            print("Saturday is not a weekday")
        case .sunday:
            print("Sunday is not a weekday")
        }
    }
}

let weekDay = Day(rawValue: "Monday") ?? Day(rawValue: "not a day")

if let weekDay = Day(rawValue: "Monday"){
    switch weekDay {
    case .monday:
        print(Day.isWeekday(.monday))
    case .tuesday:
        print(Day.isWeekday(.tuesday))
    case .wednesday:
        print(Day.isWeekday(.wednesday))
    case .thursday:
        print(Day.isWeekday(.thursday))
    case .friday:
        print(Day.isWeekday(.friday))
    case .saturday:
        print(Day.isWeekday(.saturday))
    case .sunday:
        print(Day.isWeekday(.sunday))
        
    }
    
}

// Uncomment the lines below to test your solution

//assert(Day.monday.isWeekday() == true, "Monday is a weekday")
//assert(Day.tuesday.isWeekday() == true, "Tuesday is a weekday")
//assert(Day.wednesday.isWeekday() == true, "Wednesday is a weekday")
//assert(Day.thursday.isWeekday() == true, "Thursday is a weekday")
//assert(Day.friday.isWeekday() == true, "Friday is a weekday")
//assert(Day.saturday.isWeekday() == false, "Saturday is not a weekday")
//assert(Day.sunday.isWeekday() == false, "Sunday is not a weekday")

// Question Five

//Define an enumeration named HandShape with three members: .rock, .paper, .scissors.
//Define an enumeration named MatchResult with three members: .win, .draw, .lose.
//Write a function called matchResult(fromPlayerOneShape:andPlayerTwoShape:) that takes two HandShapes and returns a MatchResult. It should return the outcome for the first player (the one with the first hand shape).
//
//Rock beats scissors, paper beats rock, scissor beats paper

// Your code here

//ATTEMPTED ?
enum Handshape: Double {
    case rock = 2
    case paper = 3
    case scissors = 1
}

enum MatchResult{
    case win
    case draw
    case lose
}

func matchResult(fromPlayerOneShape: Handshape, fromPlayerTwoShape: Handshape) -> MatchResult {

    switch MatchResult.self {
    case fromPlayerOneShape == .rock && fromPlayerTwoShape == .paper:
        print("\(fromPlayerOneShape) wins!")
        case fromPlayerOneShape == .rock && fromPlayerTwoShape == .scissors:
        print("\(fromPlayerTwoShape) wins!")
        case fromPlayerOneShape == .paper && fromPlayerTwoShape == .scissors:
        print("\(fromPlayerTwoShape) wins!")
        case fromPlayerOneShape == .scissors && fromPlayerTwoShape == .paper:
        print("\(fromPlayerOneShape) wins!")
        case fromPlayerOneShape == .scissors && fromPlayerTwoShape == .paper:
        print("\(fromPlayerTwoShape) wins!")
    }

    return MatchResult
}



// Uncomment the lines below to test your solution

//let testCases: [(HandShape, HandShape, MatchResult)] = [
//    (.rock, .paper, .lose),
//    (.paper, .paper, .draw),
//    (.scissors, .rock, .lose),
//    (.rock, .scissors, .win)
//]
//
//for testCase in testCases {
//    let expectedOutput = testCase.2
//    let output = matchResult(fromPlayerOneShape: testCase.0, andPlayerTwoShape: testCase.1)
//    assert(output == expectedOutput, "Was execting \(expectedOutput), but got \(output) for inputs \(testCase.0) and \(testCase.1)")
//}
