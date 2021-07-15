//
//  NewsCell.swift
//  NewsApp
//
//  Created by Mahmoud Ismail on 7/15/21.
//

import SDWebImage


class NewsCell: UICollectionViewCell {

    var model:Article?{
        didSet{
            configure()
        }
    }
    
    @IBOutlet weak var newsImage_ImgView: UIImageView!
    @IBOutlet weak var title_lbl: UILabel!
    @IBOutlet weak var source_lbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    private func configure(){
        guard  let model = model, let newsImagPath = model.urlToImage else { return}
        newsImage_ImgView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        newsImage_ImgView.sd_setImage(with: URL(string: newsImagPath), completed: nil)
        title_lbl.text = model.title
        source_lbl.text = model.source?.name
        
    }

}
