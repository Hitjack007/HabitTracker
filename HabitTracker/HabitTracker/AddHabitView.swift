//
//  AddHabitView.swift
//  HabitTracker
//
//  Created by Mark Greene on 10/07/2025.
//
import SwiftUI

struct AddHabitView: View {
    @Environment(\.dismiss) var dismiss
    @Bindable var habits: Habits
    
    @State private var title = ""
    @State private var description = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $title)
                TextField("Description", text: $description)
            }
            .navigationTitle("Add New Habit")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let newHabit = Habit(title: title, description: description, count: 0)
                        habits.habits.append(newHabit)
                        dismiss()
                    }
                    .disabled(title.trimmingCharacters(in: .whitespaces).isEmpty)
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}
