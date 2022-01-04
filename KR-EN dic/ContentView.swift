//
//  ContentView.swift
//  KR-EN dic
//
//  Created by 엔나루 on 2021/12/29.
//

import SwiftUI

struct ContentView: View {
    @State private var word: String = ""
    @State private var result: [WordData]? = []
    @State private var isLoading: Bool = false
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack{
                    HStack {
                        TextField("search korean word", text: $word)
                            .textFieldStyle(.roundedBorder)
                            .padding(5)
                            .disableAutocorrection(.none)
                            .textContentType(.none)
                            .textInputAutocapitalization(.none)
                        
                        Button {
                            isLoading = true
                            Task {
                                await requestMeaning(word: word) { str in
                                    result = parseMeaning(str)
                                    isLoading = false
                                }
                            }
                        } label: {
                            Text("search")
                        }
                        .buttonStyle(.borderedProminent)
                        .buttonBorderShape(.roundedRectangle(radius: 10))
                        .foregroundColor(.black)
                        .padding(5)
                    }
                    
                    ResultList(wordDatas: result ?? [])
                    
                    Text("powered by krdict.korean.go.kr")
                        .font(.footnote)
                }
                .padding()
                .navigationTitle("KR-EN dictionary")
            }
            if isLoading {
                LoadingView()
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
