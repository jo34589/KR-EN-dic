//
//  ResultRow.swift
//  KR-EN dic
//
//  Created by 엔나루 on 2022/01/04.
//

import SwiftUI

struct ResultRow: View {
    
    var wordData: WordData
    
    var body: some View {
        GeometryReader{ geometry in
            VStack(alignment: .leading, spacing: 3) {
                Text("\(wordData.id+1): \(wordData.word)")
                    .font(.title)
                    .padding(.leading)
                    .padding(.top)
                Text("pos: \(wordData.pos)")
                    .padding(.leading)
                List {
                    Section("senses") {
                        ForEach(wordData.trans) { trans in
                            VStack(alignment: .leading, spacing: 3){
                                Text("trnaslation:\n \(trans.wordTrans)")
                                    .lineLimit(2)
                                Text("meaning:\n \(trans.senseTrans)")
                                    //.lineLimit(4)
                            }
                        }
                    }
                }
                .listStyle(.plain)
            }
        }
    }
}

struct ResultRow_Previews: PreviewProvider {
    static var previews: some View {
        ResultRow(wordData: modelWord1)
            .previewLayout(.fixed(width: 300, height: 500))
    }
}
