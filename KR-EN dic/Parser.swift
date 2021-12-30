//
//  Parser.swift
//  KR-EN dic
//
//  Created by 엔나루 on 2021/12/30.
//

import Foundation
import SwiftyXMLParser

func parseMeaning(_ xmlString: String) -> String {
    var rtn: String = ""
    
    do {
        let xml = try XML.parse(xmlString)
        if let wordCount = xml.channel.item.all?.count {
            for i in 0 ..< wordCount {
                if let word = xml.channel.item[i].word.text {
                    //print(word)
                    rtn.append("\(i): \(word)\n")
                    if let senseCount = xml.channel.item[i].sense.all?.count {
                        for j in 0 ..< senseCount {
                            //if let sense = xml.channel.item[i].sense[j].definition.text {
                                //print(sense)
                                //rtn.append("\(j): \(sense)")
                            //}
                            if let transWordData = xml.channel.item[i].sense[j].translation.trans_word.element?.CDATA,
                               let transWordString = String(data: transWordData, encoding: .utf8) {
                                //print(transWordString)
                                rtn.append(" translation: \(transWordString)\n")
                            }
                            if let transSenseData = xml.channel.item[i].sense[j].translation.trans_dfn.element?.CDATA,
                               let transSenseString = String(data: transSenseData, encoding: .utf8) {
                                //print(transSenseString)
                                rtn.append(" meaning: \(transSenseString)\n")
                            }
                            rtn.append("\n")
                        }
                    }
                }
                rtn.append("\n")
            }
        } else {
            print("no matching word exists in dictionary.")
        }
    } catch let e as NSError {
        print("Invalid XML String: \(e.localizedDescription)")
    }
    
    return rtn
}
