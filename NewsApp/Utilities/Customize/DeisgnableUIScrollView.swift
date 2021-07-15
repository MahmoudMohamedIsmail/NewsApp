//
//  DeisgnableUIScrollView.swift
//  NewsApp
//
//  Created by Mahmoud Ismail on 7/15/21.
//

import UIKit

class DeisgnableUIScrollView: UIScrollView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    private func configure(){
        contentInset = .init(top: 10, left: 0, bottom: 40, right: 0)
    }

}
