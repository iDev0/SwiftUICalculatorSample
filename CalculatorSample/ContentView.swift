//
//  ContentView.swift
//  CalculatorSample
//
//  Created by iDev0 on 2020/03/03.
//  Copyright © 2020 Ju Young Jung. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var displayText: String = "0"
    @State var isTypingNumber: Bool = false
    @State private var firstNumber = 0
    @State private var secondNumber = 0
    @State private var operand = ""
    
    var body: some View {
        
        VStack(spacing: 30) {
            TextField("0", text: $displayText)
                .border(Color.gray, width: 2)
                .padding()
                .multilineTextAlignment(.trailing)
            
            HStack {
                createCalcDigit("1")
                Spacer()
                createCalcDigit("2")
                Spacer()
                createCalcDigit("3")
            }.padding()

            HStack {
                createCalcDigit("4")
                Spacer()
                createCalcDigit("5")
                Spacer()
                createCalcDigit("6")
            }.padding()
            
            HStack {
                createCalcDigit("7")
                Spacer()
                createCalcDigit("8")
                Spacer()
                createCalcDigit("9")
            }.padding()
            
            HStack {
                // 3.
                Button(action: {
                    self.operandTapped("-")
                }) {
                    (Text("-"))
                }
                Spacer()
                createCalcDigit("0")
                Spacer()
                Button(action: {
                    self.operandTapped("+")
                }) {
                    (Text("+"))
                }

            }.padding()

            HStack {
                Button(action: {
                    self.operandTapped("*")
                }) {
                    (Text("*"))
                }
                Spacer()
                // 4.
                Button(action: {
                    self.calculate()
                }) {
                    (Text("="))
                }
                Spacer()
                Button(action: {
                    self.operandTapped("/")
                }) {
                    (Text("/"))
                }
            }.padding()
            
            
        }
        .font(.largeTitle)
        
        
        
    }
    
    private func createCalcDigit(_ number: String) -> Button<Text> {
        return Button(action: {
            self.digitTapped(number)
        }) {
            (Text(number))
        }
    }
    
    // 2.
    private func digitTapped(_ number: String) -> Void {
        if isTypingNumber {
            displayText += number
        } else {
            displayText = number
            isTypingNumber = true
        }
    }

    // 3.
    private func operandTapped(_ operand: String) {
        isTypingNumber = false
        firstNumber = Int(displayText)!
        self.operand = operand
        displayText = operand
    }

    // 4.
    private func calculate() {
        isTypingNumber = false
        var result  = 0
        secondNumber = Int(displayText)!

        switch operand {
        case "+":
            result = firstNumber + secondNumber
        case "-":
            result = firstNumber - secondNumber
        case "*":
            result = firstNumber * secondNumber
        case "/":
            result = firstNumber / secondNumber
        default:
            result = 0
        }
        
        displayText = "\(result)"
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
