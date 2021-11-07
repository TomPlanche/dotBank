//
//  ButtonView.swift
//  dotBankFinal
//
//  Created by Tom on 06/11/2021.
//

import SwiftUI

struct ButtonView: View {

    // MARK: - VARIABLES

    @State var title: String
    @State var content: String
    @State var flags = 0

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(Color.hexToColor(hex: "#2C2C2E"))
            HStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text(title)
                        if flags != 0 {
                            Text(String("(\(flags))"))
                                .foregroundColor(Color("blueText"))
                        }
                    }
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .foregroundColor(.white)
                    Text(content)
                        .font(.system(size: 15, weight: .semibold, design: .rounded))
                }.padding()
                Spacer()
                Image(systemName: "chevron.right")
                    .font(.system(size: 25))
                    .padding(.trailing)
            }
            .foregroundColor(Color("grayText"))
            
        }.frame(width: UIScreen.main.bounds.width / 1.1, height: UIScreen.main.bounds.height / 12)
    }
}

struct ButtonView_Previews: PreviewProvider {

    static let titleTest: String = "Test"
    static let contentTest: String = "oui123"

    static var previews: some View {
        ButtonView(title: titleTest, content: contentTest, flags: 4)
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 13 Pro Max")
    }
}
