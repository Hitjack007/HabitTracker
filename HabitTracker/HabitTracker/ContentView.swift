//
//  ContentView.swift
//  HabitTracker
//
//  Created by Mark Greene on 10/07/2025.
//
import SwiftUI

struct ContentView: View {
    @State private var showingAddHabit = false
    @State private var habits = Habits()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(habits.habits) { habit in
                    NavigationLink(value: habit) {
                        VStack(alignment: .leading) {
                            Text(habit.title)
                                .font(.headline)
                            Text("Completed \(habit.count) times")
                                .foregroundColor(.secondary)
                                .font(.subheadline)
                        }
                    }
                }
                .onDelete { indexSet in
                    habits.habits.remove(atOffsets: indexSet)
                }
            }
            .navigationTitle("Habit Tracker")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showingAddHabit = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddHabit) {
                AddHabitView(habits: habits)
            }
            .navigationDestination(for: Habit.self) { habit in
                HabitDetailView(habit: habit, habits: habits)
            }
        }
    }
}
