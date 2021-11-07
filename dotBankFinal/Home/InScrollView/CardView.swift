//
//  CardView.swift
//  dotBankFinal
//
//  Created by Tom on 06/11/2021.
//

import SwiftUI

struct CardView: View {

    @State var card: Card

    var body: some View {
        VStack {
            Text("Test Oui Oui")
        }
    }
}

struct CardView_Previews: PreviewProvider {

    static let card1 = Card(number: 4724332197467784, name: "Platinum Mastercard", money: 241.65)

    static var previews: some View {
        CardView(card: card1)
    }
}
