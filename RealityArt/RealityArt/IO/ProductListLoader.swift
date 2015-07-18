//
//  ProductListLoader.swift
//  RealityArt
//
//  Created by Chun Chen on 7/18/15.
//  Copyright (c) 2015 Chun Chen. All rights reserved.
//

class ProductListLoader {
    
    static func load() -> [Product] {
        var items = [Product]()
        items.append(get(1, imageId: 1, name: "Lorem ipsum dolor", price: 1000))
        items.append(get(2, imageId: 2, name: "Sit amet consectetur", price: 235))
        items.append(get(3, imageId: 3, name: "Adipiscing elit", price: 999))
        items.append(get(4, imageId: 4, name: "Sed do eiusmod tempor", price: 150))
        items.append(get(5, imageId: 5, name: "Incididunt ut labore", price: 655))
        items.append(get(6, imageId: 6, name: "Et dolore magna", price: 935))
        items.append(get(7, imageId: 7, name: "Aliqua Ut enim ad minim", price: 645))
        items.append(get(8, imageId: 8, name: "Veniam quis", price: 10))
        items.append(get(9, imageId: 9, name: "Nostrud exercitation", price: 550))
        return items
    }
    
    static func get(id: Int, imageId: Int, name: String, price: Int) -> Product {
        var item = Product()
        item.id = id
        item.imageId = imageId
        item.name = name
        item.price = price
        return item
    }
}