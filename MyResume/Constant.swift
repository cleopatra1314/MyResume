//
//  Constant.swift
//  MyResumeApp
//
//  Created by Jane Chao on 22/04/20.
//

import Foundation

typealias MyWebsite = (name: String, url: String)
typealias Experience = (title: String, company: String, start: String, end: String)
typealias Skill = (skillicon: String, skillname: String)
typealias Education = (degree: String, school: String, start: String, end: String)
typealias Work = (name: String, photo: String, content: String, url: String )

struct Resume {
    static let shared = Resume()
    let name     = "Angela Huang"
    let title    = "UIUX Designer"
    let location = "台北，台灣"
    let bio      = "尋找自我的路上，無懼挑戰，不斷追求自己，當前最重要的事就是成為 Ios Developer 💻 🙋🏻‍♀️"
    let myWebsite: [MyWebsite] = [("Fan Page", "https://www.instagram.com/cleopatra_taittoo/"), ("Portfolio", "https://www.huang-yuwen.com")]
    let education = [("M.F.A. FineArts", "National Taiwan Normal University", "2019", "Present (Suspension)"), ("B.A. Animal Science", "National Chiayi University", "2013", "2017")]
    //skills 為 tuple 的 array，開始用 for loop
    let skills: [Skill] = [ ("swiftIcon", "swift"), ("figmaIcon", "figma"), ("photoshopIcon","photoshop"), ("premiereIcon", "premiere")]
    let experiences: [Experience] = [("UIUX Desginer",
                                      "NTU",
                                      "2022 / 7 ",
                                      "Present"),
                                     ("Video Installation Artist/Tattoist (Owner)",
                                      "The Blue Tattoo",
                                      "2020 / 7 ",
                                      "2022 / 5 "),
                                     ("Tattoist",
                                      "Thorn Ink Tattoo",
                                      "2017 / 7 ",
                                      "2019 / 5 "),
                                     ("Art Administrator Intership",
                                      "Asia Art Center",
                                      "2016 / 8 ",
                                      "2016 / 12 "),
                                     ("Animal Protection Volunteer",
                                      "Goeco, Israel",
                                      "2015 / 7 ",
                                      "2015 / 9 "),
                                     ("Animal Farm Internship",
                                      "Maejo University, Faculty of Animal Science, Thailand",
                                      "2014 / 7",
                                      "2014 / 9"),
                                     ("Environmental Conservation Volunteer",
                                      "AIESEC, Egypt",
                                      "2013 / 7",
                                      "2013 / 9")]
    let worksAndProject = [("臺大課程網 redesign 專案", "1", "臺大課程網 redesign 專案：UIUX 設計。", "1"), ("UIUX Porfolio", "1", "my side project", "https://www.huang-yuwen.com"), ("NFT exhobition", "1", "my NFT", "1")]
    let phoneUrl = "tel://0912345678"
    let socialMedia: [(name: String, url: String)] = [("linkedin","https://www.linkedin.com/in/angelahuang4uiux/"),  ("facebook","https://www.facebook.com/profile.php?id=100000753682047"), ("line","https://line.me/ti/p/uNCOuA4nEz")]
}

