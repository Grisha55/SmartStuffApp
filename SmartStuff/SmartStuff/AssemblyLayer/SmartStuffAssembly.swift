//
//  MainModuleAssembly.swift
//  SmartStuff
//
//  Created by Григорий Виняр on 18.08.2021.
//

import UIKit

class SmartStuffModuleAssembly {
    
    func configuredModule() -> UIViewController {
        
        let view = SmartStuffVC()
        let presenter = SmartStuffPresenter()
        let networkingService = NetworkingService()
        
        view.smartStuffPresenter = presenter
        
        presenter.smartStuffView = view
        presenter.networkingService = networkingService
        
        return view
    }
    
}
