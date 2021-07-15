//
//  NavigationView.swift

import UIKit

@IBDesignable
class NavigationView: UIView {
    
    @IBInspectable
    var actionButtonIcon: UIImage? = nil{
        didSet{
            if let actionButtonIcon = self.actionButtonIcon {
                self.action_Btn.setImage(actionButtonIcon, for: .normal)
                self.action_Btn.isHidden = false
            }
        }
    }
    
    @IBInspectable
    var title: String = ""{
        didSet{
            self.title_lbl.text = self.title
        }
    }
    
    @IBInspectable
    var barColor: UIColor = .white{
        didSet{
            self.title_lbl.textColor = self.barColor
            self.back_Btn.tintColor = self.barColor
        }
    }
    
    @IBInspectable
    var isBackButtonEnabled: Bool = true{
        didSet{
            self.back_Btn.isHidden = !isBackButtonEnabled
        }
    }
    
    private lazy var title_lbl: UILabel = {
        let lable = UILabel()
        lable.font = DesignSystem.Typography.bigButton.font
        lable.textColor = DesignSystem.Colors.blackText.color
        lable.textAlignment = .center
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    lazy var back_Btn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "LeftArrow_ICON"), for: .normal)
        button.tintColor = .white
        button.setTitle(nil, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var action_Btn: UIButton = {
        let button = UIButton()
        button.setTitle(nil, for: .normal)
        button.isHidden = true
        button.imageEdgeInsets = .init(top: 5, left: 5, bottom: 5, right: 5)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initalize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.initalize()
    }

    private func initalize(){
        self.setupViews()
    }
    
    private func setupViews(){
        self.addSubviews(self.back_Btn,
                         self.title_lbl,
                         self.action_Btn)
        
        NSLayoutConstraint.activate([
            self.back_Btn.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            self.back_Btn.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.back_Btn.heightAnchor.constraint(equalToConstant: 50),
            self.back_Btn.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            self.action_Btn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            self.action_Btn.centerYAnchor.constraint(equalTo: self.back_Btn.centerYAnchor),
            self.action_Btn.heightAnchor.constraint(equalTo: self.back_Btn.heightAnchor),
            self.action_Btn.widthAnchor.constraint(equalTo: self.back_Btn.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.title_lbl.leadingAnchor.constraint(equalTo: self.back_Btn.trailingAnchor, constant: 10),
            self.title_lbl.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.title_lbl.trailingAnchor.constraint(equalTo: self.action_Btn.leadingAnchor, constant: -10)
        ])
    }
}
