//
//  HomeViewModel.swift
//  NewsApp
//
//  Created by Mahmoud Ismail on 7/15/21.
//


import RxSwift
import RxRelay

protocol HomeViewModelInput {
    func prefetchRowsAt(indexPaths: [IndexPath])
    var textSearch:BehaviorRelay<String>{get set}
}
protocol HomeViewModelOutput {
    var articlesObservable:Observable<[Article]>{get}
}

class HomeViewModel:BaseViewModel, HomeViewModelInput, HomeViewModelOutput {
    
    var inputs:HomeViewModelInput{return self}
    var outputs:HomeViewModelOutput{return self}
    
    //inputs
    var textSearch: BehaviorRelay<String> = .init(value: "")
    
    //outputs
    private var articles:BehaviorRelay<[Article]> = .init(value: [])
    var articlesObservable: Observable<[Article]> {
        return articles.asObservable()
    }
    
    private var pagination:Pagination!
    
    init() {
        super.init()
        pagination = Pagination()
        subscribeToTextSearch()
    }
    
    func handleSearch() {
        pagination.reset()
        search()
    }
    
    func prefetchRowsAt(indexPaths: [IndexPath]) {
        guard let indexPath = indexPaths.last else {return}
        if (indexPath.row  > (self.articles.value.count - 5)){
            guard !pagination.isFeatching && !pagination.noMorePages else { return }
            
            pagination.pageNumber += 1
            search()
        }
    }
    
    private func subscribeToTextSearch(){
        textSearch.distinctUntilChanged().subscribe(onNext: { [weak self](text) in
            guard let self = self else {return}
            if !text.trimo.isEmpty {
                self.reSetTimer()
            }else{
                self.articles.accept([])
            }
        }).disposed(by: disposeBag)
    }
    //MARK:- Delay Search
    private var timer: Timer? = nil {
        willSet {
            self.timer?.invalidate()
        }
    }
    private func reSetTimer(){
        self.timer?.invalidate()
        self.timer = nil
        self.timer = .scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { _ in
            self.handleSearch()
        })
    }
    
    
    deinit {
        timer?.invalidate()
        timer = nil
    }
    
}

extension HomeViewModel{
    private func search(){
        pagination.isFeatching = true
        appServiceClint.performRequest(News.self, serviceGateway: .search(query: textSearch.value.trimo, pageNumber: pagination.pageNumber, noOfItems: pagination.numberOfItemPerPage, fromDateStr: Date().convertToString(), sortBy: "popularity") ).subscribe {[weak self] (newsResponesData) in
            guard let self = self else {return}
            self.pagination.isFeatching = false
            
            guard let remoteArticles = newsResponesData.articles else {return}
            
            if remoteArticles.isEmpty {
                self.pagination.noMorePages = true
                
                if self.pagination.pageNumber == 1 {
                    self.articles.accept([]) // this condition to show only the search result data (if there is a data in articles array remove it)
                }
                return
            }
            
            self.articles.accept(self.articles.value + remoteArticles)
            
        } onError: { [weak self](error) in
            print(error.localizedDescription)
        }.disposed(by: disposeBag)
        
    }
}
