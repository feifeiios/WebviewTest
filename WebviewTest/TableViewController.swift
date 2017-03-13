//
//  TableViewController.swift
//  WebviewTest
//
//  Created by Zzcz on 2017/3/13.
//  Copyright © 2017年 fly. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var dataArray : [TableViewModel] {
        let m1 = TableViewModel.init(dict: ["title":"淘宝","urlString":"https://www.taobao.com/"])
        let m2 = TableViewModel.init(dict: ["title":"百度","urlString":"https://www.baidu.com/index.php?tn=monline_3_dg"])
        let m3 = TableViewModel.init(dict: ["title":" 苹果","urlString":"https://www.apple.com"])
        //"https://www.apple.com"
        
        return [m1,m2,m3]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        tableView.registerNib(UINib.init(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCellID")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = falseTableViewCellID

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TableViewCellID", forIndexPath: indexPath) as! TableViewCell
        cell.model = dataArray[indexPath.row]
        return cell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let model = dataArray[indexPath.row]

        
        switch indexPath.row {
        case 0:
            let storyboard = UIStoryboard.init(name: "Main", bundle: NSBundle.mainBundle())
            let vc = storyboard.instantiateViewControllerWithIdentifier("ViewControllerID") as! ViewController
            
            vc.urlstring = model.urlString
            self.navigationController?.pushViewController(vc, animated: false)

            break
        case 1:
//            let vc = WKWebViewController()
//            vc.urlString = model.urlString
//            self.navigationController?.pushViewController(vc, animated: false)
//            
            
            break
        case 2 :
            let vc = WKViewController()
            vc.urlString = model.urlString
            self.navigationController?.pushViewController(vc, animated: false)
            
            
            break
        default:
            break
        }
        

    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
