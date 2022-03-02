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
    
    let param:Parameters = [
        "key" : "7B5E3914BA3964FD21F83D765FBC6F75",
        "q" : word,
        "num" : param.num,
        "sort" : param.sort,
        "part" : param.part,
        "translated" : "y",
        "trans_lang" : "1"
    ]
    
    AF.request(url, method: .get, parameters: param).responseString { response in
        if let value = response.value {
            //print(value)
            
            completion(value)
        }
    }
}
