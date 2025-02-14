//
//  Country.swift
//  DreamDestination
//
//  Created by Anastasya Maximova on 13.02.2025.
//

import Foundation

struct Country {
   let name: String
   let dailyBudget: Double
   let climate: Climate
   let vacationTypes: [VacationType]
   let duration: Int
   let description: String
    let flag: Character
    
    static func getCountries() -> [Country] {
        [
            Country(
                name: "Турция",
                dailyBudget: 7500.00,
                climate: .temperate,
                vacationTypes: [.cultural, .beach, .active],
                duration: 3,
                description: "Для вашего отдыха - мечты подойдет Турция. Это уникальная страна, где Восток встречается с Западом, а древние традиции переплетаются с современностью. Здесь вас ждут величественные мечети Стамбула, белоснежные террасы Памуккале, античные руины Эфеса и лазурные пляжи Анталии. Турция предлагает отдых на любой вкус: от культурного туризма до пляжного релакса и гастрономических открытий.",
                flag: "🇹🇷"
            ),
            Country(
                name: "Испания",
                dailyBudget: 14000.00,
                climate: .temperate,
                vacationTypes: [.beach, .cultural],
                duration: 3,
                description: "Для вашего отдыха - мечты подойдет Испания. Это страна, где история, культура и природа сливаются воедино. Здесь вас ждут солнечные пляжи Коста-Брава, архитектурные шедевры Гауди в Барселоне, коррида в Мадриде и вкуснейшая паэлья. Испания идеально подходит для любителей культурного отдыха, гастрономических путешествий и пляжного релакса.",
                flag: "🇪🇸"
            ),
            Country(
                name: "Таиланд",
                dailyBudget: 14000.00,
                climate: .hot,
                vacationTypes: [.beach, .active, .adventure, .cultural],
                duration: 7,
                description: "Для вашего отдыха - мечты подойдет Тайланд. Это страна улыбок, тропических пляжей и экзотической культуры. Здесь вы найдете белоснежные пляжи Пхукета, шумные рынки Бангкока, древние храмы Чиангмая и кристально чистые воды островов Пхи-Пхи. Таиланд подходит для тех, кто ищет пляжный отдых, экзотику и активные приключения.",
                flag: "🇹🇭"
            ),
            Country(
                name: "Норвегия",
                dailyBudget: 20000.00,
                climate: .cold,
                vacationTypes: [.cultural, .active],
                duration: 3,
                description: "Для вашего отдыха - мечты подойдет Норвегия. Это страна фьордов, северного сияния и нетронутой природы. Здесь вы сможете насладиться величественными пейзажами, покататься на лыжах в Осло, увидеть водопады и ледники, а также попробовать свежайшие морепродукты. Норвегия идеальна для любителей активного отдыха и ценителей природы.",
                flag: "🇳🇴"
            ),
            Country(
                name: "Япония",
                dailyBudget: 20000.00,
                climate: .temperate,
                vacationTypes: [.cultural, .adventure],
                duration: 10,
                description: "Для вашего отдыха - мечты подойдет Япония.  Япония — это страна контрастов, где традиции встречаются с современностью. Здесь вы сможете увидеть древние храмы Киото, небоскребы Токио, цветущую сакуру и попробовать суши в самом сердце страны восходящего солнца. Япония подходит для любителей экзотики, технологий и уникальной культуры.",
                flag: "🇯🇵"
            )
        ]
    }
}

enum Climate: String {
   case hot = "Жаркий"
   case temperate = "Умеренный"
   case cold = "Холодный"
}

enum VacationType: String {
   case beach = "Пляжный отдых"
   case adventure = "Приключенческий отдых"
   case cultural = "Культурный отдых"
   case active = "Активный отдых"
}
