//
//  ViewController.swift
//  SmartStuff
//
//  Created by Григорий Виняр on 17.08.2021.
//

import UIKit

protocol SmartStuffViewProtocol {
    
}

class SmartStuffVC: UIViewController, SmartStuffViewProtocol {
    
    // MARK: - Properties
    
    private let smartStuffLabel = UILabel()
    private let tableView = UITableView()
    private let updateButton = UIButton()
    var smartStuffPresenter: SmartStuffPresenterProtocol!
    private let customAlertView = CustomAlert()
    private var tappedRow: Int?
    private let loadingView = LoadingView()
    private let smartStuffView = SmartStuffView()
    private let errorView = ErrorView()
    
    override func loadView() {
        super.loadView()
        self.view = loadingView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .blackBlue
        
        smartStuffView.smartStuffViewDelegate = self
        smartStuffView.tableView.delegate = self
        smartStuffView.tableView.dataSource = self
        smartStuffView.tableView.register(SmartStuffCell.self, forCellReuseIdentifier: SmartStuffCell.identifier)
        smartStuffView.customAlertView.cancelButton.addTarget(self, action: #selector(cancelButtonDidTapped), for: .touchUpInside)
        smartStuffView.customAlertView.deleteButton.addTarget(self, action: #selector(deleteButtonDidTapped), for: .touchUpInside)
        
        errorView.errorViewDelegate = self
        
        self.smartStuffPresenter.getDevicesFromServer(tableView: smartStuffView.tableView) { [weak self] (error) in
            guard let self = self else { return }
            if error != nil {
                DispatchQueue.main.async {
                    self.view = self.errorView
                }
            }
        } resultIs: {
            DispatchQueue.main.async {
                self.view = self.smartStuffView
            }
        }
    }
    
    // MARK: - Methods
    
    @objc private func deleteButtonDidTapped() {
        guard let tappedRow = tappedRow else { return }
        self.smartStuffPresenter.deleteDevice(from: smartStuffPresenter.devices[tappedRow].id)
        self.smartStuffPresenter.devices.remove(at: tappedRow)
        smartStuffView.tableView.reloadData()
        smartStuffView.customAlertView.isHidden = true
        smartStuffView.hideAllElements(hide: false, color: .blackBlue)
    }
    
    @objc private func cancelButtonDidTapped() {
        smartStuffView.customAlertView.isHidden = true
        smartStuffView.hideAllElements(hide: false, color: .blackBlue)
    }
    
}

// MARK: - ErrorViewDelegate
extension SmartStuffVC: ErrorViewDelegate {
    func repeatAction() {
        self.view = self.loadingView
        smartStuffPresenter.getDevicesFromServer(tableView: smartStuffView.tableView) { [weak self] (error) in
            guard let self = self else { return }
            if error != nil {
                DispatchQueue.main.async {
                    self.view = self.errorView
                }
            }
        } resultIs: {
            DispatchQueue.main.async {
                self.view = self.smartStuffView
                self.smartStuffView.tableView.reloadData()
            }
        }
    }
}

// MARK: - SmartStuffViewDelegate
extension SmartStuffVC: SmartStuffViewDelegate {
    func updateButtonAction() {
        self.view = self.loadingView
        smartStuffPresenter.resetDeletedDevices()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            guard let self = self else { return }
            self.smartStuffPresenter.getDevicesFromServer(tableView: self.smartStuffView.tableView, errorCompletion: { (error) in
                if error != nil {
                    self.view = self.errorView
                }
            }, resultIs: {
                self.view = self.smartStuffView
            })
        }
    }
}

// MARK: - UITableViewDelegate
extension SmartStuffVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        smartStuffView.hideAllElements(hide: true, color: .gray)
        smartStuffView.customAlertView.changeQuestion(name: smartStuffPresenter.devices[indexPath.row].name)
        self.tappedRow = indexPath.row
        smartStuffView.customAlertView.isHidden = false
        
    }
}

// MARK: - UITableViewDataSource
extension SmartStuffVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return smartStuffPresenter?.devices.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SmartStuffCell.identifier, for: indexPath) as? SmartStuffCell else { return UITableViewCell() }
        
        let device = smartStuffPresenter?.devices[indexPath.row]
        
        var networkStatus = ""
        var workStatus = ""
        var time = device?.lastWorkTime ?? 0

        guard let status = device?.isOnline else { return UITableViewCell() }
        if status {
            networkStatus = "🟢 Online"
            workStatus = "🚀  РАБОТАЕТ"
            time = device?.lastWorkTime ?? 0
            cell.widthConstant = 130
        } else {
            networkStatus = "🔴 Offline"
            time = 0
            if device?.icon == "/img/test/2.svg" {
                workStatus = "🚫  ГАЗ НЕ ОБНАРУЖЕН"
                cell.widthConstant = 170
            } else {
                workStatus = "🚫  ВЫКЛЮЧЕН"
                cell.widthConstant = 130
            }
        }
        
        cell.configureCell(networkStatus: networkStatus, name: device?.name ?? "No name", icon: device?.icon ?? "", workStatus: workStatus, time: time)
        
        return cell
    }
    
}

