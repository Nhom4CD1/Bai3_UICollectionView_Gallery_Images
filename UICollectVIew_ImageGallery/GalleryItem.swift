//
//  GalleryItem.swift
//  UICollectVIew_ImageGallery
//
//  Created by THANH on 4/28/17.
//  Copyright © 2017 THANH. All rights reserved.
//

import Foundation
class GalleryItem {
    //Tạo Modal cho GalleryItem
    var itemImage: String
    
    init(dataDictionary:Dictionary<String,String>) {
        itemImage = dataDictionary["itemImage"]!
    }
    
    class func newGalleryItem(_ dataDictionary:Dictionary<String,String>) -> GalleryItem {
        return GalleryItem(dataDictionary: dataDictionary)
}
}
