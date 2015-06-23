//
//  SelectedCharacterViewController.swift
//  Betrayal at the House on the Hill
//
//  Created by Sam Foster on 6/23/15.
//  Copyright (c) 2015 Sam Foster. All rights reserved.
//

import UIKit

class SelectedCharacterViewController: UIViewController {
    @IBOutlet weak var selectedCharacterName: UILabel!
    
    var catcher: String = ""
    
    override func viewDidLoad() {
        self.selectedCharacterName.text = catcher
    }
    
}
