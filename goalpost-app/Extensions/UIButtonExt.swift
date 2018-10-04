//
//  UIButtonExt.swift
//  goalpost-app
//
//  Created by 김영석 on 2018. 10. 4..
//  Copyright © 2018년 김영석. All rights reserved.
//

import UIKit

extension UIButton {
    func setSelectColor() {
        self.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
    }
    
    func setDeselectColor() {
        self.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
    }
}
