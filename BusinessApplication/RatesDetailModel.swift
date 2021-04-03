//
//  CurrencyData.swift
//  BusinessApplication
//
//  Created by Szymon Biliński on 22/03/2021.
//

import Foundation

struct RatesDetailModel: Decodable {
    let base: String
    let date: String
    let rates: [RateDetail]
}

struct RateDetail: Decodable {
    let symbol: String
    let currency: String
    let value: Double
}
