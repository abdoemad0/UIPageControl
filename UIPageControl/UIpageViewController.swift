//
//  UIpageViewController.swift
//  UIPageControl
//
//  Created by abdo emad  on 31/07/2023.
//

import UIKit

class UIpageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    

    
    var arrycontiners = [UIViewController]()
    var pagecontrol = UIPageControl()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let vc1 = self.storyboard?.instantiateViewController(withIdentifier: "page1")
//        let vc2 = self.storyboard?.instantiateViewController(withIdentifier: "page2")
//        let vc3 = self.storyboard?.instantiateViewController(withIdentifier: "page3")
//        arrycontiners.append(vc1!)
//        arrycontiners.append(vc2!)
//        arrycontiners.append(vc3!)
        
        let vc1 = self.storyboard?.instantiateViewController(withIdentifier: "page1") as! ViewController
        vc1.pageTitle = "first UI"
        vc1.pageDescription = "fuck you bitch"
        vc1.pageColor = UIColor.blue
        
        let vc2 = self.storyboard?.instantiateViewController(withIdentifier: "page1") as! ViewController
        vc2.pageTitle = "second UI"
        vc2.pageDescription = "fuck you asshole"
        vc2.pageColor = UIColor.yellow
        
        let vc3 = self.storyboard?.instantiateViewController(withIdentifier: "page1") as! ViewController
        vc3.pageTitle = "third UI"
        vc3.pageDescription = "fuck you whore"
        vc3.pageColor = UIColor.green
        
        arrycontiners.append(vc1)
        arrycontiners.append(vc2)
        arrycontiners.append(vc3)

        
        
        
        delegate = self
        dataSource = self
        
        if let firstVc = arrycontiners.first {
            setViewControllers([firstVc], direction: .forward, animated: true, completion: nil)
        }
        
        addpagecontrl()



    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
//        guard let currntindex = arrycontiners.firstIndex(of: viewController) else{
//            return nil
//        }
//
//        let prviesindex = currntindex - 1
//
//        guard prviesindex >= 0 else {
////            return arrycontiners.last
//            return nil
//        }
//
//        return arrycontiners[prviesindex]
//    }
        guard let currntindex = arrycontiners.firstIndex(of: viewController) else{
            return nil
        }
        
        let afterindex = currntindex + 1
        
        guard afterindex < arrycontiners.count else{
//            return arrycontiners.first
            return nil
        }
        
        return arrycontiners[afterindex]

    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
//        guard let currntindex = arrycontiners.firstIndex(of: viewController) else{
//            return nil
//        }
//
//        let afterindex = currntindex + 1
//
//        guard afterindex < arrycontiners.count else{
////            return arrycontiners.first
//            return nil
//        }
//
//        return arrycontiners[afterindex]
//
//    }
        guard let currntindex = arrycontiners.firstIndex(of: viewController) else{
            return nil
        }
        
        let prviesindex = currntindex - 1
        
        guard prviesindex >= 0 else {
//            return arrycontiners.last
            return nil
        }
        
        return arrycontiners[prviesindex]
    }
    
    func addpagecontrl(){
        pagecontrol = UIPageControl(frame: CGRect(x: 10,y: UIScreen.main.bounds.maxY - 75, width: UIScreen.main.bounds.width, height : 50))
        self.pagecontrol.numberOfPages = arrycontiners.count
//        self.pagecontrol.currentPage = 0
        self.pagecontrol.currentPage = arrycontiners.count - 1
        self.pagecontrol.tintColor = UIColor.white
        self.pagecontrol.pageIndicatorTintColor = UIColor.gray
        self.pagecontrol.currentPageIndicatorTintColor = UIColor.white
        self.view.addSubview(pagecontrol)
    }
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pagecontentViewcontroller = pageViewController.viewControllers![0]
//        self.pagecontrol.currentPage = arrycontiners.firstIndex(of: pagecontentViewcontroller)!
        self.pagecontrol.currentPage = (arrycontiners.count - 1 ) - arrycontiners.firstIndex(of: pagecontentViewcontroller)!

    
    }
}
