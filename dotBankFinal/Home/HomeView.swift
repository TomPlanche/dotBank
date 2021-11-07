//
//  HomeView.swift
//  dotBankFinal
//
//  Created by Tom on 05/11/2021.
//

import SwiftUI

struct HomeView: View {

    // MARK: - VARIABLES

    // MARK: Accounts
    let account1 = Account(number: 1322213451234, name: "Total Checking", money: 14234.32)
    let account2 = Account(number: 423521345, name: "Buisness Checking", money: 2134.69)

    // MARK: Cards
    let card1 = Card(number: 4724332197467784, name: "Platinum Mastercard", money: 241.65)
    let card2 = Card(number: 7413686531874906, name: "Cash Reward Visa", money: 1576.03)

    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()
            VStack {
                VStack {

                    // MARK: - TOP NON SCROLLABLE
                    // MARK: Icones au Top
                    HStack {
                        Image(systemName: "text.bubble")
                        Spacer()
                        Image(systemName: "bell")
                    }
                        .font(.system(size: 25))
                        .foregroundColor(Color("blueText"))
                        .padding()
                    // MARK: Titre Account
                    HStack {
                        Text("Accounts")
                            .font(.system(size: 40, weight: .semibold, design: .rounded))
                        Spacer()
                    }.padding(.leading)

                    // MARK: - DÉBUT SCROLLABLE
                    ScrollView(.vertical, showsIndicators: false) {
                        // MARK: Scroll obligé car mutiplicité des comptes/cartes
                        ScrollView(.vertical, showsIndicators: false) {
                            FormView(Accounts: [account1, account2], Cards: [card1, card2])
                                .onAppear {
                                UITableView.appearance().backgroundColor = UIColor(Color("background"))
                            }
                                .frame(height: UIScreen.main.bounds.height / 2.5)
                        }
                            .frame(height: UIScreen.main.bounds.height / 2.5)
                        // MARK: Bouton New Account
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(lineWidth: 2)
                            Text("Open A New Account")
                                .font(.system(size: 20, weight: .semibold, design: .rounded))
                        }
                            .foregroundColor(Color("blueText"))
                            .frame(width: UIScreen.main.bounds.width / 1.1, height: UIScreen.main.bounds.height / 18)
                            .padding(.vertical)
                        // MARK: Bouton Schedule a meeting
                        ButtonView(
                            title: "Schedule A Meeting",
                            content: "Connect with a specialist"
                        )
                            .padding()
                        // MARK: Bouton Dot Bank Offers
                        ButtonView(
                            title: "Dot Bank Offers",
                            content: "Add Deals Shop(s) and get cashback",
                            flags: 17
                        )
                    }

                }
                Spacer()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 13 Pro Max")
    }
}
