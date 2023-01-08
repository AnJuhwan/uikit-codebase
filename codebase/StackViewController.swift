//
//  StackViewController.swift
//  codebase
//
//  Created by 안주환 on 2023/01/08.
//

import UIKit
import SnapKit

class StackViewController: UIViewController {
    
    lazy var topStackView : UIStackView = {
        
        let stackView = UIStackView()
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let firstView = UIView()
        firstView.translatesAutoresizingMaskIntoConstraints = false
        firstView.backgroundColor = UIColor.systemYellow
        
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
        firstView.addSubview(titleLabel)
        firstView.addSubview(SubtitleLabelContainer)
        firstView.addSubview(bottomImageView)
        
        
        // firstView 대한 요소들 위치잡기
        NSLayoutConstraint.activate([
            firstView.heightAnchor.constraint(equalToConstant: 200),
            titleLabel.topAnchor.constraint(equalTo: firstView.topAnchor,constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: firstView.leadingAnchor,constant: 20),
            
            SubtitleLabelContainer.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 5),
            SubtitleLabelContainer.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            bottomImageView.bottomAnchor.constraint(equalTo: firstView.bottomAnchor, constant: -10),
            bottomImageView.trailingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: -10)
        ])
        
        
        topStackView.addArrangedSubview(firstView)
        
        // 회면에 서브뷰로 스택뷰를 추가
        self.view.addSubview(topStackView)
        
        //위치 잡기
        NSLayoutConstraint.activate([
            topStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            topStackView.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 100),
            topStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 20),
        ])
        
        print(#function)
    }
}


#if DEBUG
import SwiftUI

struct StackViewControllerPresentable : UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        StackViewController()
    }
    
    struct ViewControllerPrepresentable_PreviewProvider : PreviewProvider {
        static var previews: some View {
            StackViewControllerPresentable()
                .previewDevice("iPhone 12 mini")
                .ignoresSafeArea()
        }
    }
}

#endif

