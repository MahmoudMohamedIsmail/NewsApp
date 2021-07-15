//
//  NewsDatailsViewModel.swift
//  NewsApp
//
//  Created by Mahmoud Ismail on 7/15/21.
//

import Foundation

protocol NewsDetailsViewModelInput{
    
}
protocol NewsDetailsViewModelOutput {
    var article:Article{get}
}
class NewsDetailsViewModel: BaseViewModel, NewsDetailsViewModelInput, NewsDetailsViewModelOutput {
    var article: Article
    
    var inputs:NewsDetailsViewModelInput{return self}
    var outputs:NewsDetailsViewModelOutput{return self}
    
    init(article:Article) {
        self.article = article
    }
}
