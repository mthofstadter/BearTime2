//
//  AppDelegate.swift
//  beartime2
//
//  Created by Michael Hofstadter on 8/12/16.
//  Version 1.5 Released 5/2017
//

import Cocoa
import Darwin
import WebKit

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    let customWindowController = CustomWindow()
    
    let newTestLaunch = false
    let statusItem = NSStatusBar.system.statusItem(withLength: -1)
    let menu = NSMenu()
    var myClassNow = NSMenuItem(title: "Now: ", action: nil, keyEquivalent: "")
    var myClassNext = NSMenuItem(title: "Next: ", action: nil, keyEquivalent: "")
    var myClassAfter = NSMenuItem(title: "After: ", action: Selector(""), keyEquivalent: "")

    
    var myBlock1 = "Block 1"
    var myBlock2 = "Block 2"
    var myBlock3 = "Block 3"
    var myBlock4 = "Block 4"
    var myBlock5 = "Block 5"
    var myBlock6 = "Block 6"
    var myBlock7 = "Block 7"
    var myBlock8 = "School's Out"
    var myLunchMon = 1
    var myLunchTue = 1
    var myLunchWed = 1
    var myLunchThu = 1
    var myLunchFri = 1
    var myShowSeconds = 1
    var myShowHour = 1
    var found = false
    var schoolsOut = false
    var omgTime:TimeInterval = 0
    var whatBlock = Float(200)
    var hoy = NSDate()
    var convertedDay = "Hi"
    var endTime = Float(0)
    var secondTime = Float(0)


    @IBOutlet weak var settingsWindow: NSWindow!
    @IBOutlet weak var aboutWindow: NSWindow!
    @IBOutlet weak var scheduleWindow: NSWindow!
    @IBOutlet weak var bishWindow: NSWindow!
    @IBOutlet weak var myLabel: NSTextFieldCell!
    @IBOutlet weak var lunchMon: NSPopUpButton!
    @IBOutlet weak var lunchTue: NSPopUpButton!
    @IBOutlet weak var lunchWed: NSPopUpButton!
    @IBOutlet weak var lunchThu: NSPopUpButton!
    @IBOutlet weak var lunchFri: NSPopUpButton!
    @IBOutlet weak var showSeconds: NSButtonCell!
    @IBOutlet weak var showHour: NSButtonCell!
    @IBOutlet weak var textField1: NSTextField!
    @IBOutlet weak var textField2: NSTextField!
    @IBOutlet weak var textField3: NSTextField!
    @IBOutlet weak var textField4: NSTextField!
    @IBOutlet weak var textField5: NSTextField!
    @IBOutlet weak var textField6: NSTextField!
    @IBOutlet weak var textField7: NSTextField!
    @IBOutlet weak var textField8: NSTextField!


    
    
    @IBAction func clickedButton(sender:AnyObject) {
        
        myBlock1 = textField1.stringValue
        myBlock2 = textField2.stringValue
        myBlock3 = textField3.stringValue
        myBlock4 = textField4.stringValue
        myBlock5 = textField5.stringValue
        myBlock6 = textField6.stringValue
        myBlock7 = textField7.stringValue
        
        myLunchMon = lunchMon.indexOfSelectedItem + 1
        myLunchTue = lunchTue.indexOfSelectedItem + 1
        myLunchWed = lunchWed.indexOfSelectedItem + 1
        myLunchThu = lunchThu.indexOfSelectedItem + 1
        myLunchFri = lunchFri.indexOfSelectedItem + 1
        myShowSeconds = showSeconds.state.rawValue
        myShowHour = showHour.state.rawValue
        
        let savedBlock1 = textField1.stringValue
        UserDefaults.standard.set(savedBlock1, forKey: "savedBlock1")
        let savedBlock2 = textField2.stringValue
        UserDefaults.standard.set(savedBlock2, forKey: "savedBlock2")
        let savedBlock3 = textField3.stringValue
        UserDefaults.standard.set(savedBlock3, forKey: "savedBlock3")
        let savedBlock4 = textField4.stringValue
        UserDefaults.standard.set(savedBlock4, forKey: "savedBlock4")
        let savedBlock5 = textField5.stringValue
        UserDefaults.standard.set(savedBlock5, forKey: "savedBlock5")
        let savedBlock6 = textField6.stringValue
        UserDefaults.standard.set(savedBlock6, forKey: "savedBlock6")
        let savedBlock7 = textField7.stringValue
        UserDefaults.standard.set(savedBlock7, forKey: "savedBlock7")

        UserDefaults.standard.set(myLunchMon, forKey: "savedMyLunchMon")
        UserDefaults.standard.set(myLunchTue, forKey: "savedMyLunchTue")
        UserDefaults.standard.set(myLunchWed, forKey: "savedMyLunchWed")
        UserDefaults.standard.set(myLunchThu, forKey: "savedMyLunchThu")
        UserDefaults.standard.set(myLunchFri, forKey: "savedMyLunchFri")
        UserDefaults.standard.set(myShowSeconds, forKey: "savedMyShowSeconds")
        UserDefaults.standard.set(myShowHour, forKey: "savedMyShowHour")

        UserDefaults.standard.synchronize()
        
        updateBlock()
        
        settingsWindow.close()
        
    }
    
    @IBAction func textField8(sender: NSTextField!) {
        let savedBlock8 = textField8.stringValue
        myBlock8 = textField8.stringValue
        UserDefaults.standard.set(savedBlock8, forKey: "savedBlock8")
        UserDefaults.standard.synchronize()
        updateBlock()
    }
    
    @IBAction func hiddenButton(sender:AnyObject) {
        if found == false {
            menu.addItem(withTitle: "bish whet", action: #selector(AppDelegate.openBish), keyEquivalent: "∆")
            found = true
        }
        
    }
    
    @objc func setUp() {
        
        updateBlock()
        
        statusItem.menu = menu

        menu.addItem(NSMenuItem(title: "Settings", action: #selector(AppDelegate.openWindow), keyEquivalent: "M"))
        menu.addItem(NSMenuItem.separator())
        
        menu.addItem(myClassNow)
        menu.addItem(NSMenuItem.separator())
        menu.addItem(myClassNext)
        menu.addItem(NSMenuItem.separator())
        menu.addItem(myClassAfter)
        menu.addItem(NSMenuItem.separator())
        menu.addItem(NSMenuItem(title: "Schedule", action: #selector(AppDelegate.openSchedule), keyEquivalent: "H"))
        menu.addItem(NSMenuItem(title: "About", action: #selector(AppDelegate.openAbout), keyEquivalent: "O"))
        //menu.addItem(NSMenuItem(title: "Custom", action: Selector("openCustomWindow"), keyEquivalent: ""))
        menu.addItem(NSMenuItem.separator())
        menu.addItem(NSMenuItem(title: "Quit", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "F"))
        
    }
    
    @objc func openWindow() {
        settingsWindow.close()
        settingsWindow.center()
        settingsWindow.makeKeyAndOrderFront(settingsWindow)
    }
    
    @objc func openAbout() {
        aboutWindow.close()
        aboutWindow.center()
        aboutWindow.makeKeyAndOrderFront(aboutWindow)
    }
    
    @objc func openSchedule() {
        scheduleWindow.close()
        scheduleWindow.center()
        scheduleWindow.makeKeyAndOrderFront(scheduleWindow)
    }
    
    @objc func openBish() {
        bishWindow.close()
        bishWindow.center()
        bishWindow.makeKeyAndOrderFront(bishWindow)
    }
    
    func openCustomWindow() {
        customWindowController.showWindow(nil)
    }
    
    func calcSec(n: Float) -> Float {
        return(3600*floor(n)+(n-floor(n))*6000)
    }
    

    func timeString(omgTime:TimeInterval) -> String {
        let hours = Int(omgTime) / 3600
        let minutes = Int(omgTime) / 60 % 60
        let minutes65 = Int(omgTime) / 60
        let seconds = Int(omgTime) % 60

        if myShowSeconds == 0 && myShowHour == 1 {
            return String(format:"%01i:%02i", hours, minutes)
        }
        else if myShowSeconds == 1 && myShowHour == 1{
            return String(format:"%01i:%02i:%02i", hours, minutes, seconds)
        }
        
        else if myShowSeconds == 1 && myShowHour == 0{
            return String(format:"%02i:%02i", minutes65, seconds)
        }
        
        else {
            return String(format:"%02i", minutes65)
        }
    }
    
    
    @objc func updateCurrentTime() {
        let date = Date()
        let calendar = Calendar.current
        let hour = Double(calendar.component(.hour, from: date))
        let minute = Double(calendar.component(.minute, from: date))
        let second = Double(calendar.component(.second, from: date))
        
        secondTime = Float((3600*hour) + (60*minute) + (second))
        
        if secondTime > 21600 && secondTime < 21610 { //6:00am
            updateBlock()
        }
        
        if schoolsOut == false {
            if omgTime > 0 {
                omgTime = TimeInterval(endTime - secondTime)
                statusItem.title = "\(timeString(omgTime: omgTime))"
            }
            else {
                updateBlock()
            }
        }
        
    }

    
    
    func updateBlock() {
        
        let dayFormatter = DateFormatter()
        dayFormatter.dateFormat = "EEEE"
        dayFormatter.locale = NSLocale.current
        convertedDay = dayFormatter.string(from: hoy as Date)
    
        let actualTimeFormatter = DateFormatter()
            actualTimeFormatter.dateFormat = "H.mm"
        actualTimeFormatter.locale = NSLocale.current
       // let convertedActualTime = actualTimeFormatter.string(from: hoy as Date)
        //let convertedActualTimeFloat = Float(convertedActualTime)
        
        let date = Date()
        let calendar = Calendar.current
        let hour = Double(calendar.component(.hour, from: date))
        let minute = Double(calendar.component(.minute, from: date))
       // let second = Double(calendar.component(.second, from: date))
        
        let nowTime = hour + (minute/100)

    
        
        omgTime = 10

        if convertedDay == "Monday" {
            schoolsOut = false
            
            if nowTime >= 6.00 && nowTime < 8.00 {
                endTime = calcSec(n: 8.00)
                myClassNow.title = "Now: Before School"
                myClassNext.title = "Next: Advisory"
                myClassAfter.title = "After: Passing"
            }
                
            else if nowTime >= 8.00 && nowTime < 8.05 {
                endTime = calcSec(n: 8.05)
                myClassNow.title = "Now: Advisory"
                myClassNext.title = "Next: Passing"
                myClassAfter.title = "After: \(myBlock1)"
            }
                
            else if nowTime >= 8.05 && nowTime < 8.10 {
                endTime = calcSec(n: 8.10)
                myClassNow.title = "Now: Passing"
                myClassNext.title = "Next: \(myBlock1)"
                myClassAfter.title = "After: Passing"
            }
                
            else if nowTime >= 8.10 && nowTime < 8.55 {
                endTime = calcSec(n: 8.55)
                myClassNow.title = "Now: \(myBlock1)"
                myClassNext.title = "Next: Passing"
                myClassAfter.title = "After: \(myBlock2)"
            }
                
            else if nowTime >= 8.55 && nowTime < 9.00 {
                endTime = calcSec(n: 9.00)
                myClassNow.title = "Now: Passing"
                myClassNext.title = "Next: \(myBlock2)"
                myClassAfter.title = "After: Tutorial"
            }
                
            else if nowTime >= 9.00 && nowTime < 9.45 {
                endTime = calcSec(n: 9.45)
                myClassNow.title = "Now: \(myBlock2)"
                myClassNext.title = "Next: Tutorial"
                myClassAfter.title = "After: \(myBlock3)"
            }
                
            else if nowTime >= 9.45 && nowTime < 10.20 && myLunchMon == 2 {
                endTime = calcSec(n: 10.20)
                myClassNow.title = "Now: Tutorial"
                myClassNext.title = "Next: \(myBlock3)"
                myClassAfter.title = "After: Passing"
            }
                
            else if nowTime >= 10.20 && nowTime < 11.05 && myLunchMon == 2 {
                endTime = calcSec(n: 11.05)
                myClassNow.title = "Now: \(myBlock3)"
                myClassNext.title = "Next: Passing"
                myClassAfter.title = "After: \(myBlock4)"
            }
                
            else if nowTime >= 11.05 && nowTime < 11.10 && myLunchMon == 2 {
                endTime = calcSec(n: 11.10)
                myClassNow.title = "Now: Passing"
                myClassNext.title = "Next: \(myBlock4)"
                myClassAfter.title = "After: Lunch"
            }
                
            else if nowTime >= 11.10 && nowTime < 11.55 && myLunchMon == 2 {
                endTime = calcSec(n: 11.55)
                myClassNow.title = "Now: \(myBlock4)"
                myClassNext.title = "Next: Lunch"
                myClassAfter.title = "After: \(myBlock5)"
            }
                
            else if nowTime >= 11.55 && nowTime < 12.35 && myLunchMon == 2 {
                endTime = calcSec(n: 12.35)
                myClassNow.title = "Now: Lunch"
                myClassNext.title = "Next: \(myBlock5)"
                myClassAfter.title = "After: Passing"
            }
                
            else if nowTime >= 9.45 && nowTime < 10.20 && myLunchMon == 1 {
                endTime = calcSec(n: 10.20)
                myClassNow.title = "Now: Tutorial"
                myClassNext.title = "Next: \(myBlock3)"
                myClassAfter.title = "After: Lunch"
            }
                
            else if nowTime >= 10.20 && nowTime < 11.05 && myLunchMon == 1 {
                endTime = calcSec(n: 11.05)
                myClassNow.title = "Now: \(myBlock3)"
                myClassNext.title = "Next: Lunch"
                myClassAfter.title = "After: \(myBlock4)"
            }
                
            else if nowTime >= 11.05 && nowTime < 11.45 && myLunchMon == 1 {
                endTime = calcSec(n: 11.45)
                myClassNow.title = "Now: Lunch"
                myClassNext.title = "Next: \(myBlock4)"
                myClassAfter.title = "After: Passing"
            }
            
            else if nowTime >= 11.45 && nowTime < 12.30 && myLunchMon == 1 {
                endTime = calcSec(n: 12.30)
                myClassNow.title = "Now: \(myBlock4)"
                myClassNext.title = "Next: Passing"
                myClassAfter.title = "After: \(myBlock5)"
            }
                
            else if nowTime >= 12.30 && nowTime < 12.35 && myLunchMon == 1 {
                endTime = calcSec(n: 12.35)
                myClassNow.title = "Now: Passing"
                myClassNext.title = "Next: \(myBlock5)"
                myClassAfter.title = "After: Passing"
            }
                
            else if nowTime >= 12.35 && nowTime < 13.20 {
                endTime = calcSec(n: 13.20)
                myClassNow.title = "Now: \(myBlock5)"
                myClassNext.title = "Next: Passing"
                myClassAfter.title = "After: \(myBlock6)"

            }
                
            else if nowTime >= 13.20 && nowTime < 13.25 {
                endTime = calcSec(n: 13.25)
                myClassNow.title = "Now: Passing"
                myClassNext.title = "Next: \(myBlock6)"
                myClassAfter.title = "After: Passing"
            }
                
            else if nowTime >= 13.25 && nowTime < 14.10 {
                endTime = calcSec(n: 14.10)
                myClassNow.title = "Now: \(myBlock6)"
                myClassNext.title = "Next: Passing"
                myClassAfter.title = "After: \(myBlock7)"
            }
                
            else if nowTime >= 14.10 && nowTime < 14.15 {
                endTime = calcSec(n: 14.15)
                myClassNow.title = "Now: Passing"
                myClassNext.title = "Next: \(myBlock7)"
                myClassAfter.title = "After: \(myBlock8)"
            }
                
            else if nowTime >= 14.15 && nowTime < 15.00 {
                endTime = calcSec(n: 15.00)
                myClassNow.title = "Now: \(myBlock7)"
                myClassNext.title = "Next: \(myBlock8)"
                myClassAfter.title = "After: \(myBlock8)"
            }
                
            else {
                schoolsOut = true
                statusItem.title = "\(myBlock8)"
                myClassNow.title = "Now: \(myBlock8)"
                myClassNext.title = "Next: \(myBlock8)"
                myClassAfter.title = "After: \(myBlock8)"
            }
        }
        
        if convertedDay == "Tuesday" {
            schoolsOut = false
            
            if nowTime >= 6.00 && nowTime < 8.00 {
                endTime = calcSec(n: 8.00)
                myClassNow.title = "Now: Before School"
                myClassNext.title = "Next: \(myBlock1)"
                myClassAfter.title = "After: Passing"
            }
                
            else if nowTime >= 8.00 && nowTime < 9.05 {
                endTime = calcSec(n: 9.05)
                myClassNow.title = "Now: \(myBlock1)"
                myClassNext.title = "Next: Passing"
                myClassAfter.title = "After: Assembly"
            }
                
            else if nowTime >= 9.05 && nowTime < 9.10 {
                endTime = calcSec(n: 9.10)
                myClassNow.title = "Now: Passing"
                myClassNext.title = "Next: Assembly"
                myClassAfter.title = "After: Passing"
            }
                
            else if nowTime >= 9.10 && nowTime < 9.50 {
                endTime = calcSec(n: 9.50)
                myClassNow.title = "Now: Assembly"
                myClassNext.title = "Next: Passing"
                myClassAfter.title = "After: \(myBlock4)"
            }
                
            else if nowTime >= 9.50 && nowTime < 9.55 && myLunchTue == 2 {
                endTime = calcSec(n: 9.55)
                myClassNow.title = "Now: Passing"
                myClassNext.title = "Next: \(myBlock4)"
                myClassAfter.title = "After: Passing"
            }
                
            else if nowTime >= 9.55 && nowTime < 11.00 && myLunchTue == 2 {
                endTime = calcSec(n: 11.00)
                myClassNow.title = "Now: \(myBlock4)"
                myClassNext.title = "Next: Passing"
                myClassAfter.title = "After: \(myBlock5)"
            }
                
            else if nowTime >= 11.00 && nowTime < 11.05 && myLunchTue == 2 {
                endTime = calcSec(n: 11.05)
                myClassNow.title = "Now: Passing"
                myClassNext.title = "Next: \(myBlock5)"
                myClassAfter.title = "After: Lunch"
            }
                
            else if nowTime >= 11.05 && nowTime < 12.10 && myLunchTue == 2 {
                endTime = calcSec(n: 12.10)
                myClassNow.title = "Now: \(myBlock5)"
                myClassNext.title = "Next: Lunch"
                myClassAfter.title = "After: \(myBlock7)"
            }
                
            else if nowTime >= 12.10 && nowTime < 12.45 && myLunchTue == 2 {
                endTime = calcSec(n: 12.45)
                myClassNow.title = "Now: Lunch"
                myClassNext.title = "Next: \(myBlock7)"
                myClassAfter.title = "After: Passing"
            }
                
            else if nowTime >= 9.50 && nowTime < 9.55 && myLunchTue == 1 {
                endTime = calcSec(n: 9.55)
                myClassNow.title = "Now: Passing"
                myClassNext.title = "Next: \(myBlock4)"
                myClassAfter.title = "After: Lunch"
            }
                
            else if nowTime >= 9.55 && nowTime < 11.00 && myLunchTue == 1 {
                endTime = calcSec(n: 11.00)
                myClassNow.title = "Now: \(myBlock4)"
                myClassNext.title = "Next: Lunch"
                myClassAfter.title = "After: \(myBlock5)"
            }
                
            else if nowTime >= 11.00 && nowTime < 11.35 && myLunchTue == 1 {
                endTime = calcSec(n: 11.35)
                myClassNow.title = "Now: Lunch"
                myClassNext.title = "Next: \(myBlock5)"
                myClassAfter.title = "After: Passing"
            }
                
            else if nowTime >= 11.35 && nowTime < 12.40 && myLunchTue == 1 {
                endTime = calcSec(n: 12.40)
                myClassNow.title = "Now: \(myBlock5)"
                myClassNext.title = "Next: Passing"
                myClassAfter.title = "After: \(myBlock7)"
            }
                
            else if nowTime >= 12.40 && nowTime < 12.45 && myLunchTue == 1 {
                endTime = calcSec(n: 12.45)
                myClassNow.title = "Now: Passing"
                myClassNext.title = "Next: \(myBlock7)"
                myClassAfter.title = "After: Passing"
            }
                
            else if nowTime >= 12.45 && nowTime < 13.50 {
                endTime = calcSec(n: 13.50)
                myClassNow.title = "Now: \(myBlock7)"
                myClassNext.title = "Next: Passing"
                myClassAfter.title = "After: \(myBlock6)"
            }
                
            else if nowTime >= 13.50 && nowTime < 13.55 {
                endTime = calcSec(n: 13.55)
                myClassNow.title = "Now: Passing"
                myClassNext.title = "Next: \(myBlock6)"
                myClassAfter.title = "After: \(myBlock8)"
            }
                
            else if nowTime >= 13.55 && nowTime < 15.00 {
                endTime = calcSec(n: 15.00)
                myClassNow.title = "Now: \(myBlock6)"
                myClassNext.title = "Next: \(myBlock8)"
                myClassAfter.title = "After: \(myBlock8)"
            }
                
            else {
                schoolsOut = true
                statusItem.title = "\(myBlock8)"
                myClassNow.title = "Now: \(myBlock8)"
                myClassNext.title = "Next: \(myBlock8)"
                myClassAfter.title = "After: \(myBlock8)"
            }
        }

        
        if convertedDay == "Wednesday" {
                schoolsOut = false
            
                if nowTime >= 6.00 && nowTime < 8.30 {
                    endTime = calcSec(n: 8.30)
                    myClassNow.title = "Now: Before School"
                    myClassNext.title = "Next: \(myBlock3)"
                    myClassAfter.title = "After: Passing"
                }
            
                else if nowTime >= 8.30 && nowTime < 9.35 {
                    endTime = calcSec(n: 9.35)
                    myClassNow.title = "Now: \(myBlock3)"
                    myClassNext.title = "Next: Passing"
                    myClassAfter.title = "After: Advisory"
                }
                    
                else if nowTime >= 9.35 && nowTime < 9.40 {
                    endTime = calcSec(n: 9.40)
                    myClassNow.title = "Now: Passing"
                    myClassNext.title = "Next: Advisory"
                    myClassAfter.title = "After: Passing"
                }
                    
                else if nowTime >= 9.40 && nowTime < 10.15 {
                    endTime = calcSec(n: 10.15)
                    myClassNow.title = "Now: Advisory"
                    myClassNext.title = "Next: Passing"
                    myClassAfter.title = "After: \(myBlock2)"
                }
                    
                else if nowTime >= 10.15 && nowTime < 10.20 && myLunchWed == 2 {
                    endTime = calcSec(n: 10.20)
                    myClassNow.title = "Now: Passing"
                    myClassNext.title = "Next: \(myBlock2)"
                    myClassAfter.title = "After: Passing"
                }
                    
                else if nowTime >= 10.20 && nowTime < 11.25 && myLunchWed == 2{
                    endTime = calcSec(n: 11.25)
                    myClassNow.title = "Now: \(myBlock2)"
                    myClassNext.title = "Next: Passing"
                    myClassAfter.title = "After: \(myBlock4)"
                }
                    
                    
                else if nowTime >= 11.25 && nowTime < 11.30 && myLunchWed == 2 {
                    endTime = calcSec(n: 11.30)
                    myClassNow.title = "Now: Passing"
                    myClassNext.title = "Next: \(myBlock4)"
                    myClassAfter.title = "After: Lunch"
                }
                    
                else if nowTime >= 11.30 && nowTime < 12.35 && myLunchWed == 2 {
                    endTime = calcSec(n: 12.35)
                    myClassNow.title = "Now: \(myBlock4)"
                    myClassNext.title = "Next: Lunch"
                    myClassAfter.title = "After: TASC"
                }
                    
                else if nowTime >= 12.35 && nowTime < 13.15 && myLunchWed == 2 {
                    endTime = calcSec(n: 13.15)
                    myClassNow.title = "Now: Lunch"
                    myClassNext.title = "Next: TASC"
                    myClassAfter.title = "After: \(myBlock5)"
                }
                    
                else if nowTime >= 10.15 && nowTime < 10.20 && myLunchWed == 1 {
                    endTime = calcSec(n: 10.20)
                    myClassNow.title = "Now: Passing"
                    myClassNext.title = "Next: \(myBlock2)"
                    myClassAfter.title = "After: Lunch"
                }
                
                else if nowTime >= 10.20 && nowTime < 11.25 && myLunchWed == 1 {
                    endTime = calcSec(n: 11.25)
                    myClassNow.title = "Now: \(myBlock2)"
                    myClassNext.title = "Next: Lunch"
                    myClassAfter.title = "After: \(myBlock4)"
                }
                    
                else if nowTime >= 11.25 && nowTime < 12.05 && myLunchWed == 1 {
                    endTime = calcSec(n: 12.05)
                    myClassNow.title = "Now: Lunch"
                    myClassNext.title = "Next: \(myBlock4)"
                    myClassAfter.title = "After: Passing"
                }
                    
                else if nowTime >= 12.05 && nowTime < 13.10 && myLunchWed == 1 {
                    endTime = calcSec(n: 13.10)
                    myClassNow.title = "Now: \(myBlock4)"
                    myClassNext.title = "Next: TASC"
                    myClassAfter.title = "After: \(myBlock5)"
                }
                    
                else if nowTime >= 13.10 && nowTime < 13.55 {
                    endTime = calcSec(n: 13.55)
                    myClassNow.title = "Now: TASC"
                    myClassNext.title = "Next: \(myBlock5)"
                    myClassAfter.title = "After: \(myBlock8)"
                }
                    
                else if nowTime >= 13.55 && nowTime < 15.00 {
                    endTime = calcSec(n: 15.00)
                    myClassNow.title = "Now: \(myBlock5)"
                    myClassNext.title = "Next: \(myBlock8)"
                    myClassAfter.title = "After: \(myBlock8)"
                }
        
                else {
                    schoolsOut = true
                    statusItem.title = "\(myBlock8)"
                    myClassNow.title = "Now: \(myBlock8)"
                    myClassNext.title = "Next: \(myBlock8)"
                    myClassAfter.title = "After: \(myBlock8)"
                }
        }
        
        if convertedDay == "Thursday" {
            schoolsOut = false
            
            if nowTime >= 6.00 && nowTime < 8.00 {
                endTime = calcSec(n: 8.00)
                myClassNow.title = "Now: Before School"
                myClassNext.title = "Next: \(myBlock2)"
                myClassAfter.title = "After: Passing"
            }
                
            else if nowTime >= 8.00 && nowTime < 9.05 {
                endTime = calcSec(n: 9.05)
                myClassNow.title = "Now: \(myBlock2)"
                myClassNext.title = "Next: Passing"
                myClassAfter.title = "After: Assembly"
            }
                
            else if nowTime >= 9.05 && nowTime < 9.10 {
                endTime = calcSec(n: 9.10)
                myClassNow.title = "Now: Passing"
                myClassNext.title = "Next: Assembly"
                myClassAfter.title = "After: \(myBlock1)"
            }
                
            else if nowTime >= 9.10 && nowTime < 9.50 {
                endTime = calcSec(n: 9.50)
                myClassNow.title = "Now: Assembly"
                myClassNext.title = "Next: Passing"
                myClassAfter.title = "After: \(myBlock1)"
            }
                
            else if nowTime >= 9.50 && nowTime < 9.55 && myLunchThu == 2 {
                endTime = calcSec(n: 9.55)
                myClassNow.title = "Now: Passing"
                myClassNext.title = "Next: \(myBlock1)"
                myClassAfter.title = "After: Passing"
            }
                
            else if nowTime >= 9.55 && nowTime < 11.00 && myLunchThu == 2 {
                endTime = calcSec(n: 11.00)
                myClassNow.title = "Now: \(myBlock1)"
                myClassNext.title = "Next: Passing"
                myClassAfter.title = "After: \(myBlock3)"
            }
                
            else if nowTime >= 11.00 && nowTime < 11.05 && myLunchThu == 2 {
                endTime = calcSec(n: 11.05)
                myClassNow.title = "Now: Passing"
                myClassNext.title = "Next: \(myBlock3)"
                myClassAfter.title = "After: Lunch"
            }
                
            else if nowTime >= 11.05 && nowTime < 12.10 && myLunchThu == 2 {
                endTime = calcSec(n: 12.10)
                myClassNow.title = "Now: \(myBlock3)"
                myClassNext.title = "Next: Lunch"
                myClassAfter.title = "After: \(myBlock6)"
            }
                
            else if nowTime >= 12.10 && nowTime < 12.45 && myLunchThu == 2 {
                endTime = calcSec(n: 12.45)
                myClassNow.title = "Now: Lunch"
                myClassNext.title = "Next: \(myBlock6)"
                myClassAfter.title = "After: Passing"
            }
                
            else if nowTime >= 9.50 && nowTime < 9.55 && myLunchThu == 1 {
                endTime = calcSec(n: 9.55)
                myClassNow.title = "Now: Passing"
                myClassNext.title = "Next: \(myBlock1)"
                myClassAfter.title = "After: Lunch"
            }
                
            else if nowTime >= 9.55 && nowTime < 11.00 && myLunchThu == 1 {
                    endTime = calcSec(n: 11.00)
                    myClassNow.title = "Now: \(myBlock1)"
                    myClassNext.title = "Next: Lunch"
                    myClassAfter.title = "After: \(myBlock3)"
            }
                
            else if nowTime >= 11.00 && nowTime < 11.35 && myLunchThu == 1 {
                    endTime = calcSec(n: 11.35)
                    myClassNow.title = "Now: Lunch"
                    myClassNext.title = "Next: \(myBlock3)"
                    myClassAfter.title = "After: Passing"
            }
                
            else if nowTime >= 11.35 && nowTime < 12.40 && myLunchThu == 1 {
                endTime = calcSec(n: 12.40)
                myClassNow.title = "Now: \(myBlock3)"
                myClassNext.title = "Next: Passing"
                myClassAfter.title = "After: \(myBlock6)"
            }
                
            else if nowTime >= 12.40 && nowTime < 12.45 && myLunchThu == 1 {
                endTime = calcSec(n: 12.45)
                myClassNow.title = "Now: Passing"
                myClassNext.title = "Next: \(myBlock6)"
                myClassAfter.title = "After: Passing"
            }
                
            else if nowTime >= 12.45 && nowTime < 13.50 {
                endTime = calcSec(n: 13.50)
                myClassNow.title = "Now: \(myBlock6)"
                myClassNext.title = "Next: Passing"
                myClassAfter.title = "After: \(myBlock7)"
            }
                
            else if nowTime >= 13.50 && nowTime < 13.55 {
                endTime = calcSec(n: 13.55)
                myClassNow.title = "Now: Passing"
                myClassNext.title = "Next: \(myBlock7)"
                myClassAfter.title = "After: \(myBlock8)"
            }
                
            else if nowTime >= 13.55 && nowTime < 15.00 {
                endTime = calcSec(n: 15.00)
                myClassNow.title = "Now: \(myBlock7)"
                myClassNext.title = "Next: \(myBlock8)"
                myClassAfter.title = "After: \(myBlock8)"
            }
                
            else {
                schoolsOut = true
                statusItem.title = "\(myBlock8)"
                myClassNow.title = "Now: \(myBlock8)"
                myClassNext.title = "Next: \(myBlock8)"
                myClassAfter.title = "After: \(myBlock8)"
            }
        }
        
        if convertedDay == "Friday" {
            schoolsOut = false
            
            if nowTime >= 6.00 && nowTime < 8.30 {
                endTime = calcSec(n: 8.30)
                myClassNow.title = "Now: Before School"
                myClassNext.title = "Next: Advisory"
                myClassAfter.title = "After: Passing"
            }
                
            else if nowTime >= 8.30 && nowTime < 8.35 {
                endTime = calcSec(n: 8.35)
                myClassNow.title = "Now: Advisory"
                myClassNext.title = "Next: Passing"
                myClassAfter.title = "After: \(myBlock2)"
            }
                
            else if nowTime >= 8.35 && nowTime < 8.40 {
                endTime = calcSec(n: 8.40)
                myClassNow.title = "Now: Passing"
                myClassNext.title = "Next: \(myBlock2)"
                myClassAfter.title = "After: Passing"
            }
                
            else if nowTime >= 8.40 && nowTime < 9.25 {
                endTime = calcSec(n: 9.25)
                myClassNow.title = "Now: \(myBlock2)"
                myClassNext.title = "Next: Passing"
                myClassAfter.title = "After: \(myBlock1)"
            }
                
            else if nowTime >= 9.25 && nowTime < 9.30 {
                endTime = calcSec(n: 9.30)
                myClassNow.title = "Now: Passing"
                myClassNext.title = "Next: \(myBlock1)"
                myClassAfter.title = "After: Tutorial"
            }
                
            else if nowTime >= 9.30 && nowTime < 10.15 {
                endTime = calcSec(n: 10.15)
                myClassNow.title = "Now: \(myBlock1)"
                myClassNext.title = "Next: Passing"
                myClassAfter.title = "After: \(myBlock3)"
            }
                
            else if nowTime >= 10.15 && nowTime < 10.20 && myLunchFri == 2 {
                endTime = calcSec(n: 10.20)
                myClassNow.title = "Now: Passing"
                myClassNext.title = "Next: \(myBlock3)"
                myClassAfter.title = "After: Passing"
            }
                
            else if nowTime >= 10.20 && nowTime < 11.05 && myLunchFri == 2 {
                endTime = calcSec(n: 11.05)
                myClassNow.title = "Now: \(myBlock3)"
                myClassNext.title = "Next: Passing"
                myClassAfter.title = "After: \(myBlock4)"
            }
                
            else if nowTime >= 11.05 && nowTime < 11.10 && myLunchFri == 2 {
                endTime = calcSec(n: 11.10)
                myClassNow.title = "Now: Passing"
                myClassNext.title = "Next: \(myBlock4)"
                myClassAfter.title = "After: Lunch"
            }
                
            else if nowTime >= 11.10 && nowTime < 11.55 && myLunchFri == 2 {
                endTime = calcSec(n: 11.55)
                myClassNow.title = "Now: \(myBlock4)"
                myClassNext.title = "Next: Lunch"
                myClassAfter.title = "After: \(myBlock5)"
            }
                
            else if nowTime >= 11.55 && nowTime < 12.35 && myLunchFri == 2 {
                endTime = calcSec(n: 12.35)
                myClassNow.title = "Now: Lunch"
                myClassNext.title = "Next: \(myBlock5)"
                myClassAfter.title = "After: Passing"
            }
                
            else if nowTime >= 10.15 && nowTime < 10.20 && myLunchFri == 1 {
                endTime = calcSec(n: 10.20)
                myClassNow.title = "Now: Passing"
                myClassNext.title = "Next: \(myBlock3)"
                myClassAfter.title = "After: Lunch"
            }
                
            else if nowTime >= 10.20 && nowTime < 11.05 && myLunchFri == 1 {
                endTime = calcSec(n: 11.05)
                myClassNow.title = "Now: \(myBlock3)"
                myClassNext.title = "Next: Lunch"
                myClassAfter.title = "After: \(myBlock4)"
            }
                
            else if nowTime >= 11.05 && nowTime < 11.45 && myLunchFri == 1 {
                endTime = calcSec(n: 11.45)
                myClassNow.title = "Now: Lunch"
                myClassNext.title = "Next: \(myBlock4)"
                myClassAfter.title = "After: Passing"
            }
                
            else if nowTime >= 11.45 && nowTime < 12.30 && myLunchFri == 1 {
                endTime = calcSec(n: 12.30)
                myClassNow.title = "Now: \(myBlock4)"
                myClassNext.title = "Next: Passing"
                myClassAfter.title = "After: \(myBlock5)"
            }
                
            else if nowTime >= 12.30 && nowTime < 12.35 && myLunchFri == 1 {
                endTime = calcSec(n: 12.35)
                myClassNow.title = "Now: Passing"
                myClassNext.title = "Next: \(myBlock5)"
                myClassAfter.title = "After: Passing)"
            }
                
            else if nowTime >= 12.35 && nowTime < 13.20 {
                endTime = calcSec(n: 13.20)
                myClassNow.title = "Now: \(myBlock5)"
                myClassNext.title = "Next: Passing"
                myClassAfter.title = "After: \(myBlock7)"
            }
                
            else if nowTime >= 13.20 && nowTime < 13.25 {
                endTime = calcSec(n: 13.25)
                myClassNow.title = "Now: Passing"
                myClassNext.title = "Next: \(myBlock7)"
                myClassAfter.title = "After: Passing"
            }
                
            else if nowTime >= 13.25 && nowTime < 14.10 {
                endTime = calcSec(n: 14.10)
                myClassNow.title = "Now: \(myBlock7)"
                myClassNext.title = "Next: Passing"
                myClassAfter.title = "After: \(myBlock6)"
            }
                
            else if nowTime >= 14.10 && nowTime < 14.15 {
                endTime = calcSec(n: 14.15)
                myClassNow.title = "Now: Passing"
                myClassNext.title = "Next: \(myBlock6)"
                myClassAfter.title = "After: \(myBlock8)"
            }
                
            else if nowTime >= 14.15 && nowTime < 15.00 {
                endTime = calcSec(n: 15.00)
                myClassNow.title = "Now: \(myBlock6)"
                myClassNext.title = "Next: \(myBlock8)"
                myClassAfter.title = "After: \(myBlock8)"
            }
                
            else {
                schoolsOut = true
                statusItem.title = "\(myBlock8)"
                myClassNow.title = "Now: \(myBlock8)"
                myClassNext.title = "Next: \(myBlock8)"
                myClassAfter.title = "After: \(myBlock8)"
            }
        }
        
        if convertedDay == "Saturday" || convertedDay == "Sunday" {
            schoolsOut = true
            statusItem.title = "\(myBlock8)"
            myClassNow.title = "Now: \(myBlock8)"
            myClassNext.title = "Next: \(myBlock8)"
            myClassAfter.title = "After: \(myBlock8)"
        }

        
        
    }
    
    
    func wakeUpListener(aNotification : NSNotification) {
        omgTime = 10
        updateBlock()
    }


    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        
        omgTime = 10
        updateBlock()

        
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(AppDelegate.updateCurrentTime), userInfo: nil, repeats: true)
        Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(AppDelegate.setUp), userInfo: nil, repeats: false)
        //NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateBlock"), userInfo: nil, repeats: true)
        
        NSWorkspace.shared.notificationCenter.addObserver(self, selector: Selector(("wakeUpListener:")), name: NSWorkspace.didWakeNotification, object: nil)
        
        if newTestLaunch == true {
            UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
            UserDefaults.standard.synchronize()
        }
        
        let access1 = UserDefaults.standard
        
        if let printSavedBlock1 = access1.string(forKey: "savedBlock1") {
            myBlock1 = printSavedBlock1
            textField1.stringValue = "\(printSavedBlock1)"
        }
        if let printSavedBlock2 = access1.string(forKey: "savedBlock2") {
            myBlock2 = printSavedBlock2
            textField2.stringValue = "\(printSavedBlock2)"
        }
        if let printSavedBlock3 = access1.string(forKey: "savedBlock3") {
            myBlock3 = printSavedBlock3
            textField3.stringValue = "\(printSavedBlock3)"
        }
        if let printSavedBlock4 = access1.string(forKey: "savedBlock4") {
            myBlock4 = printSavedBlock4
            textField4.stringValue = "\(printSavedBlock4)"
        }
        
        if let printSavedBlock5 = access1.string(forKey: "savedBlock5") {
            myBlock5 = printSavedBlock5
        textField5.stringValue = "\(printSavedBlock5)"
        }
        
        if let printSavedBlock6 = access1.string(forKey: "savedBlock6") {
            textField6.stringValue = "\(printSavedBlock6)"
            myBlock6 = printSavedBlock6
        }
        if let printSavedBlock7 = access1.string(forKey: "savedBlock7") {
            textField7.stringValue = "\(printSavedBlock7)"
            myBlock7 = printSavedBlock7
        }
        if let printSavedBlock8 = access1.string(forKey: "savedBlock8") {
            textField8.stringValue = "\(printSavedBlock8)"
            myBlock8 = printSavedBlock8
        }
        
        
        if let printSavedLunchMon = access1.string(forKey: "savedMyLunchMon") {
            let printSavedLunchMonInt = Int(printSavedLunchMon)
            lunchMon.selectItem(at: printSavedLunchMonInt! - 1)
        }
        if let printSavedLunchTue = access1.string(forKey: "savedMyLunchTue") {
            let printSavedLunchTueInt = Int(printSavedLunchTue)
            lunchTue.selectItem(at: printSavedLunchTueInt! - 1)
        }
        if let printSavedLunchWed = access1.string(forKey: "savedMyLunchWed") {
            let printSavedLunchWedInt = Int(printSavedLunchWed)
            lunchWed.selectItem(at: printSavedLunchWedInt! - 1)
        }
        if let printSavedLunchThu = access1.string(forKey: "savedMyLunchThu") {
            let printSavedLunchThuInt = Int(printSavedLunchThu)
            lunchThu.selectItem(at: printSavedLunchThuInt! - 1)
        }
        if let printSavedLunchFri = access1.string(forKey: "savedMyLunchFri") {
            let printSavedLunchFriInt = Int(printSavedLunchFri)
            lunchFri.selectItem(at: printSavedLunchFriInt! - 1)
        }
        
        if let printSavedMyShowSeconds = access1.string(forKey: "savedMyShowSeconds") {
            let printSavedMyShowSecondsInt = Int(printSavedMyShowSeconds)
            
            if printSavedMyShowSecondsInt! == 0 {
                showSeconds.state =  NSControl.StateValue.off
                myShowSeconds = 0
            }
            else {
                showSeconds.state = NSControl.StateValue.on
            }
        }
        
        if let printSavedMyShowHour = access1.string(forKey: "savedMyShowHour") {
            let printSavedMyShowHourInt = Int(printSavedMyShowHour)

            
            if printSavedMyShowHourInt! == 0 {
                showHour.state =  NSControl.StateValue.off
                myShowHour = 0
            }
            else {
                showHour.state = NSControl.StateValue.on
            }
            
            
        }
        
        myBlock1 = textField1.stringValue
        myBlock2 = textField2.stringValue
        myBlock3 = textField3.stringValue
        myBlock4 = textField4.stringValue
        myBlock5 = textField5.stringValue
        myBlock6 = textField6.stringValue
        myBlock7 = textField7.stringValue
        
        myLunchMon = lunchMon.indexOfSelectedItem + 1
        myLunchTue = lunchTue.indexOfSelectedItem + 1
        myLunchWed = lunchWed.indexOfSelectedItem + 1
        myLunchThu = lunchThu.indexOfSelectedItem + 1
        myLunchFri = lunchFri.indexOfSelectedItem + 1
        myShowSeconds = showSeconds.state.rawValue
        myShowHour = showHour.state.rawValue
        
        let savedBlock1 = textField1.stringValue
        UserDefaults.standard.set(savedBlock1, forKey: "savedBlock1")
        let savedBlock2 = textField2.stringValue
        UserDefaults.standard.set(savedBlock2, forKey: "savedBlock2")
        let savedBlock3 = textField3.stringValue
        UserDefaults.standard.set(savedBlock3, forKey: "savedBlock3")
        let savedBlock4 = textField4.stringValue
        UserDefaults.standard.set(savedBlock4, forKey: "savedBlock4")
        let savedBlock5 = textField5.stringValue
        UserDefaults.standard.set(savedBlock5, forKey: "savedBlock5")
        let savedBlock6 = textField6.stringValue
        UserDefaults.standard.set(savedBlock6, forKey: "savedBlock6")
        let savedBlock7 = textField7.stringValue
        UserDefaults.standard.set(savedBlock7, forKey: "savedBlock7")
        
        
        UserDefaults.standard.set(myLunchMon, forKey: "savedMyLunchMon")
        UserDefaults.standard.set(myLunchTue, forKey: "savedMyLunchTue")
        UserDefaults.standard.set(myLunchWed, forKey: "savedMyLunchWed")
        UserDefaults.standard.set(myLunchThu, forKey: "savedMyLunchThu")
        UserDefaults.standard.set(myLunchFri, forKey: "savedMyLunchFri")
        UserDefaults.standard.set(myShowSeconds, forKey: "savedMyShowSeconds")
        UserDefaults.standard.set(myShowHour, forKey: "savedMyShowHour")
        
        //UserDefaults.standard.set.synchronize()
        
    }

    

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
}


