//
//  NewsDetailsVC.swift
//  NewsApp
//
//  Created by Mahmoud Ismail on 7/15/21.
//

import SDWebImage

class NewsDetailsVC: BaseWireFrame<NewsDetailsViewModel> {
    
    @IBOutlet weak var navigationView_NV: NavigationView!
    @IBOutlet weak var newsImage_ImgViwe: UIImageView!
    @IBOutlet weak var date_lbl: DesignableUILabel!
    @IBOutlet weak var author_lbl: DesignableUILabel!
    @IBOutlet weak var title_lbl: DesignableUILabel!
    @IBOutlet weak var description_lbl: DesignableUILabel!
    @IBOutlet weak var content_lbl: DesignableUILabel!
    @IBOutlet weak var source_lbl: DesignableUILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func bind(viewModel: NewsDetailsViewModel) {
        handelBackButton()
        handelViewModelOutput()
    }
    
    private func handelViewModelOutput(){
        
        if let newsImagePath = viewModel.outputs.article.urlToImage {
            newsImage_ImgViwe.sd_imageIndicator = SDWebImageActivityIndicator.gray
            newsImage_ImgViwe.sd_setImage(with: URL(string: newsImagePath), completed: nil)
        }
        
        date_lbl.text = viewModel.outputs.article.publishedAt?.convertTo()
        author_lbl.text = viewModel.outputs.article.author
        title_lbl.text = viewModel.outputs.article.title
        description_lbl.text = viewModel.outputs.article.articleDescription
        content_lbl.text = viewModel.outputs.article.content
        source_lbl.text = viewModel.outputs.article.source?.name
    }
    
    private func handelBackButton(){
        self.navigationView_NV.back_Btn.rx.tap.subscribe {[weak self] (_) in
            self?.navigationController?.popViewController(animated: true)
        }.disposed(by: disposeBag)
    }
}
