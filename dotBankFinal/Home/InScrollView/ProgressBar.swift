//
//  ProgressBar.swift
//  dotBankFinal
//
//  Created by Tom on 07/11/2021.
//

import SwiftUI

struct ProgressBar: View {

    @State var value: Float
    @State var color: Color = Color(UIColor.systemTeal)

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(color)

                Rectangle().frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .foregroundColor(color)
            }.cornerRadius(45.0)
        }
    }
}

struct ProgressBar_Previews: PreviewProvider {

    static let test: Float = 0.4

    static var previews: some View {
        ProgressBar(
            value: test,
            color: .red
        )
    }
}

