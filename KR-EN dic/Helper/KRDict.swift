//
//  KRDict.swift
//  KR-EN dic
//
//  Created by 엔나루 on 2021/12/29.
//

import Foundation
import Alamofire

func requestMeaning(word: String, param: SearchParam, completion: @escaping((String)->Void)) async -> Void {
    let url = "https://krdict.korean.go.kr/api/search"
    
    let num = (param.num+1)*10
    
    //["dict", "popular"]
    var sort: String = ""
    switch param.sort {
    case 0:
        sort = "dict"
    case 1:
        sort = "popular"
    default:
        ()
    }
    /*
    //["word", "idiom", "proverb", "definition", "usage"]
    var part: String = ""
    switch param.part {
    case 0:
        part = "word"
    case 1:
        part = "ip"
    case 2:
        part = "dfn"
    case 3:
        part = "exam"
    default:
        ()
    }
     */
    
    
    let param:Parameters = [
        "key" : "7B5E3914BA3964FD21F83D765FBC6F75",
        "q" : word,
        "num" : num,
        "sort" : sort,
        "part" : "word",
        "translated" : "y",
        "trans_lang" : "1"
    ]
    
    AF.request(url, method: .get, parameters: param).responseString { response in
        print(param)
        if let value = response.value {
            //print(value)
            
            completion(value)
        }
    }
}
