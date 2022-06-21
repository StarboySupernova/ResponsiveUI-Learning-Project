//
//  ContentView.swift
//  ResponsiveUI Learning Project
//
//  Created by Simbarashe Dombodzvuku on 6/21/22.
//

import SwiftUI

struct ContentView: View {
    @State private var currentMenu: String = "Inbox"
    @State private var showMenu: Bool = false
    @State private var excessPadding: CGFloat = 0

    var body: some View {
        ResponsiveView { prop in
            HStack(spacing: 0) {
                if prop.isLandscape && !prop.isSplit {
                    Sidebar(currentMenu: $currentMenu, prop: prop)
                }

                NavigationView {
                    MainView(prop: prop)
                        .navigationBarHidden(true)
                        .padding(.leading, excessPadding)
                }
                .modifier(PaddingModifier(padding: $excessPadding, prop: prop))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay {
                ZStack(alignment: .leading) {
                    if !prop.isLandscape || prop.isSplit {
                        Color.black
                            .opacity(showMenu ? 0.25 : 0)
                            .ignoresSafeArea()
                            .onTapGesture {
                                withAnimation {
                                    showMenu.toggle()
                                }
                            }

                        Sidebar(currentMenu: $currentMenu, prop: prop)
                            .offset(x: showMenu ? 0 : -300)
                    }
                }
            }
        }
        .ignoresSafeArea(.container, edges: .leading)
    }
    @ViewBuilder
    func MainView(prop: Properties) -> some View {
        VStack(spacing: 0) {
            HStack(spacing: 12) {
                if !prop.isLandscape {
                    Button {
                        withAnimation {
                            showMenu.toggle()
                        }
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .font(.title3)
                            .foregroundColor(.black)
                    }
                }

                TextField("Search", text: .constant(""))

                Image(systemName: "magnifyingglass")

            }
            .padding(.horizontal)
            .padding(.top, 12)
            .background {
                RoundedRectangle(cornerRadius:6, style: .continuous)
                    .fill(.white)
            }

            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 15) {
                    ForEach(users){ user in
                        NavigationLink {
                            DetailView(user: user, prop: prop)
                        } label: {
                            UserCardView(user: user, prop: prop)
                        }
                    }
                }
                .padding(.top, 30)
            }

        }
        .padding()
        .frame(maxHeight: .infinity, alignment: .top)
        .background {
            Color.purple.opacity(0.5)
                .ignoresSafeArea()
        }
    }

    @ViewBuilder
    func UserCardView(user: User, prop: Properties) -> some View {
        VStack(alignment: .leading, spacing: 12){
            HStack(spacing: 10) {
                Image(user.image)
                    .resizedToFill(width: 45, height: 45)
                    .clipShape(Circle())

                VStack(alignment: .leading, spacing: 8){
                    Text(user.name)
                        .fontWeight(.bold)

                    Text(user.title)
                        .font(.caption)
                }
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)

                Text("Now")
                    .font(.caption)
                    .foregroundColor(.gray)
            }

            Text("Lorem Ipsum...")
                .font(.caption)
                .foregroundColor(.gray)
                .multilineTextAlignment(.leading)
                .lineLimit(3)
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius:6, style: .continuous)
                .fill(.ultraThinMaterial)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
