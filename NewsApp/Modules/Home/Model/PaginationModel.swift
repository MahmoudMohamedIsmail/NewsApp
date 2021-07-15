//
//  PaginationModel.swift
//  NewsApp
//
//  Created by Mahmoud Ismail on 7/15/21.
//

import Foundation

class Pagination {
    
    var pageNumber = 1
    var numberOfItemPerPage = 20
    var isFeatching = false
    var noMorePages = false
    
    func reset() {
        self.pageNumber = 1
        self.isFeatching = false
        self.noMorePages = false
    }
}
