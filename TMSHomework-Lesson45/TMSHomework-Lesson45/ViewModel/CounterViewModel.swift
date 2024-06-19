//
//  CounterViewModel.swift
//  TMSHomework-Lesson45
//
//  Created by Наталья Мазур on 28.05.24.
//

import Foundation
import Combine

class CounterViewModel {
    
    private var cancellable: [AnyCancellable] = []
    private var counter = CounterModel.counterPublisher
    
    func bindCounter(completion: @escaping (Int) -> ()) {
        counter.sink(receiveCompletion: {_ in}) { value in
            completion(value)
            
        }.store(in: &cancellable)
    }
    
    func incrementValue() {
        counter.send(self.counter.value + 1)
    }
    
    func decrementValue() {
        counter.send(self.counter.value - 1)
    }
    
}
