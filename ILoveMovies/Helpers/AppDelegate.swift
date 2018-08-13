//
//  AppDelegate.swift
//  ILoveMovies
//
//

import UIKit
import RealmSwift

let realm = try! Realm()
let baseURL: String = "https://api.themoviedb.org/3/"
let baseImageURL: String = "https://image.tmdb.org/t/p/"
let apiKey: String = "6a05f2fcc8d696bbbbf1c5652b55aaac"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions
        launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //print(Realm.Configuration.defaultConfiguration.fileURL?.absoluteString)
        UINavigationBar.appearance().barTintColor = UIColor .primaryColor
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        return true
    }
    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }
}
