//
//  ContentView.swift
//  dotBankFinal
//
//  Created by Tom on 05/11/2021.
//

import SwiftUI

struct ContentView: View {
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color.white.opacity(0.5))
    }
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                VStack {
                    Image(systemName: "creditcard")
                    Text("Accounts")
                }
            }
            Text("arrow.left.arrow.right")
                .tabItem {
                VStack {
                    Image(systemName: "arrow.left.arrow.right")
                    Text("Tranfer & Pay")
                }
            }
            Text("square.and.arrow.down")
                .tabItem {
                VStack {
                    Image(systemName: "square.and.arrow.down")
                    Text("Deposit Check")
                }
            }
            Text("line.horizontal.3")
                .tabItem {
                VStack {
                    Image(systemName: "line.horizontal.3")
                    Text("Menu")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 13 Pro Max")
    }
}


// MARK: - EXTENTIONS

// MARK: Color Extention
extension Color {
    static func hexToColor (hex: String, opacity: Double = 1.0) -> Color {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        if ((cString.count) != 6) {
            return Color.gray
        }
        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        return Color(
            red: Double((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: Double((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: Double(rgbValue & 0x0000FF) / 255.0,
            opacity: Double(opacity)
        )
    }
}

// MARK: String Extention
extension String {
    func cleanDollars(_ value: Double?) -> String {
        guard value != nil else { return "$0.00" }
        let doubleValue = value!
        let formatter = NumberFormatter()
        formatter.currencyCode = "USD"
        formatter.currencySymbol = "$"
        formatter.minimumFractionDigits = (String("\(value)").contains(".00")) ? 0 : 2
        formatter.maximumFractionDigits = 2
        formatter.numberStyle = .currencyAccounting

        return formatter.string(from: NSNumber(value: doubleValue)) ?? "$\(doubleValue)"
    }

    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }

    func substring(from: Int) -> String {
        let fromIndex = (from > 0 ? index(from: from) : index(from: self.count - abs(from)))
        return String(self[fromIndex...])
    }

    func substring(to: Int) -> String {
        let toIndex = index(from: to)
        return String(self[..<toIndex])
    }

    func substring(with r: Range<Int>) -> String {
        let startIndex = index(from: r.lowerBound)
        let endIndex = index(from: r.upperBound)
        return String(self[startIndex..<endIndex])
    }
}

extension Date {
        /// Create a date from specified parameters
        ///
        /// - Parameters:
        ///   - year: The desired year
        ///   - month: The desired month
        ///   - day: The desired day
        /// - Returns: A `Date` object
    static func from(year: Int, month: Int, day: Int) -> Date? {
        let calendar = Calendar(identifier: .gregorian)
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        return calendar.date(from: dateComponents) ?? nil
    }
}


// MARK: - STRUCTURES

// MARK: Account Struct
struct Account: Identifiable {
    var id: Int { number }

    var number: Int
    var name: String
    var money: Double
}

// MARK: Card Struct
struct Card: Identifiable {
    var id: Int { number }

    var number: Int
    var name: String
    var money: Double
    var threshold: Int = 5000
}

// MARK: Transaction
struct Transaction: Identifiable {
    var id: Int { number }

    var number: Int
    var amount: Double
    var name: String
    var date: Date
}
