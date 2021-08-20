//
//  CustomAlert.swift
//  SmartStuff
//
//  Created by Григорий Виняр on 18.08.2021.
//

import UIKit

class CustomAlert: UIView {
    
    // MARK: - Properties
    
    let questionLabel = UILabel()
    let cancelButton = UIButton()
    let deleteButton = UIButton()
    private let stackWithButtons = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureSelf()
        configureQuestionLabel()
        configureCancelButton()
        configureDeleteButton()
        configureStackWithButtons()
        
        setQuestionLabelConstraints()
        setStackWithButtonsConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    func changeQuestion(name: String) {
        self.questionLabel.text = "Вы хотите удалить \(name.lowercased())?"
    }
    
    private func configureSelf() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 24
    }
    
    private func configureStackWithButtons() {
        self.addSubview(stackWithButtons)
        stackWithButtons.axis = .horizontal
        stackWithButtons.alignment = .center
        stackWithButtons.distribution = .fillEqually
        stackWithButtons.spacing = 10
        
        stackWithButtons.addArrangedSubview(cancelButton)
        stackWithButtons.addArrangedSubview(deleteButton)
    }
    
    private func configureDeleteButton() {
        deleteButton.setTitle("Удалить", for: .normal)
        deleteButton.setTitleColor(.white, for: .normal)
        deleteButton.backgroundColor = UIColor(red: 255/255, green: 105/255, blue: 105/255, alpha: 1)
        deleteButton.layer.cornerRadius = 15
    }
    
    private func configureCancelButton() {
        cancelButton.setTitle("Отмена", for: .normal)
        cancelButton.setTitleColor(.white, for: .normal)
        cancelButton.backgroundColor = UIColor(red: 191/255, green: 197/255, blue: 207/255, alpha: 1)
        cancelButton.layer.cornerRadius = 15
    }
    
    private func configureQuestionLabel() {
        self.addSubview(questionLabel)
        questionLabel.text = "There will be some custom question"
        questionLabel.textColor = .black
        questionLabel.font = questionLabel.font.withSize(24)
        questionLabel.numberOfLines = 0
    }
    
    // Constraints
    
    private func setStackWithButtonsConstraints() {
        stackWithButtons.translatesAutoresizingMaskIntoConstraints = false
        stackWithButtons.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 8).isActive = true
        stackWithButtons.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        stackWithButtons.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18).isActive = true
        stackWithButtons.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 55).isActive = true
    }
    
    private func setQuestionLabelConstraints() {
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        questionLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 25).isActive = true
        questionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18).isActive = true
        questionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -71).isActive = true
    }
    
}
