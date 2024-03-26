//
//  ActivityView.swift
//  Friends
//
//  Created by Shomil Singh on 26/03/24.
//

import SwiftUI

struct ActivityView: View {
    let isactive : Bool
    var body: some View {
        Circle()
            .foregroundStyle(isactive ? Color.green : Color.red)
            .frame(height: 20)
    }
}

#Preview {
    ActivityView(isactive: true)
}
