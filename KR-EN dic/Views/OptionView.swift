//
//  OptionView.swift
//  KR-EN dic
//
//  Created by 엔나루 on 2022/01/13.
//

import SwiftUI

struct OptionView: View {
    @EnvironmentObject var param: SearchParam
    private var numrange = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
    private var sortrange = ["dict", "popular"]
    //private var partrange = ["word", "idiom & proverb", "definition", "ueage"]
    
    var body: some View {
        NavigationView {
            List {
                Section("number of maximum search results") {
                    Picker("number of search results", selection: $param.num) {
                        ForEach(0 ..< numrange.count) {
                            Text(String(numrange[$0]))
                        }
                    }
                    .pickerStyle(.wheel)
                }
                Section("sort by") {
                    Picker("sort by", selection: $param.sort) {
                        ForEach(0 ..< sortrange.count) {
                            Text(sortrange[$0])
                        }
                    }
                    .pickerStyle(.segmented)
                }
                /*
                Section("search for") {
                    Picker(selection: $param.part, content: {
                        ForEach(0 ..< partrange.count) {
                            Text(partrange[$0])
                        }
                    }, label: {
                    })
                    .pickerStyle(.inline)
                }
                */
            }
            .navigationTitle("Search Options")
        }
    }
}

struct OptionView_Previews: PreviewProvider {
    static var previews: some View {
        OptionView()
            .environmentObject(defaultParam)
    }
}
