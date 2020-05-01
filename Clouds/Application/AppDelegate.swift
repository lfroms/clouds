//
//  AppDelegate.swift
//  Clouds
//
//  Created by Lukas Romsicki on 2019-06-27.
//  Copyright © 2019 Lukas Romsicki. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if ProcessInfo.processInfo.arguments.contains("UI_TESTING") {
            let locationFavoritesService = LocationFavoritesService()

            locationFavoritesService.clearActiveLocation()
            locationFavoritesService.clearFavoriteLocations()
            locationFavoritesService.toggleFavorite(location: StoredLocation(
                name: "Montréal",
                regionName: "QC, Canada",
                coordinate: .init(latitude: 45.5017, longitude: -73.5673)
            ))

            locationFavoritesService.toggleFavorite(
                location: StoredLocation(
                    name: "Toronto",
                    regionName: "ON, Canada",
                    coordinate: .init(latitude: 43.6532, longitude: -79.3832)
                )
            )

            locationFavoritesService.toggleFavorite(
                location: StoredLocation(
                    name: "Vancouver",
                    regionName: "BC, Canada",
                    coordinate: .init(latitude: 49.2827, longitude: -123.1207)
                )
            )
        }

        return true
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}
