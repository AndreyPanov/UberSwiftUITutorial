//
//  RideRequestView.swift
//  UberSwiftUITutorial
//
//  Created by Andrey Panov on 28/05/2023.
//

import SwiftUI

struct RideRequestView: View {
    @State private var selectedType: RideType = .uberX
    var body: some View {
        VStack {
            Capsule()
                .foregroundColor(Color(.systemGray5))
                .frame(width: 48, height: 6)
                .padding(.top, 8)
            //trip info view
                HStack {
                    VStack {
                        Circle()
                            .fill(Color(.systemGray3))
                            .frame(width: 8, height: 8)
                        
                        Rectangle()
                            .fill(Color(.systemGray3))
                            .frame(width: 1, height: 32)
                        
                        Rectangle()
                            .fill(Color(.black))
                            .frame(width: 8, height: 8)
                    }
                    
                    VStack(alignment: .leading, spacing: 24) {
                        HStack {
                            Text("Current location")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.gray)
                            
                            Spacer()
                            
                            Text ("1:30 PM")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.gray)
                        }
                        .padding(.bottom, 10)
                        
                        HStack {
                            Text("Starbucks Coffee")
                                .font(.system(size: 16, weight: .semibold))
                            
                            Spacer()
                            
                            Text ("1:45 PM")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.gray)
                        }
                        .padding(.bottom, 1)
                    }
                    .padding(.leading, 8)
                }
                .padding()
            
            Divider()
            //ride type selection
            Text("SUGGESTED RIDES")
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding()
                .foregroundColor(Color(.gray))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ScrollView(.horizontal) {
                HStack(spacing: 12) {
                    ForEach(RideType.allCases) { type in
                        VStack(alignment: .leading) {
                            Image(type.imageName)
                                .resizable()
                                .scaledToFit()
                            VStack(alignment: .leading, spacing: 4) {
                                Text(type.description)
                                    .font(.system(size: 14, weight: .semibold))
                                Text("$22.04")
                                    .font(.system(size: 14, weight: .semibold))
                            }
                            .padding(8)
                        }
                        .frame(width: 112, height: 140)
                        .foregroundColor(type == selectedType ? .white : .black)
                        .background(Color(type == selectedType ? .systemBlue : .systemGroupedBackground))
                        .scaleEffect(type == selectedType ? 1.10 : 1.0)
                        .cornerRadius(10)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                selectedType = type
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
            
            Divider()
                .padding(.vertical, 8)
            
            //payment options
            HStack(spacing: 12) {
                Text("Visa")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(6)
                    .background(.blue)
                    .cornerRadius(4)
                    .foregroundColor(.white)
                    .padding(.leading)
                
                Text("**** 1234")
                    .fontWeight(.bold)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .imageScale(.medium)
            }
            .frame(height: 50)
            .background(Color(.systemGroupedBackground))
            .cornerRadius(10)
            .padding(.horizontal)
            
            //request ride button
            Button {
                
            } label: {
                Text("CONFIRM RIDE")
                    .fontWeight(.bold)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding(.bottom, 24)
        .background(.white)
        .cornerRadius(12)
    }
}

struct RideRequestView_Previews: PreviewProvider {
    static var previews: some View {
        RideRequestView()
    }
}
