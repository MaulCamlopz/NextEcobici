//
//  LoaderView.swift
//  Next Ecobici
//
//  Created by Maul Camlopz on 17/10/24.
//

import SwiftUI

struct LoaderView: View {
    var body: some View {
        ProgressView()
            .scaleEffect(2.0, anchor: .center)
            .progressViewStyle(CircularProgressViewStyle(tint: .blue))
    }
}

#Preview {
    LoaderView()
}
