//
//  ViewControllerPopup.swift
//  Tic Tac Switch
//
//  Created by Rogelio Schevenin on 2/4/19.
//  Copyright © 2019 SDO. All rights reserved.
//

import Foundation
import UIKit

class ViewControllerPopup: UIViewController {
    
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var settingsBackground: UIImageView!
    
    @IBAction func dismissSettings(_ sender: Any){
        dismiss(animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
}
