//
//  SmartStuffView.swift
//  SmartStuff
//
//  Created by Григорий Виняр on 19.08.2021.
//

import UIKit

protocol SmartStuffViewDelegate: AnyObject {
    func updateButtonAction()
}

class SmartStuffView: UIView {
    
    // MARK: - Properties
    
    private let smartStuffLabel = UILabel()
    let tableView = UITableView()
    private let updateButton = UIButton()
    private let errorLabel = UILabel()
    let customAlertView = CustomAlert()
    var smartStuffViewDelegate: SmartStuffViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .blackBlue
        
        configureSmartStuffLabel()
        configureTableView()
        configureUpdateButton()
        configureErrorLabel()
        setCustomAlert()
        
        self.activateAllConstraints(smartStuffLabel: smartStuffLabel, tableView: tableView, updateButton: updateButton, customAlert: customAlertView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    private func setCustomAlert() {
        self.addSubview(customAlertView)
        customAlertView.isHidden = true
        customAlertView.center = self.center
    }
    
    private func configureErrorLabel() {
        self.addSubview(errorLabel)
        errorLabel.isHidden = true
        errorLabel.text = "Что то пошло не так, ошибка 123"
        errorLabel.numberOfLines = 0
        errorLabel.font = errorLabel.font.withSize(24)
        errorLabel.textColor = .white
        errorLabel.textAlignment = .center
    }
    
    func hideAllElements(hide: Bool, color: UIColor) {
        if hide {
            self.backgroundColor = color
            self.smartStuffLabel.isHidden = true
            self.tableView.isHidden = true
            self.updateButton.isHidden = true
        } else {
            self.backgroundColor = color
            self.smartStuffLabel.isHidden = false
            self.tableView.isHidden = false
            self.updateButton.isHidden = false
        }
        
    }
    
    private func configureUpdateButton() {
        self.addSubview(updateButton)
        updateButton.setTitle("ОБНОВИТЬ", for: .normal)
        updateButton.setTitleColor(.black, for: .normal)
        updateButton.layer.cornerRadius = 25
        updateButton.backgroundColor = .white
        updateButton.addTarget(self, action: #selector(updateButtonTapped), for: .touchUpInside)
    }
    
    @objc private func updateButtonTapped() {
        self.smartStuffViewDelegate?.updateButtonAction()
    }
    
    private func configureTableView() {
        self.addSubview(tableView)
        tableView.backgroundColor = .blackBlue
        tableView.showsVerticalScrollIndicator = false
        tableView.rowHeight = 250
    }
    
    private func configureSmartStuffLabel() {
        self.addSubview(smartStuffLabel)
        
        smartStuffLabel.textColor = .customPurple
        
        smartStuffLabel.font = smartStuffLabel.font.withSize(24)
        
        smartStuffLabel.numberOfLines = 0
        
        smartStuffLabel.lineBreakMode = .byWordWrapping
        
        let paragraphStyle = NSMutableParagraphStyle()
        
        paragraphStyle.lineHeightMultiple = 0.71
        
        smartStuffLabel.attributedText = NSMutableAttributedString(string: "Умные вещи", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
    }
}
