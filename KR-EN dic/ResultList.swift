//
//  ResultList.swift
//  KR-EN dic
//
//  Created by 엔나루 on 2022/01/04.
//

import SwiftUI

struct ResultList: View {
    
    var wordDatas: [WordData]
    
    var body: some View {
        List{
            ForEach(wordDatas) { wordData in
                ResultRow(wordData: wordData)
                    .frame(height: 450)
            }
        }
        .listStyle(.plain)
        .border(.black, width: 2)
    }
}

struct ResultList_Previews: PreviewProvider {
    static var previews: some View {
        ResultList(wordDatas: modelWords)
            
    }
}
