//
//  ExpandableSearchView.swift
//  App
//
//  Created by Ibrahim Mo Gedami on 11/26/24.
//

import SwiftUI

struct ExpandableSearchBarView: View {

    @State private var isExpanded = false
    @State private var searchText = ""

    var body: some View {
        ZStack {
            // Background Blur Effect
            if isExpanded {
                Color.white
                    .opacity(0.5)
                    .blur(radius: 10)
                    .ignoresSafeArea()
                    .transition(.opacity.animation(.easeInOut))
            }

            VStack {
                // Search Bar
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)

                        TextField("Search...", text: $searchText)
                            .frame(maxWidth: isExpanded ? .infinity : 0)
                            .opacity(isExpanded ? 1 : 0)
                            .animation(.easeInOut(duration: 0.3), value: isExpanded)
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .shadow(radius: 5)
                    )
                    .onTapGesture {
                        withAnimation(.spring()) {
                            isExpanded.toggle()
                        }
                    }

                    // Expand/Collapse Button
                    if isExpanded {
                        Button(action: {
                            withAnimation(.easeInOut) {
                                isExpanded.toggle()
                                searchText = ""
                            }
                        }) {
                            Image(systemName: "xmark")
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding(.horizontal)

                Spacer()
            }
        }
    }
}

struct ExpandableSearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        ExpandableSearchBarView()
    }
}

