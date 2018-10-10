//
// Day21ViewController
// 30DaysOfiOS12
//
// Created by DevTechie Interactive on 10/2/18.
// Copyright © 2018 Devtechie. All rights reserved.
//

import UIKit

class Day21ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var data = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Collection View Example"
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.populateData()
    }
    
    func populateData() {
        for i in 0...26 {
            data.append(UIImage(named: "image\(i)")!)
        }
    }
}

extension Day21ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! Day21Cell
        cell.imageV.image = data[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = collectionView.bounds.size.width / 3
        return CGSize(width: itemSize, height: itemSize)
    }
}

