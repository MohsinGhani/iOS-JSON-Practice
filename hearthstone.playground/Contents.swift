//
//  hearthstone.playground
//  iOS Networking
//
//  Created by Jarrod Parkes on 09/30/15.
//  Copyright (c) 2015 Udacity. All rights reserved.
//

import Foundation

/* Path for JSON files bundled with the Playground */
var pathForHearthstoneJSON = Bundle.main.path(forResource: "hearthstone", ofType: "json")

/* Raw JSON data (...simliar to the format you might receive from the network) */
var rawHearthstoneJSON = try? Data(contentsOf: URL(fileURLWithPath: pathForHearthstoneJSON!))

/* Error object */
var parsingHearthstoneError: NSError? = nil

/* Parse the data into usable form */
var parsedHearthstoneJSON = try! JSONSerialization.jsonObject(with: rawHearthstoneJSON!, options: .allowFragments) as! NSDictionary

func parseJSONAsDictionary(_ dictionary: NSDictionary) {
    let basic = dictionary["Basic"] as! [AnyObject]
    for item in basic {
        // these three properties are exist in all objects
        let id = item["id"] as! String
        let name = item["name"] as! String
        let type = item["type"] as! String
        print("ID : \(id)")
        print("NAME : \(name)")
        print("TYPE : \(type)")
        
        // if object have text then print else show message
        if let text = item["text"] as? String   {
            print("TEXT : \(text)")
        }else{
            print("This Object does not have any text property")
        }
        
        if let faction = item["faction"] as? String   {
            print("FACTIOON : \(faction)")
        }else{
            print("This Object does not have any faction property")
        }
        
        if let rarity = item["rarity"] as? String   {
            print("RARITY : \(rarity)")
        }else{
            print("This Object does not have any rarity property")
        }
        
        if let cost = item["cost"] as? Int {
            print("COST : \(cost)")
        }else{
            print("This Object does not have any cost property")
        }
        
        if let attack = item["attack"] as? Int {
            print("ATTACK : \(attack)")
        }else{
            print("This Object does not have any attack property")
        }
        
        if let health = item["health"] as? Int {
            print("HEALTH : \(health)")
        }else{
            print("This Object does not have any health property")
        }
        
        if let flavor = item["flavor"] as? String {
            print("FLAVOR : \(flavor)")
        }else{
            print("This Object does not have any flavor property")
        }
        
        if let artist = item["artist"] as? String {
            print("ARTIST : \(artist)")
        }else{
            print("This Object does not have any artist property")
        }
        
        if let collectible = item["collectible"] as? Bool {
            print("COLLECTIBLE : \(collectible)")
        }else{
            print("This Object does not have any collectible property")
        }
        
        if let howToGetGold = item["howToGetGold"] as? String {
            print("howToGetGold : \(howToGetGold)")
        }else{
            print("This Object does not have any howToGetGold property")
        }
        
        if let race = item["race"] as? String {
            print("RACE : \(race)")
        }else{
            print("This Object does not have any race property")
        }
        
        if let playerClass = item["playerClass"] as? String {
            print("playerClass : \(playerClass)")
        }else{
            print("This Object does not have any playerClass property")
        }
        
        if let mechanics = item["mechanics"] as? [String] {
            for item in mechanics{
                print("MACHANICS : \(item)")

            }
        }else{
            print("This Object does not have any mechanics property")
        }
        print()
    }
}

parseJSONAsDictionary(parsedHearthstoneJSON)
