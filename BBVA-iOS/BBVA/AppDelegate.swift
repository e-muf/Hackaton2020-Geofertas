//
//  AppDelegate.swift
//  BBVA
//
//  Created by Samuel Arturo Garrido Sánchez on 2020-10-06.
//  Copyright © 2020 SamArtGS. All rights reserved.

import UIKit
import CoreData
import GoogleMaps
import UserNotifications
import GooglePlaces

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,UNUserNotificationCenterDelegate{
    
    /*
     
     En un futuro que tengamos cuenta de desarrollo, tener push notifications para apps estando inactivas
     */
    func registerForPushNotifications() {
            UNUserNotificationCenter.current()
                .requestAuthorization(options: [.alert, .sound, .badge]) {(granted, error) in
                    print("Permission granted: \(granted)")
            }
    }


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        registerForPushNotifications()
        
        
        UNUserNotificationCenter.current().requestAuthorization(options:
        [.badge,.alert,.sound])
          {
              (sucess,error) in
              if error != nil {
                  print("Error Found, \(error?.localizedDescription ?? "")")

              } else {
                  print("Authorized by the user")
              }
          }

          UNUserNotificationCenter.current().delegate = self
        //Diseño color TabBar y agregar elementos
        
        GMSServices.provideAPIKey("AIzaSyBn4Uga7u3Ae37I8Ll9u3sVbEsnjZYKtQQ")
        GMSPlacesClient.provideAPIKey("AIzaSyBn4Uga7u3Ae37I8Ll9u3sVbEsnjZYKtQQ")
        //Color de la barra
        UITabBar.appearance().barTintColor = UIColor(red: 9/255.0, green: 40/255.0, blue: 75/255.0, alpha: 1.0)
        
        //Tinta del elemento seleccionado
        UITabBar.appearance().tintColor = .white
        
        
        //Tinta del eleento no seleccionado
        UITabBar.appearance().unselectedItemTintColor = UIColor(red: 191/255.0, green: 199/255.0, blue: 208/255.0, alpha: 1.0)
        
        //Navbar
        
        UINavigationBar.appearance().backgroundColor = UIColor(red: 9/255.0, green: 40/255.0, blue: 75/255.0, alpha: 1.0)
        UINavigationBar.appearance().alpha = 1.0
    
        
        

        
        return true
    }
    
    
    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "BBVA")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    
    
    
}

