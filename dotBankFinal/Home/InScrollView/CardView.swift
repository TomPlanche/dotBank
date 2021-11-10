//
//  CardView.swift
//  dotBankFinal
//
//  Created by Tom on 06/11/2021.
//

import SwiftUI

struct CardView: View {

    // MARK: - VARIABLES
    // Card passed while calling the view
    @State var card: Card

    // Binding passed while calling the view
    // served to show the sheet
    @Binding var showSheetView: Bool


    // Exemples of payment info
    let textes: [[String]] = [
        ["Payment Due Date", "Mar 10, 2021"],
        ["Minimum Payment Due", "$35.00"],
        ["Next Closing Date", "Mar 13, 2021"]
    ]

    let texte: [String] = [
        "Lock Card",
        "Replace Credit Card",
        "Change PIN"
    ]

    // Exemples of transaction
    let transactions: [Transaction] = [
        Transaction(
            number: 233,
            amount: 487.89,
            name: "Pending Payment",
            date: Date.from(year: 2021, month: 11, day: 2)!
        ),
        Transaction(
            number: 234,
            amount: 142.34,
            name: "COSTCO WHSE #0420 Oxnard CA",
            date: Date.from(year: 2021, month: 11, day: 4)!
        ),
        Transaction(
            number: 235,
            amount: 42.34,
            name: "AT&T Bill Payment214-721-3651 TX",
            date: Date.from(year: 2021, month: 11, day: 5)!
        ),
        Transaction(
            number: 236,
            amount: 500,
            name: "CASH DEPOSIT",
            date: Date.from(year: 2021, month: 11, day: 6)!
        )
    ]

    // Fonction convertissant un Date en String
    func date2string(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YY"

        return dateFormatter.string(from: date)
    }


    // MARK: - BODY
    var body: some View {
        ZStack {
            // MARK: Background
            Color("background")
                .ignoresSafeArea()
            // MARK: General VStack
            VStack {
                HStack {
                    Spacer()
                    // Button that triggers the CardView
                    Button(action: {
                        self.showSheetView = false
                    }, label: {
                            Text("Done")
                                .bold()
                                .font(.system(size: 20, weight: .semibold, design: .rounded))
                                .foregroundColor(Color("blueText"))
                        })
                }.padding()

                Text("\(card.name) ... \(String(card.number).substring(from: -4))")
                    .font(.system(size: 25, weight: .bold, design: .rounded))
                    .foregroundColor(.white)


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

                    // MARK: Form For Payment
                Form {
                        // MARK: Section For Payment
                    Section(content: {
                        ForEach(0...textes.count - 1, id: \.self) { i in
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
                        // MARK: Section For Payment
                    Section(content: {
                        ForEach(0...3, id: \.self) { i in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(transactions[i].name)
                                        .font(.system(size: 17, weight: .regular, design: .rounded))
                                    Text(date2string(date: transactions[i].date))
                                        .foregroundColor(Color("grayText"))
                                }
                                Spacer()
                                Text("".cleanDollars(transactions[i].amount))

                            }
                            .foregroundColor(.white)
                        }
                        HStack {
                            Text("All Transactions")
                                .bold()
                                .foregroundColor(Color("blueText"))
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color(UIColor.systemGray))
                        }
                        .font(.system(size: 20))
                    }, header: {
                        Text("RECENT TRANSACTIONS")
                            .foregroundColor(Color("grayText"))
                            .font(.system(size: 18))
                    })
                        .listRowBackground(Color.hexToColor(hex: "#2C2C2E"))

                    Section(
                        content: {
                            VStack(alignment: .leading) {
                                Text("".cleanDollars(46.73))
                                    .bold()
                                    .font(.system(size: 19))
                                Text("Totatal Available Rewards")
                                    .font(.system(size: 15))
                                    .foregroundColor(Color("grayText"))
                            }.foregroundColor(.white)
                            HStack {
                                Text("Make Payment")
                                    .bold()
                                    .foregroundColor(Color("blueText"))
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(Color("grayText"))
                            }

                        },
                        header: {
                            Text("CASH REWARD & BENEFICES")
                                .foregroundColor(Color("grayText"))
                        }
                    )
                        .listRowBackground(Color.hexToColor(hex: "#2C2C2E"))

                    Section(
                        content: {
                            ForEach(0...2, id: \.self) { i in
                                HStack {
                                    Text(texte[i])
                                        .foregroundColor(.white)
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(Color("grayText"))
                                }
                            }

                        },
                        header: {
                            Text("CARD MANAGEMENT")
                                .foregroundColor(Color("grayText"))
                        }
                    ).listRowBackground(Color.hexToColor(hex: "#2C2C2E"))

                    Section {
                        Text("FICO Score")
                            .foregroundColor(.white)
                    }.listRowBackground(Color.hexToColor(hex: "#2C2C2E"))
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

    @State static var showSheetView: Bool = false

    static var previews: some View {
        CardView(card: card1, showSheetView: $showSheetView)
    }
}
