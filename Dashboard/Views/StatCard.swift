//
//  StatCard.swift
//  Dashboard
//
//  Created by Lasha Tavberidze on 14.11.24.
//

import SwiftUI

struct StatCard: View {
    let item: StatItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(item.title)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text(item.value)
                    .font(.title2.bold())
            }
            
            Spacer()
            
            Image(systemName: item.icon)
                .font(.title2)
                .foregroundColor(.accentColor)
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(15)
    }
}

