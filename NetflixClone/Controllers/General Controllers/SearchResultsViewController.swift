//
//  SearchReponseViewController.swift
//  NetflixClone
//
//  Created by Jason Dubon on 5/26/22.
//

import UIKit

class SearchResultsViewController: UIViewController {

    public var titles: [Title] = [Title]()
    
    public let searchResultsCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize  = CGSize(width: UIScreen.main.bounds.width/3, height: 200)
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: TitleCollectionViewCell.identifier)
        
        return collectionView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        view.backgroundColor = .systemBackground
        view.addSubview(searchResultsCollectionView)
        
        searchResultsCollectionView.delegate = self
        searchResultsCollectionView.dataSource = self
    
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        searchResultsCollectionView.frame = view.bounds
    }
 
}

extension SearchResultsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifier, for: indexPath) as? TitleCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configurePosters(with: titles[indexPath.row].poster_path ?? "")
        
        return cell
    }
    

    
}
