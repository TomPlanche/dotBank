//
//  FormView.swift
//  dotBankFinal
//
//  Created by Tom on 05/11/2021.
//

import SwiftUI

struct FormView: View {

    // MARK: - VARIABLES
    @State var Accounts: Array<Account>
    @State var Cards: Array<Card>

    @State var areYouGoingToSecondView: Bool = false

    var body: some View {
        VStack {
            // MARK: - Form
            Form {
                // MARK: - Section Accounts
                Section(
                    header:
                        Text("CHECKING ACCOUNTS (\(Accounts.count))")
                        .foregroundColor(Color("grayText"))
                ) {
                    ForEach(Accounts) { account in
                        Button(action: {
                            print("Bouton \(account.name)")
                        }, label: {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text("".cleanDollars(account.money))
                                            .bold()
                                            .font(.system(size: 19))
                                        Text("\(account.name) ...\(String(account.number).substring(from: -4))")
                                            .font(.system(size: 15))
                                            .foregroundColor(Color("grayText"))
                                    }
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(Color("grayText"))
                                }
                            })
                            .foregroundColor(.white)

                    } .listRowBackground(Color.hexToColor(hex: "#2C2C2E"))
                        .padding(5)
                }
                // MARK: - Section Cards

                Section(
                    header:
                        Text("CREDIT CARDS (\(Cards.count))")
                        .foregroundColor(Color("grayText"))
                ) {
                    ForEach(Cards) { card in
                        NavigationLink(destination: CardView(card: card)) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("".cleanDollars(card.money))
                                        .bold()
                                        .font(.system(size: 19))
                                    Text("\(card.name) ...\(String(card.number).substring(from: -4))")
                                        .font(.system(size: 15))
                                        .foregroundColor(Color("grayText"))
                                }
                            }
                        }

                    }
                        .listRowBackground(Color.hexToColor(hex: "#2C2C2E"))
                        .padding(5)
                }
            }
        }
        .onAppear {
            UITableView.appearance().backgroundColor = UIColor(Color("background"))
        }
    }
}

struct FormView_Previews: PreviewProvider {

    static var account1 = Account(number: 1322213451234, name: "Total Checking", money: 14234.32)
    static var account2 = Account(number: 423521345, name: "Buisness Checking", money: 2134.69)

    static var card1 = Card(number: 4724332197467784, name: "Platinum Mastercard", money: 241.65)
    static var card2 = Card(number: 7413686531874906, name: "Cash Reward Visa", money: 1576.03)

    static var previews: some View {
        FormView(Accounts: [account1, account2], Cards: [card1, card2])
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 13 Pro Max")
    }
}
