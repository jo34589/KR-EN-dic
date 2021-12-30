//
//  ContentView.swift
//  KR-EN dic
//
//  Created by 엔나루 on 2021/12/29.
//

import SwiftUI

struct ContentView: View {
    @State private var word: String = ""
    @State private var result: String = "result here"
    var body: some View {
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
                        Task {
                            await requestMeaning(word: word) { str in
                                result = parseMeaning(str)
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
                
                TextEditor(text: $result)
                    .textFieldStyle(.roundedBorder)
                    .foregroundColor(.black)
                    .border(.black, width: 2)
                    .padding(5)
                
                Text("powered by krdict.korean.go.kr")
                    .font(.footnote)
            }
            .padding()
            .navigationTitle("KR-EN dictionary")
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
