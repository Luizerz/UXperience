//
//  SwiftUIView.swift
//  UXperience
//
//  Created by Luiz Sena on 25/11/22.
//

import SwiftUI
import UIKit

public struct SwiftUIView: View {

    @State private var frontCardAmount = 0.0
    @State private var backCardAmount = 90.0
    @State private var isFlipped: Bool = true

    private func flipCard () {
        isFlipped = !isFlipped
        if isFlipped {
            SoundManager.instance.playSound(with: "cardFlipSound")
            let feedBack = UIImpactFeedbackGenerator()
            feedBack.impactOccurred()
            withAnimation(.linear(duration: 0.3)) {
                backCardAmount = 90
            }
            withAnimation(.linear(duration: 0.3).delay(0.3)){
                frontCardAmount = 0
            }
        } else {
            SoundManager.instance.playSound(with: "cardFlipSound")
            let feedBack = UIImpactFeedbackGenerator()
            feedBack.impactOccurred()
            withAnimation(.linear(duration: 0.3)) {
                frontCardAmount = -90
            }
            withAnimation(.linear(duration: 0.3).delay(0.3)){
                backCardAmount = 0
            }
        }
    }

    public init() {}

    public var body: some View {
        ZStack{
            frontCard(animationAmount: $frontCardAmount)
            backCard(animationAmount: $backCardAmount)
        }
        .ignoresSafeArea()
        .onTapGesture {
            flipCard()
        }
        .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
            .onEnded(
                { value in
                    if value.translation.width < 0 {
                        flipCard()
                    }

                    if value.translation.width > 0 {
                        flipCard()
                    }
                }
            )
        )
    }
}

public struct frontCard: View {
    @Binding var animationAmount: Double
    public var body: some View {
        newView(animationAmount: animationAmount, stringText: "frontCard")
            .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0), perspective: 0.15)
    }
}

public struct backCard: View {
    @Binding var animationAmount: Double
    public var body: some View {
        newView(animationAmount: animationAmount, stringText: "backCard")
            .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0), perspective: 0.15)
    }

}

public struct newView: View {

    @State var animationAmount = 0.0
    var stringText: String?

    let gradient = Gradient(
        colors: [
            Color(
                cgColor: CoreGraphics.CGColor(
                    red: 216/255,
                    green: 211/255,
                    blue: 241/255,
                    alpha: 0.45)
            ),
            Color(cgColor: CoreGraphics.CGColor(
                red: 71/255,
                green: 58/255,
                blue: 137/255,
                alpha: 0.45)
            )
        ]
    )

    public var body: some View {

        GeometryReader { proxy in
            ZStack{
                RoundedRectangle(cornerRadius: 20)

                    .fill(LinearGradient(
                        gradient: gradient,
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing))
//                    .overlay{
//                        RoundedRectangle(cornerRadius: 20)
//                            .stroke(Color.gray, lineWidth: 0.6)
//                    }

                Text(stringText ?? "Error ao inicializar a stringText \(#function)")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
