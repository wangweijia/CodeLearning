//
//  ViewController.swift
//  pushTest02
//
//  Created by apple on 23/09/2016.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        do{
            let data = try Data.init(contentsOf: URL.init(fileURLWithPath: "file:///var/mobile/Library/SpringBoard/PushStore/Attachments/com.eku001.EkuKangDA.pushTest02/07f14ba56dd601d3413061193b70827c5aa70945.png"))
            print(data)
            myImageView.image = UIImage.init(data: data)
        }catch{
            print("ttttttttttt")
        }
        
        let imageStr: String = "http://imgsrc.baidu.com/forum/pic/item/46d3e0bf6c81800ab4d5868db33533fa838b4788.jpg"
//        let data: Data? = Data.init(contentsOf: URL.init(fileURLWithPath: "http://imgsrc.baidu.com/forum/pic/item/46d3e0bf6c81800ab4d5868db33533fa838b4788.jpg"))
        
        
        
//        let url = URL.init(string: "http://imgsrc.baidu.com/forum/pic/item/46d3e0bf6c81800ab4d5868db33533fa838b4788.jpg")!
//        let data = NSData.init(contentsOf: url)
//        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//            print("000000")
//            print("data:::\(data)")
//            
//            self.myImageView.image = UIImage.init(data: data! as Data)
//        }
        
//        print("url::::\(url)")
//        print("data:::\(data)")
        
        self.imageGet2(imageUrlStr: imageStr)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.notificationAction), name: NSNotification.Name(rawValue: "myNotification"), object: nil)
    }
    
    func imageGet(imageUrl: String) -> Void {
        let imgURL = URL.init(string: imageUrl)
        let request = NSURLRequest.init(url: imgURL!)
        
    }
    
    func imageGet2(imageUrlStr: String) -> Void {
        DispatchQueue.global().async {
            let url = URL.init(string: imageUrlStr)!
            let data = NSData.init(contentsOf: url)
            
            DispatchQueue.main.async {
                self.myImageView.image = UIImage.init(data: data! as Data)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func notificationAction() -> Void {
        print("cccccccc")
    }


}

