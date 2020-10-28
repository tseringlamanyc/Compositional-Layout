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
        confiugreDataSource()
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
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        //2) Create and configure group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.25))
        //let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 4)
        
        //3) Configure section
        let section = NSCollectionLayoutSection(group: group)
        
        //4) Configure layout
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
    
    // configure Data Source
    private func confiugreDataSource() {
        // 1) Setting up data source
        dataSource = UICollectionViewDiffableDataSource<Section, Int>(collectionView: collectionView, cellProvider: { (collectionView, indexpath, item) -> UICollectionViewCell? in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "labelCell", for: indexpath) as? LabelCell else {
                fatalError("could not deque")
            }
            cell.textlabel.text = "\(item)"
            cell.backgroundColor = .systemBlue
            return cell
        })
        
        // 2) Setting up initial snapshot
        var snapshot = NSDiffableDataSourceSnapshot<Section, Int>()
        snapshot.appendSections([.main]) // only one section
        snapshot.appendItems(Array(1...100))
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
}

