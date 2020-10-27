//
//  ViewController.swift
//  Compositional-Layout
//
//  Created by Tsering Lama on 10/26/20.
//

import UIKit

class GridViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    private func createLayout() {
        // 1) Create and configure the item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.25), heightDimension: .fractionalHeight(1.0))
        
    }


    private func configureCollectionView() {
        
    }
    
}

