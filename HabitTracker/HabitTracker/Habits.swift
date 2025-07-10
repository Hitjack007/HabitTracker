//
//  Habits.swift
//  HabitTracker
//
//  Created by Mark Greene on 10/07/2025.
//
import Foundation
import SwiftUI

@Observable
class Habits {
    var habits: [Habit] = [] {
        didSet {
            save()
        }
    }
    
    private let saveKey = "SavedHabits"
    
    init() {
        load()
    }
    
    func load() {
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            if let decoded = try? JSONDecoder().decode([Habit].self, from: data) {
                habits = decoded
                return
            }
        }
        habits = []
    }
    
    func save() {
        if let encoded = try? JSONEncoder().encode(habits) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }
}
