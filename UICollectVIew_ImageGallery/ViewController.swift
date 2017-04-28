//
//  ViewController.swift
//  UICollectVIew_ImageGallery
//
//  Created by THANH on 4/28/17.
//  Copyright © 2017 THANH. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
        @IBOutlet weak var collectionView: UICollectionView!
    var galleryItems: [GalleryItem] = [] // NEW PROPERTY
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initGalleryItems()
        collectionView.reloadData()        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

 
    //1.Call initGalleryItems in viewDidLoad and reload the collectionview afterwards.
    
    //Ham cai dat GlleryItems
//4.Read gallery items from the plist file and create corresponding model items:
    fileprivate func initGalleryItems() {
        
        var items = [GalleryItem]()
        let inputFile = Bundle.main.path(forResource: "items", ofType: "plist")
        
        let inputDataArray = NSArray(contentsOfFile: inputFile!)
        
        for inputItem in inputDataArray as! [Dictionary<String, String>] {
            let galleryItem = GalleryItem(dataDictionary: inputItem)
            items.append(galleryItem)
        }
        galleryItems = items
    }
    //2. implement UICollectionViewDataSource. Set dataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

   // 3.It is 1 by default, but if you need multiple sections, it should be implemented.
    //Then add a required method collectionView:numberOfItemsInSection: to return number of items in section:}
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return galleryItems.count
}

    //4.The total number of gallery model items is returned here. To create cells implement cellForItemAtIndexPath:
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryItemCollectionViewCell", for: indexPath) as! GalleryItemCollectionViewCell
        
        cell.setGalleryItem(galleryItems[indexPath.row])
        return cell
        
}

//5.We’ll implement only the header view using collectionView:viewForSupplementaryElementOfKind:atIndexPath: method:
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let commentView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "GalleryItemCommentView", for: indexPath) as! GalleryItemCommentView
        
        commentView.commentLabel.text = "Supplementary view of kind \(kind)"
        
        return commentView
}

    // 6.// MARK: - UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let alert = UIAlertController(title: "didSelectItemAtIndexPath:", message: "Indexpath = \(indexPath)", preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "Dismiss", style: .destructive, handler: nil)
        alert.addAction(alertAction)
        
        self.present(alert, animated: true, completion: nil)
}

//


    // 7.MARK: - UICollectionViewFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let picDimension = self.view.frame.size.width / 4.0
        return CGSize(width: picDimension, height: picDimension)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let leftRightInset = self.view.frame.size.width / 14.0
        return UIEdgeInsetsMake(0, leftRightInset, 0, leftRightInset)
}

}










