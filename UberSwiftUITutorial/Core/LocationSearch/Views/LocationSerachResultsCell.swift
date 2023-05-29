//
//  LocationSerachResultsCell.swift
//  UberSwiftUITutorial
//
//  Created by Andrey Panov on 28/05/2023.
//

import SwiftUI

struct LocationSerachResultsCell: View {
    let title: String
    let subtitle: String
    
    var body: some View {
        HStack {
            Image(systemName: "mappin.circle.fill")
                .resizable()
                .foregroundColor(.blue)
                .accentColor(.white)
                .frame(width: 40, height: 40)
            
            VStack(alignment: .leading,spacing: 4) {
                Text(title)
                    .font(.body)
                Text(subtitle)
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
                Divider()
            }
            .padding(.leading, 8)
        }
        .padding(.leading)
        .padding(.vertical, 8)
    }
}

struct LocationSerachResultsCell_Previews: PreviewProvider {
    static var previews: some View {
        LocationSerachResultsCell(title: "Starbucks", subtitle: "123 Main St.")
    }
}
