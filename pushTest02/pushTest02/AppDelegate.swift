//
//  AppDelegate.swift
//  pushTest02
//
//  Created by apple on 23/09/2016.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.regisetNotification(application: application)
        
        
        
        return true
    }
    
    func regisetNotification(application: UIApplication) -> Void {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert,.badge,.sound]) { (granted, error) in
            if granted {
                center.delegate = self
                self.myUserNotification()
                print("注册成功")
            }else{
                print("注册失败")
            }
        }
        
        application.registerForRemoteNotifications()
    }
    
    func myUserNotification() -> Void {
        
//        let action = UNTextInputNotificationAction.init(identifier: "action", title: "回复", options: UNNotificationActionOptions.authenticationRequired, textInputButtonTitle: "活动", textInputPlaceholder: "请输入回复内容")
        let action2 = UNTextInputNotificationAction.init(identifier: "action2", title: "222", options: [.foreground])
        let action3 = UNNotificationAction.init(identifier: "action3", title: "3333", options: [.destructive])
        let action4 = UNNotificationAction.init(identifier: "action4", title: "4444", options: [.authenticationRequired])
        let category = UNNotificationCategory.init(identifier: "customMyNotificationCategory", actions: [action2, action3, action4], intentIdentifiers: [], options: UNNotificationCategoryOptions.allowInCarPlay)
        
        let content: UNMutableNotificationContent = UNMutableNotificationContent.init()
        content.badge = 1
        
        do{
            let imageUrl = URL.init(fileURLWithPath: Bundle.main.path(forResource: "test", ofType: "png")!)
            let attach = try UNNotificationAttachment.init(identifier: "imageAttach", url: imageUrl, options: nil)
            content.attachments = [attach]
        }catch{
            print("error")
        }
        
        content.body = "这是iOS10的新通知内容：普通的iOS通知"
        content.sound = UNNotificationSound.default()
        content.subtitle = "这里是副标题"
        content.title = "这里是通知的标题"
        content.categoryIdentifier = "customMyNotificationCategory"
        content.launchImageName = "lun"
        
        let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: 10, repeats: false)
        let request = UNNotificationRequest.init(identifier: "NotificationDefault", content: content, trigger: trigger)
        UNUserNotificationCenter.current().setNotificationCategories(NSSet.init(object: category) as! Set<UNNotificationCategory>)
        UNUserNotificationCenter.current().add(request) { (error) in
            
        }
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

    /// 获取 Device Token
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
        
        let characterSet :CharacterSet = CharacterSet(charactersIn: "<>")
        let nsdataStr = NSData.init(data: deviceToken)
        let deviceStr = nsdataStr.description.trimmingCharacters(in: characterSet).replacingOccurrences(of: " ", with: "")
        
        print(deviceStr)
    }
    
    ///获取 Device Token 失败
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print(error)
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Swift.Void) {
        let userInfo: Dictionary = notification.request.content.userInfo
        let request: UNNotificationRequest = notification.request
        let content: UNNotificationContent = request.content
        let badge: NSNumber = content.badge!
        let body: String = content.body
        let sound: UNNotificationSound = content.sound!
        let subtitle: String = content.subtitle
        let title: String = content.title
        print("前台 收到推送")
        
        completionHandler(.sound)
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Swift.Void) {
        let userInfo: Dictionary = response.notification.request.content.userInfo
        let request: UNNotificationRequest = response.notification.request
        let content: UNNotificationContent = request.content
        let badge: NSNumber = content.badge!
        let body: String = content.body
        let sound: UNNotificationSound = content.sound!
        let subtitle: String = content.subtitle
        let title: String = content.title
        print("后台 推送点击")
    }
}

