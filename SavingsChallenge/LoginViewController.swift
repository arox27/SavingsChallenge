//
//  LoginViewController.swift
//  SavingsChallenge
//
//  Created by Apurv Gandhi on 8/29/15.
//  Copyright (c) 2015 Apurv Gandhi. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if (FBSDKAccessToken.currentAccessToken() != nil)
        {
            let newView: AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("TabBarController");
            self.navigationController!.showViewController(newView as! UITabBarController, sender: newView);
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func loginButtonClicked(sender: UIButton)
    {
        var permissionsArray = ["email"];
        PFFacebookUtils.logInInBackgroundWithReadPermissions(permissionsArray, block: { (user, error) -> Void in
            if ((user) == nil) {
                println("Uh oh. The user cancelled the Facebook login.");
            } else {
                println("User logged in through Facebook!");
                let newView: AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("TabBarController");
                self.navigationController!.showViewController(newView as! UITabBarController, sender: newView);
            }
        });
    }
    
 
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
