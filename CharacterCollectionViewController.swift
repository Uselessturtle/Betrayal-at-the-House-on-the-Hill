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
    
        var selectedCharacter: String = "Corn"
    
    
    
    // Cell Selection
    //1
    var selectedCharacterIndexPath : NSIndexPath? {
        didSet {
            //2
            var indexPaths = [NSIndexPath]()
            if selectedCharacterIndexPath != nil {
                indexPaths.append(selectedCharacterIndexPath!)
            }
            if oldValue != nil {
                indexPaths.append(oldValue!)
            }
            //3
            collectionView!.performBatchUpdates({
                self.collectionView!.reloadItemsAtIndexPaths(indexPaths)
                return
                }){
                    completed in
                    //4
                    if self.selectedCharacterIndexPath != nil {
                       let cell =  self.collectionView!.cellForItemAtIndexPath(self.selectedCharacterIndexPath!)
                        
                        cell?.backgroundColor = UIColor.blueColor()
                        let lbl = cell?.viewWithTag(100) as? UILabel
                        lbl?.textColor = UIColor.whiteColor()
                        
                        if lbl != nil {
                            self.selectedCharacter = lbl!.text!
                        }
                        
                        self.performSegueWithIdentifier("characterSeque", sender: self)
                    }
            }
        }
    }
    
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
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CharacterCollectionViewCell

        cell.backgroundColor = UIColor.whiteColor()
        cell.contentView.layer.borderColor = (UIColor.blueColor()).CGColor
        cell.contentView.layer.borderWidth = 2.0
        // Configure the cell
        let lbl = cell.viewWithTag(100) as? UILabel
        lbl?.textColor = UIColor.blueColor()
        cell.characterName.text = charactersArray[indexPath.row]
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
            //1
            switch kind {
                //2
            case UICollectionElementKindSectionHeader:
                //3
                let headerView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "CharacterHeaderView", forIndexPath: indexPath) as! CharacterHeaderCollectionReusableView
                headerView.label.text = "Choose Your Hero"
                return headerView
            default:
                //4
                assert(false, "Unexpected element kind")
            }
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

extension CharacterCollectionViewController : UICollectionViewDelegate {
    
    override func collectionView(collectionView: UICollectionView,
        shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
            if selectedCharacterIndexPath == indexPath {
                selectedCharacterIndexPath = nil
            }
            else {
                selectedCharacterIndexPath = indexPath
            }
            return false
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "characterSeque" {
            let svc = segue.destinationViewController as! SelectedCharacterViewController
            svc.catcher = selectedCharacter
        }
    }
}