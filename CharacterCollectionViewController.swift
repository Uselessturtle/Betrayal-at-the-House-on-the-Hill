//
//  CharacterCollectionViewController.swift
//  Betrayal at the House on the Hill
//
//  Created by Sam Foster on 6/8/15.
//  Copyright (c) 2015 Sam Foster. All rights reserved.
//

import UIKit

class CharacterCollectionViewController: UICollectionViewController {
        
        private let reuseIdentifier = "CharacterCell"
        private let sectionInsets = UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0)
        
        var charactersArray = ["Ox Bellows", "Darrin \"Flash\" Williams", "Peter Akimoto", "Brandon Jaspers", "Father Rhinehardt", "Professor Longfellow", "Missy Dubourde", "Zoe Ingstrom", "Vivian Lopez", "Madame Zostra", "Jenny LeClerc", "Heather Granville"]
    }

extension CharacterCollectionViewController : UICollectionViewDataSource {
    // 1
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // 2
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return charactersArray.count
    }
    
    // 3
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as CharacterCollectionViewCell

        cell.backgroundColor = themeColor
        // Configure the cell
        cell.characterName.text = charactersArray[indexPath.row]
        return cell
    }
}

extension CharacterCollectionViewController : UICollectionViewDelegateFlowLayout {
    //1
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
            
        let screenSize: CGRect = UIScreen.mainScreen().bounds
            
        return CGSize(width: screenSize.width/2 - 10, height: 50)
    }
    
    //3
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAtIndex section: Int) -> UIEdgeInsets {
            return sectionInsets
    }
}