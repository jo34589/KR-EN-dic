//
//  ContentView.swift
//  KR-EN dic
//
//  Created by 엔나루 on 2021/12/29.
//

import SwiftUI
import SwiftyXMLParser

struct ContentView: View {
    @State private var word: String = ""
    @State private var result: [WordData]? = [initialWord]
    @State private var isLoading: Bool = false
    @State private var isPresented: Bool = false
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack{
                    HStack {
                        TextField("search korean word", text: $word)
                            .textFieldStyle(.roundedBorder)
                            .padding(5)
                            .disableAutocorrection(true)
                            .textContentType(.none)
                            .textInputAutocapitalization(.none)
                        Button {
                            isLoading = true
                            Task {
                                await requestMeaning(word: word) { str in
                                    result = parseMeaning(str)
                                    isLoading = false
                                    if result == nil {
                                        isPresented = true
                                    } else if result!.isEmpty {
                                        isPresented = true
                                    }
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
        .alert(isPresented: $isPresented) {
            if result == nil {
                return Alert(title: Text("Error"), message: Text("Bad internet connection"), dismissButton: .default(Text("OK")))
            } else if result!.isEmpty {
                return Alert(title: Text("No Result"), message: Text("No matching word exists in dictionary"), dismissButton: .default(Text("OK")))
            } else {
                return Alert(title: Text(""), message: nil, dismissButton: .cancel())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
