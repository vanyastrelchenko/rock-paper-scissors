//
//  ContentView.swift
//  ViewsAndModifires
//
//  Created by Ivan on 02.05.2023.
//

import SwiftUI

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 80))
            .frame(width: 170, height: .infinity)
            .background(Color.green.opacity(0.6))
            .cornerRadius(15)
            .shadow(radius: 5)
    }
}

extension View {
    func buttonStyle() -> some View {
        modifier(ButtonModifier())
    }
}

struct ContentView: View {

    @State private var computerChoices = ["🗿", "✂️", "📜"].shuffled()
    @State private var usersChoice = ""
    @State private var showResult = "Make a choice"
    @State private var usersScoreCounter = 0
    @State private var computersScoreCounter = 0
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("🤖Score: \(computersScoreCounter)")
                    .font(.title.bold())
            }
            
            HStack {
                Text("\(computerChoices[0])")
                    .font(.system(size: 80))
                    .frame(width: 170, height: .infinity)
                    .background(Color.red.opacity(0.2))
                    .cornerRadius(15)
                    .shadow(radius: 5)
            }
            
            Spacer()
            HStack {
                Text("\(showResult)")
                    .font(.largeTitle.bold())
                    .frame(width: 340, height: .infinity)
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color.gray.opacity(0.4))
                    .cornerRadius(15)
            }
            Spacer()
            
            HStack {
                Spacer()
                Button(action: {
                    computerChoices.shuffle()
                    usersChoice = "🗿"
                    game()
                }) {
                    VStack {
                        Text("🗿")
                            .buttonStyle()
                    }
                    
                }
                Spacer()
                Button(action: {
                    computerChoices.shuffle()
                    usersChoice = "✂️"
                    game()
                }) {
                    VStack {
                        Text("✂️")
                            .buttonStyle()
                    }
                }
                Spacer()
            }
            HStack {
                Button(action: {
                    computerChoices.shuffle()
                    usersChoice = "📜"
                    game()
                }) {
                    VStack {
                        Text("📜")
                            .buttonStyle()
                    }
                }
            }
            HStack {
                Button(action: {
                    restartGame()
                }) {
                    VStack {
                        Text("Restart")
                            .foregroundColor(Color.white)
                            .font(.title.bold())
                    }
                    .frame(width: 365, height: .infinity)
                    .background(Color.red.opacity(0.6))
                    .cornerRadius(15)
                    .shadow(radius: 5)
                }
            }
            
            HStack {
                Text("👨🏻‍💻Score: \(usersScoreCounter)")
                    .font(.title.bold())
                    .padding()
            }
        }
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.red.opacity(0.5), Color.blue.opacity(0.8), Color.green.opacity(0.5)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
    }
    
    func restartGame() {
        usersScoreCounter = 0
        computersScoreCounter = 0
        showResult = "Make a choice"
    }
    
    func game() {
        if usersChoice ==  computerChoices[0] {
            showResult = "Tie"
        }
        if usersChoice == "🗿" && computerChoices[0] == "✂️" {
            usersScoreCounter += 1
            showResult = "User wins🔥"
        }
        if usersChoice == "✂️" && computerChoices[0] == "📜" {
            usersScoreCounter += 1
            showResult = "User wins🔥"
        }
        if usersChoice == "📜" && computerChoices[0] == "🗿" {
            usersScoreCounter += 1
            showResult = "User wins🔥"
        }
        if usersChoice == "🗿" && computerChoices[0] == "📜" {
            computersScoreCounter += 1
            showResult = "Computer wins🙈"
        }
        if usersChoice == "✂️" && computerChoices[0] == "🗿" {
            computersScoreCounter += 1
            showResult = "Computer wins🙈"
        }
        if usersChoice == "📜" && computerChoices[0] == "✂️" {
            computersScoreCounter += 1
            showResult = "Computer wins🙈"
        }
    }
}

struct previewView: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
