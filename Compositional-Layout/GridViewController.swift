//
//  ViewController.swift
//  Compositional-Layout
//
//  Created by Tsering Lama on 10/26/20.
//

import UIKit

class GridViewController: UIViewController {
    
    // Setup enum to hold sections
    enum Section {
        case main
    }
    
    @IBOutlet weak var collectionView: UICollectionView! // default is Flow
    
    // declare our data source, diffable data source
    // both section identifier needs to be Hashable
    private var dataSource: UICollectionViewDiffableDataSource<Section, Int>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }
    
    private func configureCollectionView() {
       // collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())  *programmatic*
        
        // change the collectionview's layout *storyboard*
        collectionView.collectionViewLayout = createLayout()
        collectionView.backgroundColor = .systemBackground
        
    }
    
    private func createLayout() -> UICollectionViewLayout {
        // 1) Create and configure the item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.25), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        //2) Create and configure group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.25))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        //3) Configure section
        let section = NSCollectionLayoutSection(group: group)
        
        //4) Configure layout
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
    
    // configure Data Source
    private func confiugreDataSource() {
        // 1)
        dataSource = UICollectionViewDiffableDataSource<Section, Int>(collectionView: collectionView, cellProvider: { (collectionView, indexpath, item) -> UICollectionViewCell? in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "labelCell", for: indexpath) as? LabelCell else {
                fatalError("could not deque")
            }
            return cell 
        })
    }
    
}

