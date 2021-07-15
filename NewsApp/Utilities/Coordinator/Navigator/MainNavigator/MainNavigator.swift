//
//  MainNavigator.swift


import UIKit
import RxCocoa
import RxSwift

class MainNavigator: Navigator{
    
    var coordinator: Coordinator
    
    enum Destination {
        
        // Home
        case home
        case newsDetails(article:Article)
        
    }
    
    required init(coordinator: Coordinator) {
        self.coordinator = coordinator
    }
    
    func viewController(for destination: Destination) -> UIViewController {
        switch destination {
        case .home:
            let viewController = HomeVC()
            let viewModel = HomeViewModel()
            viewController.configure(viewModel: viewModel, coordinator: self.coordinator)
            return viewController
            
        case let .newsDetails(article):
            let viewController = NewsDetailsVC()
            let viewModel = NewsDetailsViewModel(article: article)
            viewController.configure(viewModel: viewModel, coordinator: self.coordinator)
            return viewController
            
        }
    }
    
}
