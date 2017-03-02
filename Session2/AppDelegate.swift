//
//  AppDelegate.swift
//  Session2
//
//  Created by Admin on 3/3/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        var songs:[[String:String]] = [
            [
                "Name":"Something just like that",
                "Album":"Something Device",
                "Singer":"The Chainsmokers",
                "Years":"2017"],
            [
                "Name":"Shape Of You",
                "Album":"Divine",
                "Singer":"Ed Sheeran",
                "Years":"2016"],
            [
                "Name":"Hello",
                "Album":"Hello",
                "Singer":"Adele",
                "Years":"2015"],
            [
                "Name":"That's Was I Like",
                "Album":"Blue",
                "Singer":"Blue",
                "Years":"2017"],
            [
                "Name":"Paris",
                "Album":"Something Device",
                "Singer":"The Chainsmokers",
                "Years":"2016"]
        ]
        
        let dict1 = [
            "Name":"Me me me",
            "Album":"Something Device",
            "Singer":"The Chainsmokers",
            "Years":"2017"]
        let remove = "Paris"
        
        
        print("Remove Dictionary By Name")
        songs = removeDictbyName(ArraySong: songs, name:remove) as! [[String : String]]
        listDic(songs1: songs)
        print("Add Dictionary")
        songs =  addDict(ArraySong: songs, dict: dict1) as! [[String : String]]
        listDic(songs1: songs)
        print("Update Name of Dictionary")
        songs =  updateName(ArraySong: songs, name: "Me me me") as! [[String : String]]
        listDic(songs1: songs)
        print("Update Album of Dictionary")
        songs = updateAlbum(ArraySong: songs, album: "Something Device") as! [[String : String]]
        listDic(songs1: songs)
        print("Remove Item Dictionary By Name")
        songs = removeItemByName(ArraySong: songs, valueName:"2015") as! [[String : String]]
        listDic(songs1: songs)
        return true
    }
    
    func addDict(ArraySong:[[String:String]],dict:[String:String])->Array<Any>{
        var s = ArraySong
        s.append(dict)
        return s
    }
    
    func listDic(songs1:[[String:String]]){
        let n = songs1.count
        print("Index of Dictionary")
        for i in 0...n-1{
            for (key,value) in songs1[i] {
                print("\(key)  : \(value)")
                
            }
            print("====================")
        }
    }
    
    func removeDictbyName(ArraySong:[[String:String]],name:String)->Array<Any>{
        var songs = ArraySong
        let n = songs.count
        for i in 0...n-1{
            for (_,value) in songs[i] {
                if (value==name){
                    songs.remove(at: i)
                    break
                }            }
            
        }
        
        return songs
    }
    func updateName(ArraySong:[[String:String]],name:String)->Array<Any>{
        var songs = ArraySong
        let n = songs.count
        for i in 0...n-1{
            for (key,value) in songs[i] {
                if (value==name){
                    songs[i].updateValue("Me Me Me", forKey: key)
                    
                }            }
            
        }
        
        return songs
    }
    func updateAlbum(ArraySong:[[String:String]],album:String)->Array<Any>{
        var songs = ArraySong
        let n = songs.count
        for i in 0...n-1{
            for (key,value) in songs[i] {
                if (value==album){
                    songs[i].updateValue("Destiny", forKey: key)
                    
                }            }
            
        }
        
        return songs
    }
    func removeItemByName(ArraySong:[[String:String]],valueName:String)->Array<Any>{
        var songs = ArraySong
        let n = songs.count
        for i in 0...n-1{
            for (key,value) in songs[i] {
                if (value==valueName){
                    songs[i].removeValue(forKey: key)
                    
                }            }
            
        }
        
        return songs
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

