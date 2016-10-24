//
//  NotificationViewController.swift
//  MyPushTest
//
//  Created by apple on 23/09/2016.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {

    @IBOutlet var label: UILabel?
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var label2: UILabel!
    
    @IBOutlet weak var myButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any required interface initialization here.
    }
    
    func didReceive(_ notification: UNNotification) {
        let content = notification.request.content
        
        let imageFileUrl = content.attachments[0].url.absoluteString
        print(imageFileUrl)
        
////        let data = NSData.init(contentsOf: content.attachments[0].url)
//        do{
////            http://imgsrc.baidu.com/forum/pic/item/46d3e0bf6c81800ab4d5868db33533fa838b4788.jpg
//            let data = try Data.init(contentsOf: URL.init(fileURLWithPath: "http://imgsrc.baidu.com/forum/pic/item/46d3e0bf6c81800ab4d5868db33533fa838b4788.jpg"))
//            print("data:::\(data)")
//            self.iconImageView.image = UIImage.init(data: data)
//        }catch{
//            print("")
//        }
        
//        self.imageGet2(imageUrlStr: "http://imgsrc.baidu.com/forum/pic/item/46d3e0bf6c81800ab4d5868db33533fa838b4788.jpg")
//        self.imageGet1(url: content.attachments[0].url)
        let path = Bundle.main.path(forResource: "test", ofType: "png")
        let data = NSData.init(contentsOfFile: path!)
        
        self.iconImageView.image = UIImage.init(data: data as! Data)
        self.label?.text = content.body
        self.label1.text = content.title
        self.label2.text = content.subtitle
    }
    
    func imageGet2(imageUrlStr: String) -> Void {
        DispatchQueue.global().async {
            let url = URL.init(string: imageUrlStr)!
            let data = NSData.init(contentsOf: url)
            
            DispatchQueue.main.async {
                self.iconImageView.image = UIImage.init(data: data! as Data)
            }
        }
    }
    
    func imageGet1(url: URL) -> Void {
        DispatchQueue.global().async {
            let data = NSData.init(contentsOf: url)
            
            DispatchQueue.main.async {
                self.iconImageView.image = UIImage.init(data: data! as Data)
            }
        }
    }

    
    func didReceive(_ response: UNNotificationResponse, completionHandler completion: @escaping (UNNotificationContentExtensionResponseOption) -> Void) {
        completion(.doNotDismiss)
        
        NotificationCenter.default.post(name: <#T##NSNotification.Name#>, object: <#T##Any?#>)
    }
    
    func customFunc() -> Void {
        print("aaa")
    }
}
