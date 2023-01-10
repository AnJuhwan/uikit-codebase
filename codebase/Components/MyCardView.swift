//
//  MyCardView.swift
//  codebase
//
//  Created by 안주환 on 2023/01/10.
//

import Foundation
import UIKit

class MyCardView : UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        print("MyCardView - init()")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // 레이아웃 설정
    fileprivate func setupLayout() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.systemYellow
        
        let titleLabel = UILabel()
        titleLabel.text = "사운드\n테라피"
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // 서브타이틀
        let subTitleLabel = UILabel()
        subTitleLabel.text = "무료"
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let SubtitleLabelContainer = UIView()
        SubtitleLabelContainer.backgroundColor = UIColor.systemMint
        SubtitleLabelContainer.translatesAutoresizingMaskIntoConstraints = false
        
        SubtitleLabelContainer.addSubview(subTitleLabel)
        
        NSLayoutConstraint.activate([
            subTitleLabel.centerXAnchor.constraint(equalTo: SubtitleLabelContainer.centerXAnchor),
            subTitleLabel.centerYAnchor.constraint(equalTo: SubtitleLabelContainer.centerYAnchor),
            subTitleLabel.topAnchor.constraint(equalTo: SubtitleLabelContainer.topAnchor,constant: 5),
            subTitleLabel.leadingAnchor.constraint(equalTo: SubtitleLabelContainer.leadingAnchor,constant: 5)
        ])
        
        // imageView
        let bottomImageView = UIImageView(image: UIImage(named: "appleIcon"))
        bottomImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bottomImageView.widthAnchor.constraint(equalToConstant: 50),
            bottomImageView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // firstView 하위요소 추가
        self.addSubview(titleLabel)
        self.addSubview(SubtitleLabelContainer)
        self.addSubview(bottomImageView)
        
        
        // firstView 대한 요소들 위치잡기
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 200),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor,constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            
            SubtitleLabelContainer.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 5),
            SubtitleLabelContainer.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            bottomImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            bottomImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
    }
    
//    static func generateMyCardView() -> MyCardView {
//        let cardView = MyCardView()
//        cardView.translatesAutoresizingMaskIntoConstraints = false
//        return cardView
//    }
}

extension MyCardView {
    
    
    /// 카드뷰 만들기
    /// - Returns: 카드뷰
    static func generateMyCardView() -> MyCardView {
        let cardView = MyCardView()
        cardView.translatesAutoresizingMaskIntoConstraints = false
        return cardView
    }
}
