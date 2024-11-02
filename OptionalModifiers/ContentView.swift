//
//  ContentView.swift
//  OptionalModifiers
//
//  Created by Muhammet Emin Ayhan on 2.11.2024.
//

import SwiftUI

enum Effect: String, CaseIterable {
    case bounce = "Bounce"
    case breathe = "Breathe"
    case pulse = "Pulse"
    case rotate = "Rotate"
}

struct ContentView: View {
    @State private var effect: Effect = .bounce
    var body: some View {
        Group {
            Picker("", selection: $effect) {
                ForEach(Effect.allCases,id: \.rawValue) {
                    Text($0.rawValue)
                        .tag($0)
                }
            }
            .pickerStyle(.segmented)
            .padding(15)
            
            Image(systemName: "heart.fill")
                .font(.largeTitle)
                .foregroundStyle(.red.gradient)
                .modifiers { image in
                    switch effect {
                    case .bounce:
                        image.symbolEffect(.bounce)
                    case .breathe:
                        image.symbolEffect(.breathe)
                    case .pulse:
                        image.symbolEffect(.pulse)
                    case .rotate:
                        image.symbolEffect(.rotate)
                    }
                }
        }
    }
}

extension View {
    @ViewBuilder
    func modifiers<Content: View>(@ViewBuilder content: @escaping (Self) -> Content) -> some View {
        content(self)
    }
}

#Preview {
    ContentView()
}
