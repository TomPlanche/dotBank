//
//  ContentView.swift
//  dotBankFinal
//
//  Created by Tom on 05/11/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                VStack {
                    Image(systemName: "creditcard")
                    Text("Accounts")
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
    func cleanDollars(_ value: String?) -> String {
        guard value != nil else { return "$0.00" }
        let doubleValue = Double(value!) ?? 0.0
        let formatter = NumberFormatter()
        formatter.currencyCode = "USD"
        formatter.currencySymbol = "$"
        formatter.minimumFractionDigits = (value!.contains(".00")) ? 0 : 2
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
}
