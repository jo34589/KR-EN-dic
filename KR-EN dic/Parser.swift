//
//  Parser.swift
//  KR-EN dic
//
//  Created by 엔나루 on 2021/12/30.
//

import Foundation
import SwiftyXMLParser

func parseMeaning(_ xmlString: String) -> [WordData]? {
    var rtnWords: [WordData] = []
    
    do {
        let xml = try XML.parse(xmlString)
        if let wordCount = xml.channel.item.all?.count {
            for i in 0 ..< wordCount {
                var wordData = modelWord1
                if let word = xml.channel.item[i].word.text {
                    //print(word)
                    wordData.id = i
                    wordData.word = word
                    if let posText = xml.channel.item[i].pos.text {
                        var transpos:String {
                            switch posText {
                            case "명사":
                                return pos.명사.rawValue
                            case "대명사":
                                return pos.대명사.rawValue
                            case "동사":
                                return pos.동사.rawValue
                            case "형용사":
                                return pos.형용사.rawValue
                            case "관형사":
                                return pos.관형사.rawValue
                            case "부사":
                                return pos.부사.rawValue
                            case "조사":
                                return pos.조사.rawValue
                            case "감탄사":
                                return pos.감탄사.rawValue
                            case "수사":
                                return pos.수사.rawValue
                            case "의존 명사":
                                return pos.의존명사.rawValue
                            case "접사":
                                return pos.접사.rawValue
                            case "보조 동사":
                                return pos.보조동사.rawValue
                            case "보조 형용사":
                                return pos.보조형용사.rawValue
                            case "어미":
                                return pos.어미.rawValue
                            case "품사 없음":
                                return "no POS"
                            default:
                                return ""
                            }
                        }
                        wordData.pos = transpos
                    }
                    if let senseCount = xml.channel.item[i].sense.all?.count {
                        var translations: [Trans] = []
                        for j in 0 ..< senseCount {
                            var trans: Trans = modelTrans1
                            trans.id = j
                            if let transWordData = xml.channel.item[i].sense[j].translation.trans_word.element?.CDATA,
                               let transWordString = String(data: transWordData, encoding: .utf8) {
                                //print(transWordString)
                                trans.wordTrans = transWordString
                            } else {
                                trans.wordTrans = "(not translatable)"
                            }
                            if let transSenseData = xml.channel.item[i].sense[j].translation.trans_dfn.element?.CDATA,
                               let transSenseString = String(data: transSenseData, encoding: .utf8) {
                                //print(transSenseString)
                                trans.senseTrans = transSenseString
                            } else {
                                trans.senseTrans = "(not translatable)"
                            }
                            translations.append(trans)
                        }
                        wordData.trans = translations
                    }
                    rtnWords.append(wordData)
                }
            }
        } else {
            print("no matching word exists in dictionary.")
            return []
        }
    } catch let e as NSError {
        print("Invalid XML String: \(e.localizedDescription)")
        return nil
    }
    return rtnWords
}
