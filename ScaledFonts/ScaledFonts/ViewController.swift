//
//  ViewController.swift
//  ScaledFonts
//
//  Created by Mansi Shah on 1/27/18.
//  Copyright © 2018 Mansi Shah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCustomFont()
        myLabel.text = "Let's see our custom Fonts in action..."
        myLabel.textColor = .red
    }

    func setCustomFont() {
        myLabel.font = getScaledFont(forFont: "Cambria-Bold", textStyle: .title1)
        myLabel.adjustsFontForContentSizeCategory = true
    }
    
    
    /// Get the Scaled version of your UIFont.
    ///
    /// - Parameters:
    ///   - name: Name of the UIFont whose scaled version you wish to obtain.
    ///   - textStyle: The text style for your font, i.e Body, Title etc...
    /// - Returns: The scaled UIFont version with the given textStyle
    func getScaledFont(forFont name: String, textStyle: UIFontTextStyle) -> UIFont {
        
        /// Uncomment the code below to check all the available fonts and have them printed in the console to double check the font name with existing fonts 😉
        
        /*for family: String in UIFont.familyNames
         {
         print("\(family)")
         for names: String in UIFont.fontNames(forFamilyName: family)
         {
         print("== \(names)")
         }
         }*/
        
        let userFont =  UIFontDescriptor.preferredFontDescriptor(withTextStyle: textStyle)
        let pointSize = userFont.pointSize
        guard let customFont = UIFont(name: name, size: pointSize) else {
            fatalError("""
        Failed to load the "\(name)" font.
        Make sure the font file is included in the project and the font name is spelled correctly.
        """
            )
        }
        return UIFontMetrics.default.scaledFont(for: customFont)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

