//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation


func askQuestion(number: Int) {
    let questions = ["참여할 사람은 몇 명인가요?", "최대 사다리 높이는 몇 개인가요?"]
    
    print(questions[number - 1])
}

func getNumberOfPeople() -> Int {
    guard let input = readLine(), let numberOfPeople = Int(input) else {
        return 0
    }
    
    return numberOfPeople
}

func getHeightOfLadder() -> Int {
    guard let input = readLine() else {
        return 0
    }
    
    guard let heightOfLadder = Int(input) else {
        return 0
    }
    
    return heightOfLadder
}

func hasNumberZero(_ people: Int, _ height: Int) -> Bool {
    return (people == 0 || height == 0)
}

func makeLadder(numberOfColumn: Int, numberOfRow: Int) -> [[Bool]] {
    var ladder = [[Bool]](repeating: Array(repeating: false, count: numberOfColumn), count: numberOfRow)
    
    for row in 0..<numberOfRow {
        for column in 0..<numberOfColumn {
            ladder[row][column] = generateRandom()
        }
    }
    
    return ladder
}

func generateRandom() -> Bool {
    return arc4random_uniform(2) == 1
}

func drawLadder(_ ladder: [[Bool]]) {
    
    for row in ladder {
        print("|", terminator: "")
        for column in row {
            print(makeBar(element: column), terminator: "|")
        }
        print()
    }
}

func makeBar(element: Bool) -> String {
    return element ? "-" : " "
}

func numberOfFrameFor(_ numberOfPeople: Int) -> Int {
    return numberOfPeople - 1
}

func runLadderGame() {
    
    askQuestion(number: 1)
    let numberOfPeople: Int = getNumberOfPeople()
    
    askQuestion(number: 2)
    let heightOfLadder = getHeightOfLadder()
    
    guard !hasNumberZero(numberOfPeople, heightOfLadder) else {
        return
    }
    
    let numberOfFrame = numberOfFrameFor(numberOfPeople)
    
    let ladder = makeLadder(numberOfColumn: numberOfFrame, numberOfRow: heightOfLadder)
    drawLadder(ladder)
}


// MARK: Run a program.
runLadderGame()
