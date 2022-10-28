//
//  ContentView.swift
//  MyResume
//
//  Created by 黃郁雯 on 2022/10/17.
//

import SwiftUI

struct ContentView: View {
    let me = Resume.shared
    @State var isShowContactView = false
    //無法直接修改 view 裡的屬性，所以要加 @State -> 表示此變數需要被拉出來另外做狀態管理，所以這個 view 並沒有被改變，他只是被儲存在另一個可以被改變的地方。
    
    var body: some View {
        ScrollView{
            VStack(spacing: 40){
                cardView
                
                VStack(spacing: 24){
                    Text(me.bio)
                        .foregroundColor(Color(red: 82/255, green: 54/255, blue: 40/255))
                    
                    myWebSiteView
                }
//                //第一種 button
//                Button("Contact Me"){
//
//                    }.font(.title3)
//                    .fontWeight(.medium)
//                    .foregroundColor(.white)
//                    .padding(.vertical, 8)
//                    .frame(maxWidth: .infinity)
//                    .background(RoundedRectangle(cornerRadius: 30).foregroundColor(Color(red: 176/255, green: 23/255, blue: 31/255, opacity: 1)))
                
                //第二種 button
                Button { isShowContactView = true } label:{ Text("Contact Me")
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(Color(red: 255/255, green: 239/255, blue: 213/255))
                        .padding(.vertical, 8)
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 30).foregroundColor(Color(red: 139/255, green: 58/255, blue: 58/255, opacity: 1)))
                }
                
                
//                //第三種 button
//                Text("Contact Me")
//                    .font(.title3)
//                    .fontWeight(.medium)
//                    .foregroundColor(.white)
//                    .padding(.vertical, 8)
//                    .frame(maxWidth: .infinity)
//                //btn 顏色這行要再精簡
//                    .background(RoundedRectangle(cornerRadius: 30)
//                        .foregroundColor(Color(red: 176/255, green: 23/255, blue: 31/255, opacity: 1)))
//                //.foregroundColor(UIColor(red: 176/255, green: 23/255, blue: 31/255, alpha: 0.5)))
//                    .onTapGesture {}
                
                    Text("Skills")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color(red: 82/255, green: 54/255, blue: 40/255))
                    skillView
                
