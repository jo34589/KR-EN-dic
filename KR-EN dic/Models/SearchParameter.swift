//
//  SearchParameter.swift
//  KR-EN dic
//
//  Created by 엔나루 on 2022/01/13.
//

import Foundation

class SearchParam: ObservableObject {
    @Published var num: Int
    @Published var sort: String
    @Published var part: String
    
    init(num: Int, sort: String, part: String) {
        self.num = num
        self.sort = sort
        self.part = part
    }
}

let defaultParam = SearchParam(num: 10, sort: "dict", part: "word")

