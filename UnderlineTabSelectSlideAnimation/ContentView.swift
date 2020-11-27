//
//  ContentView.swift
//  UnderlineTabSelectSlideAnimation
//
//  Created by Ramill Ibragimov on 27.11.2020.
//

import SwiftUI

struct ContentView: View {
    let categories = ["Fruits", "Fish", "Dairy"]
    @State private var selectedCategory = "Fruits"
    @Namespace private var animation
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(categories, id: \.self) { category in
                        Button(action: {
                            withAnimation {
                                selectedCategory = category
                            }
                        }
                        , label: {
                            VStack(spacing: 4) {
                                Text(category)
                                    .font(.system(size: 18))
                                    .fontWeight(.semibold)
                                    .matchedGeometryEffect(id: category, in: animation, isSource: true)
                            }
                        })
                        .accentColor(.primary)
                    }.overlay(RoundedRectangle(cornerRadius: 5)
                                .frame(height: 2)
                                .matchedGeometryEffect(id: selectedCategory, in: animation, isSource: false))
                }
            }.padding()
            Spacer()
        }
        .navigationBarTitle("Groceries")
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
