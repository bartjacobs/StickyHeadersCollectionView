//
//  ViewController.swift
//  StickyHeaders
//
//  Created by Bart Jacobs on 01/10/16.
//  Copyright © 2016 Cocoacasts. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties

    fileprivate let CellIdentifier = "Cell"
    fileprivate let HeaderIdentifier = "Header"

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    // MARK: - View Methods

    private func setupCollectionView() {
        // Initialize Collection View Flow Layout
        let layout = StickyHeadersCollectionViewFlowLayout()

        // Initialize Collection View
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)

        // Configure Collection View
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white

        // Register Classes for Cell Reuse
        collectionView.register(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: CellIdentifier)

        // Register XIB for Supplementary View Reuse
        let XIB = UINib.init(nibName: "SectionHeader", bundle: Bundle.main)
        collectionView.register(XIB, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderIdentifier)

        // Add as Subview
        view.addSubview(collectionView)

        // Add Constraints
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }

}

extension ViewController: UICollectionViewDataSource {

    // MARK: - Collection View Data Source Methods

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Int(arc4random_uniform(10) + 2)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Dequeue Reusable Cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier, for: indexPath)

        // Configure Cell
        cell.backgroundColor = UIColor(red:0.2, green:0.25, blue:0.3, alpha:1.0)
        cell.contentView.backgroundColor = UIColor(red:0.2, green:0.25, blue:0.3, alpha:1.0)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        // Dequeue Reusable Supplementary View
        if let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderIdentifier, for: indexPath) as? SectionHeader {
            // Configure Supplementary View
            supplementaryView.backgroundColor = .random()
            supplementaryView.titleLabel.text = "Section \(indexPath.section)"

            return supplementaryView
        }

        fatalError("Unable to Dequeue Reusable Supplementary View")
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    // MARK: - Collection View Delegate Flow Layout Methods
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 44.0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 80.0)
    }

}
