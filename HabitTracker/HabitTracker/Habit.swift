//
//  Habit.swift
//  HabitTracker
//
//  Created by Mark Greene on 10/07/2025.
//
import Foundation

struct Habit: Identifiable, Codable, Equatable, Hashable {
    var id = UUID()
    var title: String
    var description: String
    var count: Int
}
