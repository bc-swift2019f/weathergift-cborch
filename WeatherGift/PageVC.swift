//
//  PageVC.swift
//  WeatherGift
//
//  Created by Carter Borchetta on 10/10/19.
//  Copyright © 2019 Carter Borchetta. All rights reserved.
//

import UIKit

class PageVC: UIPageViewController {
    var currentPage = 0
    var locationsArray = ["Local City Weather", "Chestnut Hill, MA", "Sydney, Australia", "Accra, Ghana", "Uglich Russia"]

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self // Listens for special system events and passes them to the view controller
        dataSource = self
        setViewControllers([createDetailVC(forPage: 0)], direction: .forward, animated: false, completion: nil)
    }
    
    func createDetailVC(forPage page: Int) -> DetailVC {
        currentPage = min(max(0, page), locationsArray.count - 1)
        let detailVC = storyboard!.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC // Like creating a DetialVC object I think
        
        detailVC.locationsArray = locationsArray
        detailVC.currentPage = currentPage
        return detailVC
    }
    
}

extension PageVC: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let currentViewController = viewController as? DetailVC {// Can I create a new viewController from the one that is being passed in as the type DetialVC(make sure its DetailVC
            if currentViewController.currentPage < locationsArray.count - 1 { // See if swipe isn't the last page, then we can go one more
                return createDetailVC(forPage: currentViewController.currentPage + 1)
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let currentViewController = viewController as? DetailVC {
            if currentViewController.currentPage > 0 {
                return createDetailVC(forPage: currentViewController.currentPage - 1)
            }
        }
        return nil
    }

}
