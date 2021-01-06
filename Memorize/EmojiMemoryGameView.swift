//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by João Viana on 28/12/2020.
//

import SwiftUI

// this is the View

struct EmojiMemoryGameView: View {
    // How reactive programming works ->
    @ObservedObject var viewModel: EmojiMemoryGame

    var body: some View {
        // return is inferred here
        return HStack() {
            // can remove ', content: '
            // ForEach(0..<4) {index in (...)}
            ForEach(viewModel.cards, content: { card in
                CardView(card: card).onTapGesture {
                    viewModel.choose(card: card)
                }
            })
        }
            .padding()
            .foregroundColor(Color.orange)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize) -> some View {
        ZStack {
            // cannot create vars inside this ZStack for example
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: cornerRadius)
            }
        }
        .font(Font.system(size: fontSize(for: size)))
    }
    
    // MARK: - Drawing constants
    
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3.0
    let fontScalarFactor: CGFloat = 0.75
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * fontScalarFactor
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            EmojiMemoryGameView(viewModel: EmojiMemoryGame())
        }
    }
}
