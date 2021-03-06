//
//  UsersTableViewController.swift
//  BLEChat
//
//  Created by Ankush Agrawal on 10/5/14.
//  Copyright (c) 2014 AnkushAgrawal. All rights reserved.
//


import UIKit
import MultipeerConnectivity

class UsersTableViewController: UITableViewController, MCBrowserViewControllerDelegate, UITextFieldDelegate, MCNearbyServiceBrowserDelegate, MCSessionDelegate, MCNearbyServiceAdvertiserDelegate  {
    
    var displayName: NSString?
    var appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
    var sender: NSString = UIDevice.currentDevice().name
    var usersArr: [String] = [String]()
    var mailButton = UIButton(frame: CGRectMake(255, 13, 20, 20))
    var avatars = Dictionary<String, UIImage>()
    
    var arrConnectedDevices: NSMutableArray = NSMutableArray(object: UIDevice.currentDevice().name)
    var delegate: ConnectionsViewControllerDelegate?
    
    var nearbyServiceBrowser: MCNearbyServiceBrowser?
    var nearbyPeers: NSArray?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //add a button on the top right and add the following action for it
        
        self.mailButton.setBackgroundImage(UIImage(named: "user.png"), forState: UIControlState.Normal)
        self.mailButton.addTarget(self, action: "connect", forControlEvents: UIControlEvents.TouchUpInside)
        self.navigationController?.navigationBar.addSubview(self.mailButton)

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "didReceiveDataWithNotification:", name: "MSDidReceiveDataWithNotification", object: nil)

        // Uncomment the following line to preserve selection between presentations
        
        // self.clearsSelectionOnViewWillAppear = false
        
        
        //let url = NSURL(string: imageUrl!)
        //let image = UIImage(data: NSData(contentsOfURL: url!)!)
        
        
        avatars["Ankush"] = UIImage(named: "kush.png")
        
        avatars["Clayton"] = UIImage(named: "clayton.png")
        
        avatars["Elle"] = UIImage(named: "elle.png")
        
        avatars["Long"] = UIImage(named: "long.png")
        
        avatars["Rohan"] = UIImage(named: "rohan.png")


        
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
    }
    
    
    func connect() {
        println("pushing view controller")
        self.navigationController?.pushViewController(ConnectionsViewController(), animated: true)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
        
    }
    
    
    
    // MARK: - Table view data source
    
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        // #warning Potentially incomplete method implementation.
        
        // Return the number of sections.
        
        return 1
        
    }
    
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // #warning Incomplete method implementation.
        
        // Return the number of rows in the section.
        
        return 5
        
    }
    
    
    
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        if indexPath.row == 0 {
            
            cell.textLabel?.text = "Ankush"
            cell.imageView?.image = avatars["Ankush"]
            
        }
        
        if indexPath.row == 1 {
            
            cell.textLabel?.text = "Clayton"
            cell.imageView?.image = avatars["Clayton"]
            
        }
        
        if indexPath.row == 2 {
            
            cell.textLabel?.text = "Elle"
            cell.imageView?.image = avatars["Elle"]
            
        }
        
        if indexPath.row == 3 {
            
            cell.textLabel?.text = "Long"
            cell.imageView?.image = avatars["Long"]
            
        }
        
        if indexPath.row == 4 {
            
            cell.textLabel?.text = "Rohan"
            cell.imageView?.image = avatars["Rohan"]
            
        }
        
        
        
        return cell
        
    }
    
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var firstVC = FirstViewController()
        
        if indexPath.row == 0 {
            
            firstVC.username = "Ankush"
            
        }
        
        if indexPath.row == 1 {
            
            firstVC.username = "Clayton"
        }
        
        if indexPath.row == 2 {

            firstVC.username = "Elle"
        }
        
        if indexPath.row == 3 {
            
            firstVC.username = "Long"
        }
        
        if indexPath.row == 4 {
            
            firstVC.username = "Rohan"
        }
        
        
        firstVC.avatars = avatars
        
        firstVC.sender = sender
        
        self.navigationController?.pushViewController(firstVC, animated: true)
        
        
        
    }
    
    
    
    
    
    /*
    
    // Override to support conditional editing of the table view.
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    
    // Return NO if you do not want the specified item to be editable.
    
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
    
    // Return NO if you do not want the item to be re-orderable.
    
    return true
    
    }
    
    */
    
    
    
    /*
    
    // MARK: - Navigation
    
    
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
    // Get the new view controller using [segue destinationViewController].
    
    // Pass the selected object to the new view controller.
    
    }
    
    */
    
    func browserForDevices() {
        appDelegate.mcManager?.setupMCBrowser()
        appDelegate.mcManager?.browser?.delegate = self
        var tempBrowser = appDelegate.mcManager?.browser
        //self.navigationController?.pushViewController(appDelegate?.mcManager?.browser?, animated: true)
        println("before presenting")
        self.presentViewController(tempBrowser!, animated: true, completion: nil)
        println("after presenting")
    }
    
    func browserViewControllerDidFinish(browserViewController: MCBrowserViewController!) {
        appDelegate.mcManager?.browser?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func browserViewControllerWasCancelled(browserViewController: MCBrowserViewController!) {
        appDelegate.mcManager?.browser?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func peerDidChangeStateWithNotification (notification: NSNotification) {
        var peerID = notification.userInfo?["peerID"] as MCPeerID
        var displayName = peerID.displayName
        var state = notification.userInfo?["state"] as Int
        
        if state != MCSessionState.Connecting.rawValue {
            if state == MCSessionState.Connected.rawValue {
                println("connected")
                arrConnectedDevices.addObject(displayName)
                //Call delegate method
                var firstVC = FirstViewController()
                firstVC.callSendEnter()
                //self.delegate?.callSendEnter()
            }
            else if state == MCSessionState.NotConnected.rawValue && arrConnectedDevices.count > 0{
                println("not connected")
                var indexOfPeer = arrConnectedDevices.indexOfObject(displayName)
                arrConnectedDevices.removeObjectAtIndex(indexOfPeer)
            }
            
            print(arrConnectedDevices)
            var peersExist = appDelegate.mcManager?.session.connectedPeers.count == 0
            self.dismissViewControllerAnimated(true, completion: nil)
            self.navigationController?.popViewControllerAnimated(true)
        }
    }
    
    func disconnect() {
        appDelegate.mcManager?.session.disconnect()
        arrConnectedDevices.removeAllObjects()
    }
    
    func browser(browser: MCNearbyServiceBrowser!, lostPeer peerID: MCPeerID!) {
        print("Lost peer %s", peerID)
        self.nearbyPeers = [[]]
    }
    
    func browser(browser: MCNearbyServiceBrowser!, didNotStartBrowsingForPeers error: NSError!) {
        println("Error starting browsing: %s", error.localizedDescription)
    }
    
    func advertiser(advertiser: MCNearbyServiceAdvertiser!, didReceiveInvitationFromPeer peerID: MCPeerID!, withContext context: NSData!, invitationHandler: ((Bool, MCSession!) -> Void)!) {
        println("Accepting invite from peer: \(peerID.displayName)")
        //invitationHandler(true, session)
    }
    
    func advertiser(advertiser: MCNearbyServiceAdvertiser!, didNotStartAdvertisingPeer error: NSError!) {
        
        println("didNotStartAdvertisingPeer")
    }
    
    func session(session: MCSession!, peer peerID: MCPeerID!, didChangeState state: MCSessionState) {
        println("Session for peer: %s, changed state to: %d", peerID, state)
    }
    
    func session(session: MCSession!, didReceiveData data: NSData!, fromPeer peerID: MCPeerID!) {
        println("Session received data: %s from peer: %s", data, peerID)
    }
    
    func session(session: MCSession!, didReceiveStream stream: NSInputStream!, withName streamName: String!, fromPeer peerID: MCPeerID!) {
        println("Session started receiving stream: %s with name: %s from peer: %s", stream, streamName, peerID)
    }
    
    func session(session: MCSession!, didStartReceivingResourceWithName resourceName: String!, fromPeer peerID: MCPeerID!, withProgress progress: NSProgress!) {
        println("Session started receiving resource: %s from peer: %s", resourceName, peerID)
    }
    
    func session(session: MCSession!, didFinishReceivingResourceWithName resourceName: String!, fromPeer peerID: MCPeerID!, atURL localURL: NSURL!, withError error: NSError!) {
        println("didFinishReceiving")
    }
    
    func browser(browser: MCNearbyServiceBrowser!, foundPeer peerID: MCPeerID!, withDiscoveryInfo info: [NSObject : AnyObject]!) {
        
    }
    
    func didReceiveDataWithNotification(notification: NSNotification) {
        var peerID: MCPeerID = notification.userInfo?["peerID"]! as MCPeerID
        var peerDisplayName = peerID.displayName as String
        var receivedData = notification.userInfo?["data"] as NSData
        
        var receivedMessage: BLEMessage = NSKeyedUnarchiver.unarchiveObjectWithData(receivedData) as BLEMessage
        //println("username: " + sender + "\n" + receivedMessage)
        var type = receivedMessage.type()
        
        if (type == "message") {
            //var temp = textLabel.text! + peerDisplayName + " wrote: " + receivedMessage.text()
            print(peerDisplayName + " wrote: " + receivedMessage.text() + "\n")
            
            //Determine if we want to trasmit this to other phones
            //Check if we are the intended target
            if( UIDevice.currentDevice().name == receivedMessage.recipient_ ) {
                //Then add this to the Textview
                //messages.append(receivedMessage)
            }
            else {
                //Check if the path already contains 'us'
                /*if !contains(receivedMessage.path_, UIDevice.currentDevice().name as String)
                */
                var elapsed = self.subtractDates(NSDate(), end: receivedMessage.date()!)
                if( elapsed > 1000){
                    println("discard message")
                }
                else {
                    recurringMessage(receivedMessage)
                    //finishSendingMessage()
                }
                /*}*/
            }
        }
        /*
        else if (type == "enter") {
        //print(receivedDict["username"] as NSString)
        //print(usersArr)
        
        if !contains(usersArr, receivedMessage.sender()) {
        
        usersArr.append(receivedMessage.sender())
        //print(usersArr)
        
        //Send back to OP (person entering)
        var type = "acq_lib"
        var target = receivedMessage.sender()
        
        var message = BLEMessage(type: type, sender: username, recipient: target)
        var dataToSend: NSData = NSKeyedArchiver.archivedDataWithRootObject(message)
        var allPeers = appDelegate.mcManager?.session.connectedPeers
        var error: NSError?
        appDelegate.mcManager?.session.sendData(dataToSend, toPeers: allPeers, withMode: MCSessionSendDataMode.Reliable, error: &error)
        if (error != nil) {
        print(error?.localizedDescription)
        }
        
        //Send out to network
        var type2 = "enter"
        var path2 = receivedMessage.path() as NSArray
        var path3 = NSMutableArray(array: path2)
        path3.addObject(username)
        
        var message2 = BLEMessage(type: type, sender: username, path: path3)
        
        var dataToSend2: NSData = NSKeyedArchiver.archivedDataWithRootObject(message2)
        var doReBroadcast = false
        for seenUser in path2{
        let count: Int? = appDelegate.mcManager?.session.connectedPeers.count as Int?
        for x in 0...count! {
        if ((appDelegate.mcManager?.session.connectedPeers[x] as MCPeerID) == seenUser as MCPeerID) {
        //the person has not already received the object
        continue
        }
        else {
        //we have to rebroadcast
        doReBroadcast = true
        }
        }
        }
        if doReBroadcast {
        var allPeers2 = appDelegate.mcManager?.session.connectedPeers
        var error2: NSError?
        appDelegate.mcManager?.session.sendData(dataToSend2, toPeers: allPeers2, withMode: MCSessionSendDataMode.Reliable, error: &error2)
        
        if((error2) != nil){
        print(error?.localizedDescription)
        }
        }
        }
        }
        else if (type == "acq_lib") {
        if (username == receivedMessage.recipient()) {
        //You..
        //You...
        //...
        //You ARE the OP
        //DUN DUN DUN
        
        // We should be doing something like
        // this here: v but it wasn't working
        usersArr = receivedMessage.path() as [String]
        println(usersArr)
        }
        }*/
    }
    
    func subtractDates(start: NSDate, end: NSDate) -> NSTimeInterval{
        return end.timeIntervalSinceDate(start)
    }
    
    func recurringMessage(receivedMessages: BLEMessage) {
        //this is the message that recurrs
        receivedMessages.numBounces_ = receivedMessages.numBounces_ + 1
        var path = NSMutableArray(array: receivedMessages.path_)
        path.addObject(UIDevice.currentDevice().name)
        var arrPath = NSArray(array: path)
        receivedMessages.path_ = arrPath
        
        var dataToSend: NSData = NSKeyedArchiver.archivedDataWithRootObject(receivedMessages)
        var allPeers = appDelegate.mcManager!.session.connectedPeers
        var error: NSError?
        appDelegate.mcManager?.session.sendData(dataToSend, toPeers: allPeers, withMode: MCSessionSendDataMode.Reliable, error: &error)
        if((error) != nil){
            print(error?.localizedDescription)
        }
        
    }
}

