//
//  SectionHeader.swift
//  StickyHeaders
//
//  Created by Bart Jacobs on 01/10/16.
//  Copyright © 2016 Cocoacasts. All rights reserved.
//

import UIKit

class SectionHeader: UICollectionReusableView {

    // MARK: - Properties

    @IBOutlet var titleLabel: UILabel!

    // MARK: - Initialization

    override func awakeFromNib() {
        super.awakeFromNib()

        // Configure Title Label
        titleLabel.textColor = .white
    }

}
