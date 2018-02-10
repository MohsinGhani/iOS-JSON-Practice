//
//  achievements.playground
//  iOS Networking
//
//  Created by Jarrod Parkes on 09/30/15.
//  Copyright (c) 2015 Udacity. All rights reserved.
//

import Foundation

/* Path for JSON files bundled with the Playground */
var pathForAchievementsJSON = Bundle.main.path(forResource: "achievements", ofType: "json")

/* Raw JSON data (...simliar to the format you might receive from the network) */
var rawAchievementsJSON = try? Data(contentsOf: URL(fileURLWithPath: pathForAchievementsJSON!))

/* Error object */
var parsingAchivementsError: NSError? = nil

/* Parse the data into usable form */
var parsedAchievementsJSON = try! JSONSerialization.jsonObject(with: rawAchievementsJSON!, options: .allowFragments) as! NSDictionary

func parseJSONAsDictionary(_ dictionary: NSDictionary) {
    let achievements = dictionary["achievements"] as! [AnyObject]
    let categories = dictionary["categories"] as! [AnyObject]
    print("ACHIEVEMENTS ARRAY")
    for item in achievements {
        let title = item["title"] as! String
        let description = item["description"] as! String
        let achievementId = item["achievementId"] as! Int
        let categoryId = item["categoryId"] as! Int
        let points = item["points"] as! Int
        let icon = item["icon"] as AnyObject
            let x = icon["x"] as! Int
            let y = icon["y"] as! Int
            let w = icon["w"] as! Int
            let h = icon["h"] as! Int
            let offset = icon["offset"] as! Int
            let url = icon["url"] as! String
        
        print("TITLE: \(title)\nDESC : \(description) \nACHIEVEMENT ID : \(achievementId) \nCATEGORY ID : \(categoryId) \nPOINTS : \(points)")
        print("ICON: x :\(x), y :\(y), w :\(w), h :\(h), offset : \(offset), url : \(url)\n\n")
    }
    print("CATEGORIES ARRAY")
    for item in categories {
        let title = item["title"] as! String
        let categoryId = item["categoryId"] as! Int
        let featuredAchievementId = item["featuredAchievementId"] as! Int
        print("TITLE: \(title) \nCATEGORY ID: \(categoryId) \nfeaturedAchievementId: \(featuredAchievementId)")
        
        if let children = item["children"] as? [AnyObject]{
            for childItem in children {
                let title = childItem["title"] as! String
                let categoryId = childItem["categoryId"] as! Int
                let featuredAchievementId = childItem["featuredAchievementId"] as! Int
                print("CHILDREN TITLE: \(title) \nCHILDREN CATEGORY ID: \(categoryId) \nfCHILDREN eaturedAchievementId: \(featuredAchievementId)\n")
            }
        }else{
            print("This Object does not have Children Array")
        }
    }
}

parseJSONAsDictionary(parsedAchievementsJSON)
