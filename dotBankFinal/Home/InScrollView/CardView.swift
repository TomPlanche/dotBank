//
//  CardView.swift
//  dotBankFinal
//
//  Created by Tom on 06/11/2021.
//

import SwiftUI

struct CardView: View {

    // MARK: - VARIABLES
    @State var card: Card

    let textes: [[String]] = [
        ["Payment Due Date", "Mar 10, 2021"],
        ["Minimum Payment Due", "$35.00"],
        ["Next Closing Date", "Mar 13, 2021"]
    ]

    // MARK: - BODY
    var body: some View {
        ZStack {
            // MARK: Background
            Color("background")
                .ignoresSafeArea()
            // MARK: General VStack
            VStack {
                HStack {
                    Text("\(card.name) ...\(String(card.number).substring(from: -4))")
                    Spacer()
                    Image(systemName: "bell")
                }
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .foregroundColor(Color("blueText"))

                Text("".cleanDollars(card.money))
                    .font(.system(size: 45, weight: .semibold, design: .rounded))
                    .foregroundColor(.white)
                    .padding([.top, .trailing, .leading])

                HStack {
                    Text("Current Balance")
                        .foregroundColor(Color("grayText"))
                    Image(systemName: "info.circle")
                        .font(.system(size: 25))
                        .foregroundColor(Color("blueText"))
                }

                // MARK: ProgressBar
                ProgressBar(
                    value: Float((card.money / Double(card.threshold))),
                    color: (Int(card.money) < card.threshold) ? Color(UIColor.systemBlue) : Color(UIColor.systemRed)
                )
                    .frame(width: UIScreen.main.bounds.width / 1.1, height: UIScreen.main.bounds.height / 150)
                    .padding()

                Text("Avaliable Credit: \("".cleanDollars(Double(card.threshold) - card.money)) ")
                    .foregroundColor(Color("grayText"))

                // MARK: Form
                Form {
                    Section(content: {
                        ForEach(0...textes.count - 1, id: \.self) {i in
                            HStack {
                                Text(textes[i][0])
                                    .font(.system(size: 17))
                                Spacer()
                                Text(textes[i][1])
                                    .bold()
                            }
                            .font(.system(size: 18))
                            .foregroundColor(.white)
                        }
                        HStack {
                            Text("Make Payment")
                                .bold()
                                .foregroundColor(Color("blueText"))
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color(UIColor.systemGray))
                        }
                        .font(.system(size: 20))
                    }, header: {
                            Text("PAYMENT INFO")
                                .foregroundColor(Color("grayText"))
                                .font(.system(size: 18))
                        })
                        .listRowBackground(Color.hexToColor(hex: "#2C2C2E"))
                }
                    .onAppear {
                    UITableView.appearance().backgroundColor = UIColor(Color("background"))
                }

                Spacer()
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {

    static let card1 = Card(number: 4724332197467784, name: "Platinum Mastercard", money: 4241.65)

    static var previews: some View {
        CardView(card: card1)
    }
}
