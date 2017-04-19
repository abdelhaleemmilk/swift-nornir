//
//  Browser.swift
//  Ubiquity
//
//  Created by sagesse on 16/03/2017.
//  Copyright © 2017 SAGESSE. All rights reserved.
//

import UIKit

///
/// a media browser
///
public class Browser: NSObject, Container {
    
    public var viewController: UIViewController {
        return BrowserListController(container: self)
    }
    
    public var numberOfSections: Int {
        return 2
    }
    public func numberOfItems(inSection section: Int) -> Int {
        return items.count
    }
    public func item(at indexPath: IndexPath) -> Item {
        return items[indexPath.item]
    }
    
    public var items: Array<Item> =  (0 ..< 120).map { BrowserItem($0) }
    
}

internal class BrowserItem: Item {
    
    init(_ index: Int) {
        
//        if (index == -1) {
//            size = .init(width: 1600, height: 1200)
//            image = __image1
//            size = .init(width: 3200, height: 1200)//8:3
//            image = __image12
//        } else {
            size = .init(width: 640, height: 1136)
//            image = UIImage(named: "cl_\((index % 12) + 1)")
//        }
    }
    
    var size: CGSize
    
    var image: UIImage?
}
fileprivate var __image1 = UIImage(named: "t1")
fileprivate var __image2 = UIImage(named: "t2")

///
/// data fetch & update
///
public extension Browser {
    
    public weak var dataSource: AnyObject? {
        set { return }
        get { return nil }
    }
    public weak var delegate: AnyObject? {
        set { return }
        get { return nil }
    }
    
    public func register(_ cls1: AnyClass, _ cls2: AnyClass) {
    }
    public func reloadData() {
    }
    
    public func insertItems(at indexPaths: Array<IndexPath>) {
    }
    public func reloadItems(at indexPaths: Array<IndexPath>) {
    }
    public func deleteItems(at indexPaths: Array<IndexPath>) {
    }
}

///
/// transition display support
///
public extension Browser {
    weak var transitioningDelegate: AnyObject? {
        set { return }
        get { return nil }
    }
}



//public class Ubiquity: BrowseDataSource, BrowseDelegate {
//    
//    public func numberOfSections(in browser: Any) -> Int {
//        return 1
//    }
//    public func browser(_ browser: Any, numberOfItemsInSection section: Int) -> Int {
//        return _assets.count
//    }
//    public func browser(_ browser: Any, assetForItemAt indexPath: IndexPath) -> Browseable {
//        return _assets[indexPath.item]
//    }
//    
//    lazy var _assets:[Browseable] = {
//        return (0 ..< 2800).map{ _ in
//            return LocalImageAsset()
//        }
//    }()
//    
//    static let displayQueue = DispatchQueue(label: "Ubiquity.Display.Queue")
//}
//
//public protocol BrowseDelegate: class {
//}
//
//public protocol BrowseDataSource: class {
//    
//    func numberOfSections(in browser: Any) -> Int 
//    
//    func browser(_ browser: Any, numberOfItemsInSection section: Int) -> Int
//    
//    func browser(_ browser: Any, assetForItemAt indexPath: IndexPath) -> Browseable 
//}

//let browser = Browser()
//
//browser.register(UIView.self, UIView.self)
//browser.dataSource = nil
//browser.delegate = nil
//
//browser.reloadData()
//browser.insertItems(at: [])
//browser.reloadItems(at: [])
//browser.deleteItems(at: [])
//
//browser.transitioningDelegate = nil
//UIViewController().show(browser, sender: indexPath)

// some default configure
internal extension Browser {
    
    static var ub_backgroundColor: UIColor? {
        return UIColor(white: 0.94, alpha: 1)
    }
    
}
