//
//  ViewController.swift
//  Betrayal at the House on the Hill
//
//  Created by Sam Foster on 6/6/15.
//  Copyright (c) 2015 Sam Foster. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK:
    
    let firstCharactersArray = ["Ox Bellows", "Peter Akimoto", "Father Rhinehardt", "Missy Dubourde", "Vivian Lopez", "Jenny LeClerc"]
    let secondCharacterArray = [ "Darrin \"Flash\" Williams", "Brandon Jaspers", "Professor Longfellow",  "Zoe Ingstrom", "Madame Zostra", "Heather Granville"]
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.firstCharactersArray.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell")
        
        cell.textLabel.text = firstCharactersArray[indexPath.row]
        // cell.detailTextLabel!.text = characters[indexPath.row][1]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let row = indexPath.row
        println(row)
        // println(characters[row])
    }
}

