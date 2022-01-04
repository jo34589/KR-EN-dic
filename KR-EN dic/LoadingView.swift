//
//  LoadingView.swift
//  KR-EN dic
//
//  Created by 엔나루 on 2022/01/01.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.gray)
                .ignoresSafeArea()
                .opacity(0.6)

            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .cyan))
                .scaleEffect(3)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
