//
//  Extensions.swift
//  ResponsiveUI Learning Project
//
//  Created by Simbarashe Dombodzvuku on 6/21/22.
//

import Foundation
import SwiftUI

//MARK: Displaying sidebar always, mimicking iPad settings app

extension UISplitViewController {
    open override func viewDidLoad() {
        self.preferredDisplayMode = .twoOverSecondary
        self.preferredSplitBehavior = .displace
        
        //updating primary view column fraction
        self.preferredPrimaryColumnWidthFraction = 0.3
        
        //Updating dynamically with the help of NotificationCenter calls
        NotificationCenter.default.addObserver(self, selector: #selector(UpdateView(notification:)), name: NSNotification.Name("UPDATEFRACTION"), object: nil)
        
    }
    
    @objc
    func UpdateView(notification: Notification) {
        if let info = notification.userInfo, let fraction = info["fraction"] as? Double {
            self.preferredPrimaryColumnWidthFraction = fraction
        }
    }
}
