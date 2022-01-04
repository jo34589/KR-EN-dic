//
//  WordDataModel.swift
//  KR-EN dic
//
//  Created by 엔나루 on 2022/01/03.
//

import Foundation

enum pos: String {
    case 명사 = "noun"
    case 대명사 = "pronoun"
    case 동사 = "verb"
    case 형용사 = "adjective"
    case 관형사 = "determiner"
    case 부사 = "adverb"
    case 조사 = "particle"
    case 감탄사 = "interjection"
    case 수사 = "number"
    case 의존명사 = "dependent noun"
    case 접사 = "affix"
    case 보조동사 = "auxiliary verb"
    case 보조형용사 = "auxiliary adjective"
    case 어미 = "ending of a word"
}

struct Trans: Identifiable {
    var id: Int
    var wordTrans: String
    var senseTrans: String
}

struct WordData: Identifiable {
    var id: Int
    var word: String
    var pos: String
    var trans: [Trans]
}


let modelTrans1 = Trans(id: 0, wordTrans: "foo1", senseTrans: "dummy translated sentence")
let modelTrans2 = Trans(id: 1, wordTrans: "foo2", senseTrans: "dummy translated sentence")
let modelWord1 = WordData(id: 0, word: "boo1", pos: "noun", trans: [modelTrans1, modelTrans2])
let modelWord2 = WordData(id: 1, word: "boo2", pos: "pronoun", trans: [modelTrans1, modelTrans2])
let modelWords = [modelWord1, modelWord2]