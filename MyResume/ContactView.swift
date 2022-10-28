//
//  ContactView.swift
//  MyResume
//
//  Created by 黃郁雯 on 2022/10/24.
//

import SwiftUI

struct ContactView: View {
    @Binding var isShowing: Bool
    
    var body: some View {
        VStack(spacing: 24){
            HStack(spacing: 0){
                Image(systemName: "phone")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 35)
                    .foregroundColor(Color(red: 255/255, green: 193/255, blue: 193/255, opacity: 1))
                    .padding(7)
                    .background(Color(red: 108/255, green: 166/255, blue: 205/255))
                    .cornerRadius(10)
                    .padding(10)
                    .onTapGesture {openUrl(Resume.shared.phoneUrl)}
                
                Image(systemName: "envelope.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 34)
                    .foregroundColor(.white)
                    .padding(.horizontal, 7)
                    .padding(.vertical, 11)
                    .background(Color(red: 238/255, green: 121/255, blue: 66/255))
                    .cornerRadius(8)
                    .padding(10)
                
                
                ForEach(Resume.shared.socialMedia, id: \.name){ social in
                    Image(social.0)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50)
                        .padding(10)
                        .onTapGesture {
                            openUrl(social.1)
                        }
                }
            }
            Text("Cancel")
                .fontWeight(.semibold)
                .foregroundColor(Color(red: 139/255, green: 58/255, blue: 58/255, opacity: 1))
        }.padding()
         .background(RoundedRectangle(cornerRadius: 20)
            .foregroundColor(Color(red: 255/255, green: 231/255, blue: 186/255, opacity: 1))).padding()
         .onTapGesture { isShowing = false }
    }
    func openUrl(_ url: String){
        let url = URL(string: url)!
        //var 被改成 let
        if UIApplication.shared.canOpenURL(url){
            UIApplication.shared.open(url)
            //UIApplication 既然只能有一個，為什麼還會自動跑出來
            //此行為 Bool?
            return
        }
    }
    
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView(isShowing: Binding.constant(true))
        //待釐清觀念 Binding
            .background(.red)
    }
}
