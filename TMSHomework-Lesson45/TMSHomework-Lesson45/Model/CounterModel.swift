//
//  CounterModel.swift
//  TMSHomework-Lesson45
//
//  Created by Наталья Мазур on 28.05.24.
//

import Foundation
import Combine

class CounterModel {
    private init() { }
    
    static let counterPublisher = CurrentValueSubject<Int, Never>(0)
}
