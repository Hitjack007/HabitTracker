//
//  HabitDetailView.swift
//  HabitTracker
//
//  Created by Mark Greene on 10/07/2025.
//
import SwiftUI

struct HabitDetailView: View {
    var habit: Habit
    @Bindable var habits: Habits

    var body: some View {
        VStack(spacing: 16) {
            Text(habit.description)
                .font(.body)
                .padding(.horizontal)
            
            Text("Completed \(habit.count) times")
                .font(.title2)
                .bold()
                .padding()
            
            Button("Mark as Completed") {
                if let index = habits.habits.firstIndex(of: habit) {
                    var updated = habit
                    updated.count += 1
                    habits.habits[index] = updated
                }
            }
            .padding()
            .buttonStyle(.borderedProminent)
            
            Spacer()
        }
        .navigationTitle(habit.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

