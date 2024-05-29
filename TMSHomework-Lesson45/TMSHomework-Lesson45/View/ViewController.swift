//
//  ViewController.swift
//  TMSHomework-Lesson45
//
//  Created by Наталья Мазур on 28.05.24.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    private let vm = CounterViewModel()
    
    lazy var minusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 15
        button.setTitle("-", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.red, for: .focused)
        button.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var plusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 15
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.red, for: .focused)
        button.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var counterLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupLabelText()
    }
    
    private func setupUI() {
        view.addSubview(minusButton)
        view.addSubview(counterLabel)
        view.addSubview(plusButton)
        
        NSLayoutConstraint.activate([
            counterLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            counterLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            counterLabel.widthAnchor.constraint(equalToConstant: 50),
            counterLabel.heightAnchor.constraint(equalToConstant: 50),
            
            minusButton.trailingAnchor.constraint(equalTo: counterLabel.leadingAnchor, constant: -20),
            minusButton.topAnchor.constraint(equalTo: counterLabel.topAnchor),
            minusButton.widthAnchor.constraint(equalToConstant: 50),
            minusButton.heightAnchor.constraint(equalToConstant: 50),
            
            plusButton.leadingAnchor.constraint(equalTo: counterLabel.trailingAnchor, constant: 20),
            plusButton.topAnchor.constraint(equalTo: counterLabel.topAnchor),
            plusButton.widthAnchor.constraint(equalToConstant: 50),
            plusButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    private func setupLabelText() {
        vm.bindCounter { counter in
            self.counterLabel.text = String("\(counter)")
        }
    }
    
    @objc func minusButtonTapped() {
        vm.incrementValue()
    }
    
    @objc func plusButtonTapped() {
        vm.decrementValue()
    }

}


