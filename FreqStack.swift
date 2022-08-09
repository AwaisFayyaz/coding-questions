//
//  FreqStack.swift
//  Practice-App
//
//  Created by Awais Fayyaz on 09/08/2022.
//

import Foundation
struct FreqStack {
  var stack: [Int]
  
  mutating func push(number: Int) {
    stack.append(number)
    print("After pushing \(number) stack: \(stack)")
  }
  
  mutating func pop() -> Int {
    let mostFrequentNumbers = ReturnMostFrequentNumbers()
    print("mostFrequentNumbers: \(mostFrequentNumbers)")
    let poppedNumber = removeFromLast(fromTheseNumbers: mostFrequentNumbers)
    print("After popping, the stack: \(stack)")
    return poppedNumber
  }
  
  ///Req:  If there is a tie (same frequency) for the most frequent element, the element closest to the stack's top is removed and returned.
  ///checks the array, starting from last element and if some element matches from the ones we want to remove, remove it.
  mutating func removeFromLast(fromTheseNumbers numbers: [Int]) -> Int {
    var reversedStack = Array(stack.reversed())
    //reversed because ranges work from low to high.
    for index in 0...reversedStack.count {
      let numberAtIndex = reversedStack[index]
      if numbers.contains(numberAtIndex) {
        let removed = reversedStack.remove(at: index)
        stack = reversedStack.reversed()
        return removed
      }
    }
    return -1
  }
  
  func ReturnMostFrequentNumbers() -> [Int] {
    var frequencyDict: [Int: Int] = [:]
    for element in stack {
      frequencyDict[element] = (frequencyDict[element] ?? 0 ) + 1
    }
    
    let maxFrequency = frequencyDict.values.max()
    let mostFrequentNumbers = frequencyDict.filter { dictElement in
      return dictElement.value == maxFrequency
    }
    
    return Array(mostFrequentNumbers.keys)
  }
}