                    Text("Career Summary")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color(red: 82/255, green: 54/255, blue: 40/255))
                    careerView
                    
                    Text("Education")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color(red: 82/255, green: 54/255, blue: 40/255))
                    educationView
                    
                }.padding()
                 .lineSpacing(4)
                 .overlay(Color.black.opacity(isShowContactView ? 0.6 : 0))
                 .onTapGesture {isShowContactView = false}
                 .overlay(alignment: .top) {
                     Group{
                         if isShowContactView{
                             ContactView(isShowing: $isShowContactView)
                             .offset(y: UIScreen.main.bounds.maxY * 0.31)
                             .transition(.slide)
                         }
                     }
                     //value 意思？
                     //overlay closure 裏面需要的回傳值是個 view，用 group 假裝
                 }.animation(.spring(), value: isShowContactView)
                 
        }.background(Color(red: 253/255, green: 245/255, blue: 230/255))
            //.background(Color(uiColor: .secondarySystemBackground))
        }
    var cardView: some View{
        HStack{
            Image("myProfilePic")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(200)
                .frame(width: 160)
            VStack(spacing: 6){
                Text(me.name)
                    .foregroundColor(Color(red: 82/255, green: 54/255, blue: 40/255))
                    .padding(16)
                    .font(.title2).bold()
                Text(me.title)
                    .foregroundColor(Color(red: 82/255, green: 54/255, blue: 40/255))
                //可以直接用label結合
                HStack{
                    Image(systemName: "location.fill")
                    Text(me.location)
                }.foregroundColor(.secondary)
            }
        }
    }
    var myWebSiteView: some View{
        HStack(spacing: 16){
            let myWeb = me.myWebsite
            HStack{
                //let url = URL(string: myWeb.1)!
                Image(myWeb[0].0.lowercased())
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 32)
                
                Text(myWeb[0].0)
                    .underline()
                    .foregroundColor(Color(red: 82/255, green: 54/255, blue: 40/255))
                    .fontWeight(.semibold)
            }.onTapGesture {
                UIApplication.shared.open(URL(string: myWeb[0].1)!)
            }
            
            HStack{
                Image(systemName: "command.square")
                    .resizable()
                    .background(Color(red: 255/255, green: 211/255, blue: 155/255).cornerRadius(8))
                    .background(Color(red: 255/255, green: 193/255, blue: 193/255).cornerRadius(8))
                    .frame(width: 32)
                    //藕紅色.foregroundColor(Color(red: 205/255, green: 92/255, blue: 92/255, opacity: 1))
                    .foregroundColor(Color(red: 139/255, green: 101/255, blue: 139/255, opacity: 1))
                    
                
                Text(myWeb[1].0)
                    .underline()
                    .foregroundColor(Color(red: 82/255, green: 54/255, blue: 40/255))
                    .fontWeight(.semibold)
            }.onTapGesture {
                UIApplication.shared.open(URL(string: myWeb[1].1)!)
            }
//                    ForEach(me.myWebsite, id: \.name){ myWeb in
//                        HStack{
//                            Image(myWeb.0.lowercased())
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
//                                .frame(width: 32)
//
//                            let url = URL(string: myWeb.1)!
//                            Text(myWeb.0)
//                                .underline()
//                                .bold()
//                                .foregroundColor(Color(red: 82/255, green: 54/255, blue: 40/255))
//                                .onTapGesture {
//                                    UIApplication.shared.open(url)
//                        }
//                        }
//                    }
        }.frame(maxWidth: .infinity, alignment: .trailing)
    }
    var skillView: some View{
        HStack(spacing: 4){
            //                    VStack{
            //                        Image("swiftIcon")
            //                            .resizable()
            //                            .aspectRatio(contentMode: .fit)
            //                            .frame(width: 50)
            //                        Text("Swift")
            //                    }.frame(width: 72)
            //                    VStack{
            //                        Image("figmaIcon")
            //                            .resizable()
            //                            .aspectRatio(contentMode: .fit)
            //                            .frame(width: 50)
            //                            .cornerRadius(16)
            //                        Text("Figma")
            //                    }.frame(width: 84)
            //                    VStack{
            //                        Image("photoshopIcon")
            //                            .resizable()
            //                            .aspectRatio(contentMode: .fit)
            //                            .frame(width: 50)
            //                        Text("Photoshop")
            //                    }.frame(width: 84)
            //                    VStack{
            //                        Image("premiereIcon")
            //                            .resizable()
            //                            .aspectRatio(contentMode: .fit)
            //                            .frame(width: 50)
            //                        Text("Premiere")
            
            //let skill = me.skills.first!
            //要使用 ForEach 迴圈，並用keypath \.0 來存取 id，id 要是 hashable
            ForEach(me.skills, id: \.skillicon) { skill in
                VStack{
                    Image(skill.skillicon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50)
                    Text(skill.skillname)
                        .foregroundColor(Color(red: 82/255, green: 54/255, blue: 40/255))
                }.frame(width: 84)
            }
        }
        
    }
    var careerView: some View{
        VStack(spacing: 0){
            ForEach(me.experiences.indices, id: \.self) { index in
                HStack{
                    DotLineShape(dotSize: 10, lineWidth: 2.5, style: index == 0 ? .buttomHalf : index == (me.experiences.count - 1) ? .topHalf : .full)
                        .frame(width: 60)
                        //.foregroundColor(.secondary)
                        .foregroundColor(Color(red: 205/255, green: 155/255, blue: 155/255))
                    
//                                Circle()
//                                    .frame(width: 10)
//                                    .background(.blue)
//                                Rectangle().frame(width: 5)
                    //exp is let? or var?
                    let exp = me.experiences[index]
                    
                    VStack(spacing: 4){
                        Group{
                            Text(exp.title)
                                .bold()
                            Text(exp.company)
                            Text("\(exp.start) - \(exp.end)")
                                .foregroundColor(.secondary)
                                .padding(.bottom, 32)
                        }.frame(maxWidth: .infinity, alignment: .leading)
                         .foregroundColor(Color(red: 82/255, green: 54/255, blue: 40/255))
                    }
                }
            }
        }
    }
    var educationView: some View{
        VStack(spacing: 8){
            ForEach(me.education, id: \.0){ edu in
                VStack(spacing: 4){
                    Group{
                        Text(edu.0)
                            .bold()
                        Text(edu.1)
                        Text("\(edu.2) - \(edu.3)")
                            .foregroundColor(.secondary)
                            .padding(.bottom, 24)
                    }.frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 24)
                        .foregroundColor(Color(red: 82/255, green: 54/255, blue: 40/255))
                }
            }
        }
    }
    
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

