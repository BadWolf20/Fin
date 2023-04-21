//
//  StorageManager.swift
//  Fin
//
//  Created by Roman on 11.01.2023.
//

import Foundation

enum StorageManagerKey: String, CaseIterable {
    case userId
    case notFirstLaunch
    case mounthBalance
    case dayBalance
}

protocol AppDelegateStorageManager {
    func hasFirstLaunch() -> Bool
    func setHasFirstLaunch(bool: Bool)
    func setMounthBalance(str: String)
    func getMounthBalance() -> String
    func setDayBalance(str: String)
    func getDayBalance() -> String


}

protocol UserDefaultsStorageManager {
    func saveBoolToUserDefaults(bool: Bool, key: StorageManagerKey)
    func getBoolFromUserDefaults(key: StorageManagerKey) -> Bool
    func saveStringToUserDefaults(string: String, key: StorageManagerKey)
    func getStringFromUserDefaults(key: StorageManagerKey) -> String?

}

extension StorageManager: AppDelegateStorageManager {
    func hasFirstLaunch() -> Bool {
        getBoolFromUserDefaults(key: StorageManagerKey.notFirstLaunch)
    }

    func setHasFirstLaunch(bool: Bool) {
        saveBoolToUserDefaults(bool: bool, key: StorageManagerKey.notFirstLaunch)
    }

    func setMounthBalance(str: String) {
        saveStringToUserDefaults(string: str, key: StorageManagerKey.mounthBalance)
    }

    func getMounthBalance() -> String {
        guard let str = getStringFromUserDefaults(key: StorageManagerKey.mounthBalance) else { return "Error"}
        return str
    }

    func setDayBalance(str: String) {
        saveStringToUserDefaults(string: str, key: StorageManagerKey.dayBalance)
    }

    func getDayBalance() -> String {
        guard let str = getStringFromUserDefaults(key: StorageManagerKey.dayBalance) else { return "Error"}
        return str
    }

}

extension StorageManager: UserDefaultsStorageManager {
    func saveBoolToUserDefaults(bool: Bool, key: StorageManagerKey) {
        UserDefaults.standard.set(bool, forKey: key.rawValue)
    }

    func getBoolFromUserDefaults(key: StorageManagerKey) -> Bool {
        UserDefaults.standard.bool(forKey: key.rawValue)
    }

    func saveStringToUserDefaults(string: String, key: StorageManagerKey) {
        UserDefaults.standard.set(string, forKey: key.rawValue)
    }

    func getStringFromUserDefaults(key: StorageManagerKey) -> String? {
        UserDefaults.standard.string(forKey: key.rawValue)
    }

}

class StorageManager {
    private struct Constants {
    }
}
