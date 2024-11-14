//
//  taskModel.swift
//  Dashboard
//
//  Created by Lasha Tavberidze on 14.11.24.
//

import Foundation
import SwiftUI
import Charts


enum DashboardSection: String, CaseIterable {
    case dashboard = "Dashboard"
    case projects = "Projects"
    case clients = "Clients"
    case invoices = "Invoices"
    case calendar = "Calendar"
    
    var icon: String {
        switch self {
        case .dashboard: return "square.grid.2x2"
        case .projects: return "list.bullet"
        case .clients: return "person.2"
        case .invoices: return "dollarsign.circle"
        case .calendar: return "calendar"
        }
    }
}


struct StatItem: Identifiable {
    let id = UUID()
    let title: String
    let value: String
    let icon: String
}

struct RevenueData: Identifiable {
    let id = UUID()
    let month: String
    let revenue: Double
}

struct ActivityItem: Identifiable {
    let id = UUID()
    let text: String
    let time: String
}

struct TaskItem: Identifiable {
    let id = UUID()
    let title: String
    let deadline: String
    let priority: Priority
    
    enum Priority: String {
        case high, medium, low
        
        var color: Color {
            switch self {
            case .high: return .red
            case .medium: return .orange
            case .low: return .green
            }
        }
    }
}
