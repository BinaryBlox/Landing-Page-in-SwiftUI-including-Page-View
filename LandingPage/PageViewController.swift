//
//  PageViewController.swift
//  LandingPage
//
//  Created by BLCKBIRDS on 14.07.19.
//  Copyright © 2019 BLCKBIRDS. All rights reserved.
//

import SwiftUI
import UIKit

struct PageViewController : UIViewControllerRepresentable {
    
    var controllers: [UIViewController]
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        
        pageViewController.dataSource = context.coordinator
        
        return pageViewController
    }
    
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            [controllers[0]], direction: .forward, animated: true)
    }
    
    class Coordinator: NSObject, UIPageViewControllerDataSource {
        var parent: PageViewController
        
        init(_ pageViewController: PageViewController) {
            self.parent = pageViewController
        }
        
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerBefore viewController: UIViewController) -> UIViewController?
        {
            guard let index = parent.controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index == 0 {
                return parent.controllers.last
            } else {
               return parent.controllers[index - 1]
            }
        }
        
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerAfter viewController: UIViewController) -> UIViewController?
        {
            guard let index = parent.controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index + 1 == parent.controllers.count {
                return parent.controllers.first
            } else {
                return parent.controllers[index + 1]
            }
        }
        
        
    }
    
}



//#if DEBUG
//struct PageViewController_Previews : PreviewProvider {
//    static var previews: some View {
//        PageViewController()
//    }
//}
//#endif
