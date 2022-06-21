//
//  DetailView.swift
//  ResponsiveUI Learning Project
//
//  Created by Simbarashe Dombodzvuku on 6/21/22.
//

import SwiftUI

struct DetailView: View {
    var user: User
    var prop: Properties
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 12) {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                            .font(.title3)
                            .foregroundColor(.black)
                    }
                    .opacity(prop.isLandscape || !prop.isSplit ? (prop.isiPad ? 0 : 1) : 1 )

                    Spacer()

                    Button {

                    } label: {
                        Image(systemName: "trash")
                            .font(.title3)
                            .foregroundColor(.red)
                    }
                }

                Divider()

                HStack(spacing: 15) {
                    Image(user.image)
                        .resizedToFill(width: 55, height: 55)
                        .clipShape(Circle())

                    VStack(alignment: .leading, spacing: 8){
                        HStack(spacing: 6) {
                            Text(user.name)
                                .fontWeight(.semibold)

                            if prop.isiPad {
                                Text("<randomemail@gmail.com>")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }

                        }

                        if !prop.isiPad {
                            Text("<randomemail@gmail.com>")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }

                        Text(user.title)
                            .font(.title3)
                            .bold()
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)

                    Text("Now")
                        .font(.caption)
                        .foregroundColor(.gray)
                }

                Text("""
                    Lorem ipsum paragraph....
                """)
                .multilineTextAlignment(.leading)
                .padding(.top, 20)
            }
            .padding()
        }
        .navigationBarHidden(true)
    }
    
}
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
