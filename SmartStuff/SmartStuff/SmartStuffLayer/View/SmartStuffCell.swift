//
//  SmartStuffCell.swift
//  SmartStuff
//
//  Created by Григорий Виняр on 17.08.2021.
//

import UIKit

class SmartStuffCell: UITableViewCell {
    
    // MARK: - Propterties
    
    static let identifier = "SmartStuffCell"
    private let networkStatusLabel = UILabel()
    private let nameLabel = UILabel()
    private let iconImageView = UIImageView()
    private let workStatusLabel = UILabel()
    private let timeLabel = UILabel()
    private let backView = UIView()
    private let workView = UIView()
    var widthConstant: CGFloat = 130
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .blackBlue
        configureBackView()
        configureNetworkStatusLabel()
        configureNameLabel()
        configureIconImageView()
        configureWorkView()
        configureWorkStatusLabel()
        configureTimeLabel()
        
        setBackViewConstraints()
        setNetworkStatusLabelConstraints()
        setNameLabelConstraints()
        setIconImageViewConstraints()
        setWorkViewConstraints()
        setWorkStatusLabelConstraints()
        setTimeLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    func configureCell(networkStatus: String, name: String, icon: String, workStatus: String, time: Int) {
        self.networkStatusLabel.text = networkStatus.uppercased()
        self.nameLabel.text = name.uppercased()
        self.iconImageView.image = makeIcon(url: icon)
        self.workStatusLabel.text = workStatus.uppercased()
        
        let heightCons = workView.constraints[0]
        heightCons.constant = widthConstant
        self.layoutIfNeeded()
        
        if time == 0 {
            self.timeLabel.text = ""
        } else {
            self.timeLabel.text = "🕒  \(convertTime(seconds: time))"
        }
    }
    
    private func makeIcon(url: String) -> UIImage {
        if url == "/img/test/1.svg" {
            return UIImage(named: "1")!
        } else if url == "/img/test/2.svg" {
            return UIImage(named: "2")!
        }
        return UIImage(systemName: "house")!
    }
    
    private func convertTime(seconds: Int) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .positional
        let formattedTime = formatter.string(from: TimeInterval(seconds))
        return formattedTime!
    }
    
    private func configureTimeLabel() {
        self.addSubview(timeLabel)
        timeLabel.text = "03:12:16"
        timeLabel.textColor = .white
        timeLabel.font = timeLabel.font.withSize(12)
    }
    
    private func configureWorkView() {
        backView.addSubview(workView)
        workView.backgroundColor = .blackBlue
        workView.layer.cornerRadius = 13
    }
    
    private func configureWorkStatusLabel() {
        workView.addSubview(workStatusLabel)
        workStatusLabel.text = "Газ не обнаружен"
        workStatusLabel.textColor = .white
        workStatusLabel.textAlignment = .center
        workStatusLabel.font = workStatusLabel.font.withSize(12)
    }
    
    private func configureIconImageView() {
        self.addSubview(iconImageView)
        iconImageView.contentMode = .scaleToFill
    }
    
    private func configureNameLabel() {
        backView.addSubview(nameLabel)
        nameLabel.text = "РОБОТ ПЫЛЕСОС"
        nameLabel.textColor = .blackBlue
        nameLabel.font = nameLabel.font.withSize(24)
        nameLabel.numberOfLines = 0
    }
    
    private func configureBackView() {
        self.addSubview(backView)
        
        let layer0 = CAGradientLayer()
        layer0.colors = [
            
            UIColor(red: 0.671, green: 0.413, blue: 1, alpha: 1).cgColor,
            
            UIColor(red: 0.286, green: 0.294, blue: 0.922, alpha: 1).cgColor
            
        ]
        layer0.locations = [0, 1]
        layer0.startPoint = CGPoint(x: 0.25, y: 0.5)
        layer0.endPoint = CGPoint(x: 0.75, y: 0.5)
        layer0.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0, b: 1, c: -1, d: 0, tx: 1, ty: 0))
        layer0.frame = CGRect(x: 0, y: 0, width: 300, height: 200)
        layer0.cornerRadius = 20
        backView.layer.addSublayer(layer0)
        backView.layer.cornerRadius = 20
    }
    
    private func configureNetworkStatusLabel() {
        backView.addSubview(networkStatusLabel)
        networkStatusLabel.text = "ONLINE"
        networkStatusLabel.textColor = .white
        networkStatusLabel.font = networkStatusLabel.font.withSize(12)
    }
    
    // Constraints
    
    private func setTimeLabelConstraints() {
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -17).isActive = true
        timeLabel.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -18).isActive = true
        timeLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 54).isActive = true
    }
    
    private func setWorkStatusLabelConstraints() {
        workStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        
        workStatusLabel.centerXAnchor.constraint(equalTo: workView.centerXAnchor).isActive = true
        workStatusLabel.centerYAnchor.constraint(equalTo: workView.centerYAnchor).isActive = true
    }
    
    private func setWorkViewConstraints() {
        workView.translatesAutoresizingMaskIntoConstraints = false
        workView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 62).isActive = true
        workView.widthAnchor.constraint(equalToConstant: widthConstant).isActive = true
        workView.heightAnchor.constraint(equalToConstant: 27).isActive = true
        workView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 17).isActive = true
    }
    
    private func setIconImageViewConstraints() {
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 16).isActive = true
        iconImageView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -14).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 98).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 98).isActive = true
    }
    
    private func setNameLabelConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: networkStatusLabel.bottomAnchor, constant: 14).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 17).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 140).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 58).isActive = true
    }
    
    private func setBackViewConstraints() {
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        backView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        backView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        backView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
    }
    
    private func setNetworkStatusLabelConstraints() {
        networkStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        networkStatusLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
        networkStatusLabel.heightAnchor.constraint(equalToConstant: 14).isActive = true
        networkStatusLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 14).isActive = true
        networkStatusLabel.topAnchor.constraint(equalTo: backView.topAnchor, constant: 16).isActive = true
        
    }
    
}
