//
//  GalleryItemCollectionViewCell.swift
//  UICollectVIew_ImageGallery
//
//  Created by THANH on 4/28/17.
//  Copyright © 2017 THANH. All rights reserved.
//

import UIKit

class GalleryItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var itemImageView: UIImageView!
    //Let’s also add some convenience implementation to the GalleryItemCollectionViewCell class, so that we can update reusable cells easier:
    //func setGalleryItem(_ )
    
    
    //func setGalleryItem(_ item:GalleryItem) {
      //  itemImageView.image = UIImage(named: item.itemImage)
    //}
    func setGalleryItem(_ item:GalleryItem) {
    itemImageView.image = UIImage(named: item.itemImage)
    }
    
    
}
