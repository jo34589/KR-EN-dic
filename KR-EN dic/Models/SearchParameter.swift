//
//  SearchParameter.swift
//  KR-EN dic
//
//  Created by 엔나루 on 2022/01/13.
//

import Foundation

class SearchParam: ObservableObject {
    @Published var num: Int
    @Published var sort: Int
    //@Published var part: Int
    
    init(num: Int, sort: Int) {
        self.num = num
        self.sort = sort
        //self.part = part
    }
}

let defaultParam = SearchParam(num: 0, sort: 0)

