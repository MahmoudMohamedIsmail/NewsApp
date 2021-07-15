//
//  NetworkAcctivityLoggerManager.swift
//  NewsApp
//
//  Created by Mahmoud Ismail on 7/15/21.
//

import AlamofireNetworkActivityLogger

final class NetworkActivityLoggerManager {

    static func startDebug(){
        NetworkActivityLogger.shared.level = .debug
        NetworkActivityLogger.shared.startLogging()
    }
    
}
