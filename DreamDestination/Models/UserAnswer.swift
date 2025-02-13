//
//  UserAnswer.swift
//  DreamDestination
//
//  Created by Anastasya Maximova on 13.02.2025.
//

import Foundation

struct UserAnswer {
    let budget: Double
    let vacationDays: Int
    let preferredClimate: Climate
    let preferredVacationType: VacationType
    
    // Функция для фильтрации стран по критериям
    
    static func findSuitableCountries(for answer: UserAnswer, from countries: [Country]) -> [Country] {
        return countries.filter { country in
            // Фильтрация по бюджету
            let dailyBudget = answer.budget / Double(answer.vacationDays)
            guard country.dailyBudget <= dailyBudget else { return false }
            
            // Фильтрация по климату
            guard country.climate == answer.preferredClimate else { return false }
            
            // Фильтрация по типу отдыха
            guard country.vacationTypes.contains(answer.preferredVacationType) else { return false }
            
            // Фильтрация по продолжительности отдыха
            guard country.duration <= answer.vacationDays else { return false }
            return true
        }
    }
}



//Предложение по реализации

let countries = Country.getCountries()

// Инициализируем критерии пользователя из введенных пользователем данных
let userAnswer = UserAnswer(budget: 200000.00, vacationDays: 14, preferredClimate: .temperate, preferredVacationType: .beach)

// Находим подходящие страны
let suitableCountries = UserAnswer.findSuitableCountries(for: userAnswer, from: countries)

// Выводим результат

//if suitableCountries.isEmpty {
//   print("Подходящих стран не найдено.")
//} else {
//   print("Подходящие страны:")
//   for country in suitableCountries {
//       print("- \(country.description)")
//   }
//}
