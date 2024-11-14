//
//  MidnighDashboard.swift
//  Dashboard
//
//  Created by Lasha Tavberidze on 14.11.24.
//

import SwiftUI
import Charts

struct MidnightDashboard: View {
    @State private var selectedSection: DashboardSection? = .dashboard
    @State private var columnVisibility = NavigationSplitViewVisibility.automatic
    
        let stats = [
        StatItem(title: "Active Projects", value: "12", icon: "chart.bar"),
        StatItem(title: "Pending Tasks", value: "24", icon: "clock"),
        StatItem(title: "Total Clients", value: "36", icon: "person.2"),
        StatItem(title: "Revenue", value: "$45,000", icon: "dollarsign.circle")
    ]
    
    let revenueData = [
        RevenueData(month: "Jan", revenue: 4000),
        RevenueData(month: "Feb", revenue: 3000),
        RevenueData(month: "Mar", revenue: 5000),
        RevenueData(month: "Apr", revenue: 4500),
        RevenueData(month: "May", revenue: 6000),
        RevenueData(month: "Jun", revenue: 5500)
    ]
    
    let activities = [
        ActivityItem(text: "New invoice created for Client A", time: "2 hours ago"),
        ActivityItem(text: "Project X milestone completed", time: "4 hours ago"),
        ActivityItem(text: "Meeting scheduled with Team B", time: "6 hours ago")
    ]
    
    let tasks = [
        TaskItem(title: "Client presentation", deadline: "Tomorrow, 10:00 AM", priority: .high),
        TaskItem(title: "Design review", deadline: "Friday, 2:00 PM", priority: .medium),
        TaskItem(title: "Team sync", deadline: "Next Monday", priority: .low)
    ]
    
    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            // Sidebar
            List(DashboardSection.allCases, id: \.self, selection: $selectedSection) { section in
                Label(section.rawValue, systemImage: section.icon)
            }
            .navigationTitle("Midnight UI")
            
        } detail: {
            // Main Content
            NavigationStack {
                Group {
                    switch selectedSection {
                    case .dashboard:
                        mainDashboardView
                    case .projects:
                        Text("Projects View")
                    case .clients:
                        Text("Clients View")
                    case .invoices:
                        Text("Invoices View")
                    case .calendar:
                        Text("Calendar View")
                    case .none:
                        Text("Select a section")
                    }
                }
            }
        }
    }
    
    // MARK
    private var mainDashboardView: some View {
        ScrollView {
            VStack(spacing: 20) {
                statsGrid
                revenueChart
                
                HStack(spacing: 20) {
                    activityCard
                    taskCard
                }
                .padding(.horizontal)
            }
            .padding(.top)
        }
        .navigationTitle("Dashboard")
        .background(Color(.systemBackground))
    }
    
    
    private var statsGrid: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 2), spacing: 20) {
            ForEach(stats) { stat in
                StatCard(item: stat)
            }
        }
        .padding(.horizontal)
    }
    
    private var revenueChart: some View {
        VStack(alignment: .leading) {
            Text("Revenue Overview")
                .font(.title3.bold())
                .padding(.horizontal)
            
            Chart {
                ForEach(revenueData) { item in
                    LineMark(
                        x: .value("Month", item.month),
                        y: .value("Revenue", item.revenue)
                    )
                    .foregroundStyle(Color.accentColor)
                    
                    PointMark(
                        x: .value("Month", item.month),
                        y: .value("Revenue", item.revenue)
                    )
                    .foregroundStyle(Color.accentColor)
                }
            }
            .frame(height: 300)
            .padding()
        }
        .background(Color(.secondarySystemBackground))
        .cornerRadius(15)
        .padding(.horizontal)
    }
    
    private var activityCard: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Recent Activity")
                .font(.title3.bold())
            
            ForEach(activities) { activity in
                VStack(alignment: .leading, spacing: 5) {
                    Text(activity.text)
                    Text(activity.time)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding()
                .background(Color(.tertiarySystemBackground))
                .cornerRadius(10)
            }
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(15)
    }
    
    private var taskCard: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Upcoming Tasks")
                .font(.title3.bold())
            
            ForEach(tasks) { task in
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(task.title)
                        Text(task.deadline)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                    
                    Text(task.priority.rawValue.capitalized)
                        .font(.caption)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(task.priority.color.opacity(0.2))
                        .foregroundColor(task.priority.color)
                        .cornerRadius(5)
                }
                .padding()
                .background(Color(.tertiarySystemBackground))
                .cornerRadius(10)
            }
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(15)
    }
}

struct MidnightDashboard_Previews: PreviewProvider {
    static var previews: some View {
        MidnightDashboard()
            .preferredColorScheme(.dark)
    }
}
