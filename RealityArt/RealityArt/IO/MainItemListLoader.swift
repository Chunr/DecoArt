//
//  MainListLoader.swift
//  RealityArt
//
//  Created by Chun Chen on 7/18/15.
//  Copyright (c) 2015 Chun Chen. All rights reserved.
//

class MainItemListLoader {
    
    static func load() -> [MainItem] {
        var items = [MainItem]()
        items.append(get(1, imageId: 1, description: "This is a beautiful collection"))
        items.append(get(2, imageId: 2, description: "Sed ut perspiciatis unde omnis iste natus"))
        items.append(get(3, imageId: 3, description: "Sit voluptatem accusantium doloremque laudantium"))
        items.append(get(4, imageId: 4, description: "Eos qui ratione voluptatem sequi nesciunt"))
        items.append(get(5, imageId: 5, description: "Nor again is there anyone who loves"))
        items.append(get(6, imageId: 6, description: "At vero eos et accusamus et iusto odio dignissimos ducimus"))
        items.append(get(7, imageId: 7, description: "Ut enim ad minima veniam, quis nostrum exercitationem"))
        return items
    }
    
    static func get(id: Int, imageId: Int, description: String) -> MainItem {
        var item = MainItem()
        item.id = id
        item.imageId = imageId
        item.description = description
        return item
    }
}
