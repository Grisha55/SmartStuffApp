//
//  SmartStuffPresenter.swift
//  SmartStuff
//
//  Created by Григорий Виняр on 17.08.2021.
//

import UIKit

protocol SmartStuffPresenterProtocol: AnyObject {
    var devices: [Device] { get set }
    func getDevicesFromServer(tableView: UITableView, errorCompletion: @escaping (Error?) -> Void, resultIs: @escaping () -> Void)
    func deleteDevice(from id: Int)
    func resetDeletedDevices()
}

class SmartStuffPresenter: SmartStuffPresenterProtocol {
    
    // MARK: - Properties
    
    var devices = [Device]()
    var smartStuffView: SmartStuffViewProtocol!
    var networkingService: NetworkingServiceProtocol!
    
    func resetDeletedDevices() {
        networkingService.resetDeletedDevices()
    }
    
    func deleteDevice(from id: Int) {
        networkingService.deleteDevice(from: id)
    }
    
    func getDevicesFromServer(tableView: UITableView, errorCompletion: @escaping (Error?) -> Void, resultIs: @escaping () -> Void) {
        self.devices.removeAll()
        networkingService.getListOfDevices { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .failure(let error):
                errorCompletion(error)
            case .success(let devices):
                self.devices = devices
                resultIs()
                tableView.reloadData()
            }
        }

    }
}
