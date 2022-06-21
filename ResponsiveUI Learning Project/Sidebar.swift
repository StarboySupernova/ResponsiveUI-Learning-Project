//
//  Sidebar.swift
//  ResponsiveUI Learning Project
//
//  Created by Simbarashe Dombodzvuku on 6/21/22.
//

import SwiftUI

struct Sidebar: View {
    @Binding var currentMenu: String
    var prop: Properties
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 20) {
                Image("profile")
                    .resizedToFill(width: 55, height: 55)
                    .clipShape(Circle())
                
                SidebarButton(icon: "tray.and.arrow.down.fill", title: "Inbox")
                    .padding(.top, 40)
                
                SidebarButton(icon: "paperplane", title: "Sent")
                
                SidebarButton(icon: "doc.fill", title: "Draft")
                
                SidebarButton(icon: "star", title: "Starred")
                
                SidebarButton(icon: "trash", title: "Bin")
                
            }
            .padding()
            .padding(.top, 12)
        }
        .padding(.leading, 10)
        .frame(width: (prop.isLandscape ? prop.size.width : prop.size.height) / 4 > 300 ? 300 : (prop.isLandscape ? prop.size.width : prop.size.height) / 4)
        .background {
            Color.indigo.opacity(0.5)
        }
    }
    
    @ViewBuilder
    func SidebarButton(icon: String, title: String) -> some View {
        Button {
            currentMenu =  title
        } label: {
            VStack {
                HStack(spacing: 10) {
                    Image(systemName: "chevron.right")
                        .font(.callout)
                        .foregroundColor(.black)
                        .opacity(currentMenu == title ? 1 : 0)
                    
                    Image(systemName: icon)
                        .font(.callout)
                        .foregroundColor(currentMenu == title ? .purple : .gray)
                    
                    Text(title)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .foregroundColor(currentMenu == title ? .black : .gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Divider()
            }
        }
    }
}

//using negative padding to effect space changes to sidebar when device is iPad
struct PaddingModifier: ViewModifier {
    @Binding var padding: CGFloat
    var prop: Properties
    
    func body(content: Content) -> some View {
        content
            .overlay {
                GeometryReader{ geometry in
                    Color.clear
                        .preference(key: PaddingKey.self, value: geometry.frame(in: .global))
                        .onPreferenceChange(PaddingKey.self) { value in
                            self.padding = -(value.minX / 3.3)
                        }
                }
            }
    }
    
}

//Preference Key
struct PaddingKey: PreferenceKey {
    static var defaultValue: CGRect = .zero
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}

struct Sidebar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
