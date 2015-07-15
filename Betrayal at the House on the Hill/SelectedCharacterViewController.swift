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
    
    @IBOutlet weak var selectedCharacterMight: UILabel!
    
    @IBOutlet weak var mightCounter: UISegmentedControl!
    
    var catcher: CharacterCollectionViewController.Character = CharacterCollectionViewController.Character(name: "", might: [], speed: [], knowledge: [], sanity: [])
    
    override func viewDidLoad() {
        self.selectedCharacterName.text = catcher.name
        
        for index in 0...8 {
            mightCounter.setTitle(catcher.might[index] as String, forSegmentAtIndex: index)
        }
    }
}
