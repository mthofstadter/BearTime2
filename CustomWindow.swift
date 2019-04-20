//
//  CustomWindow.swift
//  Bear Time Test 1.3
//
//  Created by mthofstadte17 on 9/4/16.
//  Copyright © 2016 Michael Hofstadter. All rights reserved.
//

import Cocoa
var enableCustom = false


class CustomWindow: NSWindowController {
    
    convenience init() {
        self.init(windowNibName: NSNib.Name(rawValue: "CustomWindow"))
    }

    override func windowDidLoad() {
        super.windowDidLoad()

        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
        
    }
    
    @IBOutlet weak var customWindow: NSWindow!
    @IBOutlet weak var textA: NSTextField!
    @IBOutlet weak var textA1: NSTextField!
    @IBOutlet weak var textA2: NSTextField!
    @IBOutlet weak var textB: NSTextField!
    @IBOutlet weak var textB1: NSTextField!
    @IBOutlet weak var textB2: NSTextField!
    @IBOutlet weak var textC: NSTextField!
    @IBOutlet weak var textC1: NSTextField!
    @IBOutlet weak var textC2: NSTextField!
    @IBOutlet weak var textD: NSTextField!
    @IBOutlet weak var textD1: NSTextField!
    @IBOutlet weak var textD2: NSTextField!
    @IBOutlet weak var textE: NSTextField!
    @IBOutlet weak var textE1: NSTextField!
    @IBOutlet weak var textE2: NSTextField!
    @IBOutlet weak var textF: NSTextField!
    @IBOutlet weak var textF1: NSTextField!
    @IBOutlet weak var textF2: NSTextField!
    @IBOutlet weak var textG: NSTextField!
    @IBOutlet weak var textG1: NSTextField!
    @IBOutlet weak var textG2: NSTextField!
    
    var periodA = ""
    var A1 = Float(0)
    var A2 = Float(0)
    var AS1 = Float(0)
    var AS2 = Float(0)
    var periodB = ""
    var B1 = Float(0)
    var B2 = Float(0)
    var BS1 = Float(0)
    var BS2 = Float(0)
    var periodC = ""
    var C1 = Float(0)
    var C2 = Float(0)
    var CS1 = Float(0)
    var CS2 = Float(0)
    var periodD = ""
    var D1 = Float(0)
    var D2 = Float(0)
    var DS1 = Float(0)
    var DS2 = Float(0)
    var periodE = ""
    var E1 = Float(0)
    var E2 = Float(0)
    var ES1 = Float(0)
    var ES2 = Float(0)
    var periodF = ""
    var F1 = Float(0)
    var F2 = Float(0)
    var FS1 = Float(0)
    var FS2 = Float(0)
    var periodG = ""
    var G1 = Float(0)
    var G2 = Float(0)
    var GS1 = Float(0)
    var GS2 = Float(0)
    
    func calculateSec(n: Float) -> Float {
        return(3600*floor(n)+(n-floor(n))*6000)
    }
    
    @IBAction func disableCustomButton(sender:AnyObject) {
        enableCustom = false
        customWindow.close()
    }
    
    @IBAction func enableCustomButton(sender:AnyObject) {
        periodA = textA.stringValue
        periodB = textB.stringValue
        periodC = textC.stringValue
        periodD = textD.stringValue
        periodE = textE.stringValue
        periodF = textF.stringValue
        periodG = textG.stringValue
        
        AS1 = Float(textA1.stringValue)!
        AS2 = Float(textA2.stringValue)!
        BS1 = Float(textB1.stringValue)!
        BS2 = Float(textB2.stringValue)!
        CS1 = Float(textC1.stringValue)!
        CS2 = Float(textC2.stringValue)!
        DS1 = Float(textD1.stringValue)!
        DS2 = Float(textD2.stringValue)!
        ES1 = Float(textE1.stringValue)!
        ES2 = Float(textE2.stringValue)!
        FS1 = Float(textF1.stringValue)!
        FS2 = Float(textF2.stringValue)!
        GS1 = Float(textG1.stringValue)!
        GS2 = Float(textG2.stringValue)!
        
        /*
        A1 = Float(textA1.stringValue)!
        A1 = calculateSec(A1)
        A2 = Float(textA2.stringValue)!
        A2 = calculateSec(A2)
        B1 = Float(textB1.stringValue)!
        B1 = calculateSec(B1)
        B2 = Float(textB2.stringValue)!
        B2 = calculateSec(B2)
        C1 = Float(textC1.stringValue)!
        C1 = calculateSec(C1)
        C2 = Float(textC2.stringValue)!
        C2 = calculateSec(C2)
        D1 = Float(textD1.stringValue)!
        D1 = calculateSec(D1)
        D2 = Float(textD2.stringValue)!
        D2 = calculateSec(D2)
        E1 = Float(textE1.stringValue)!
        E1 = calculateSec(E1)
        E2 = Float(textE2.stringValue)!
        E2 = calculateSec(E2)
        F1 = Float(textF1.stringValue)!
        F1 = calculateSec(F1)
        F2 = Float(textF2.stringValue)!
        F2 = calculateSec(F2)
        G1 = Float(textG1.stringValue)!
        G1 = calculateSec(G1)
        G2 = Float(textG2.stringValue)!
        G2 = calculateSec(G2)
        */
        enableCustom = true
        customWindow.close()
        
        
    }
    
    
    
}

