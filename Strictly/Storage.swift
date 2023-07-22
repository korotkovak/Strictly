//
//  Storage.swift
//  Strictly
//
//  Created by Kristina Korotkova on 23/07/23.
//

import Foundation

protocol LocalStorageType {
    func save<T>(_ value: T, for key: String)
    func fetchValue<T>(type: T.Type, for key: String) -> T?
    func isExchangeRateSetInUserDefaults() -> Bool
    func setInUserDefaults()
}

final class LocalStorage: LocalStorageType {

    private let userDefaults: UserDefaults

    init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
    }

    func save<T>(_ value: T, for key: String) {
        userDefaults.set(value, forKey: key)
    }

    func fetchValue<T>(type: T.Type, for key: String) -> T? {
        userDefaults.value(forKey: key) as? T
//        userDefaults.data(forKey: key) as? T
    }

    func isExchangeRateSetInUserDefaults() -> Bool {
        userDefaults.bool(forKey: "ExchangeRateSet")
    }

    func setInUserDefaults() {
        userDefaults.set(true, forKey: "ExchangeRateSet")
    }
}
