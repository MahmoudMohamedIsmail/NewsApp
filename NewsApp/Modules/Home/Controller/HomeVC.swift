//
//  HomeVC.swift
//  NewsApp
//
//  Created by Mahmoud Ismail on 7/15/21.
//

import RxCocoa
import RxSwift

class HomeVC: BaseWireFrame<HomeViewModel> {
    
    
    @IBOutlet weak var searchText_TF: UITextField!
    @IBOutlet weak var news_CollectionView: UICollectionView!{
        didSet{
            news_CollectionView.registerCellNib(cellClass: NewsCell.self)
            news_CollectionView.contentInset = .init(top: 10, left: 0, bottom: 40, right: 0)
        }
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    

    override func bind(viewModel: HomeViewModel) {
        searchText_TF.rx.text.orEmpty.bind(to: viewModel.inputs.textSearch).disposed(by: disposeBag)
        handleNews_CollectionView()
    }
    
    private func handleNews_CollectionView(){
        // set delegate to self
        news_CollectionView.rx.setDelegate(self).disposed(by: disposeBag)
        
        // bind viewModel news data to news_CollectionView
        viewModel.outputs.articlesObservable.bind(to: news_CollectionView.rx.items(cellIdentifier: NewsCell.identifier, cellType: NewsCell.self)){ [weak self](row, model, cell) in
            cell.model = model
        }.disposed(by: disposeBag)
        
        //set didselected cell
        news_CollectionView.rx.modelSelected(Article.self).subscribe(onNext: {[weak self] (article) in
            guard let self = self else {return}
            self.coordinator.mainNavigator.navigate(to: .newsDetails(article: article))
        }).disposed(by: disposeBag)
        
        //handle pagination
        news_CollectionView.rx.prefetchItems.subscribe(onNext: {[weak self] (indexPaths) in
            self?.viewModel.inputs.prefetchRowsAt(indexPaths: indexPaths)
        }).disposed(by: disposeBag)

    }

}
//MARK:- UICollectionViewDelegateFlowLayout + set size for BannerCell to Banner_CollectionView size
extension HomeVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width , height: collectionView.frame.width)
    }
}
