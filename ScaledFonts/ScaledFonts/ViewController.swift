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
        /// Uncomment the code below to check all the available fonts and have them printed in the console 😉
        
        /*for family: String in UIFont.familyNames
        {
            print("\(family)")
            for names: String in UIFont.fontNames(forFamilyName: family)
            {
                print("== \(names)")
            }
        }*/
        
        
        
        let userFont =  UIFontDescriptor.preferredFontDescriptor(withTextStyle: .title1)
        let pointSize = userFont.pointSize
        guard let customFont = UIFont(name: "Cambria-Bold", size: pointSize) else {
            fatalError("""
        Failed to load the "cambriab" font.
        Make sure the font file is included in the project and the font name is spelled correctly.
        """
            )
        }
        myLabel.font = UIFontMetrics.default.scaledFont(for: customFont)
        myLabel.adjustsFontForContentSizeCategory = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

