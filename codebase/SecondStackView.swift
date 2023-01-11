//
//  StackViewController.swift
//  codebase
//
//  Created by 안주환 on 2023/01/08.
//

import UIKit
import SnapKit

class SecondStackViewController: UIViewController {
    
    lazy var topStackView : UIStackView = {
        
        let stackView = UIStackView()
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // Mark: -
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.white
        
        let firstView = MyCardView.generateMyCardView()
        let secondView = MyCardView.generateMyCardView()
        let thirdView = MyCardView.generateMyCardView()
        
        topStackView.addArrangedSubview(firstView)
        topStackView.addArrangedSubview(secondView)
        topStackView.addArrangedSubview(thirdView)
        // 회면에 서브뷰로 스택뷰를 추가
        self.view.addSubview(topStackView)
        
        //위치 잡기
        NSLayoutConstraint.activate([
            topStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            topStackView.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 100),
            topStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 20),
        ])
        
        print(#function)
        
        let secondStackView = generateJellyStackView()
                
        self.view.addSubview(secondStackView)
        NSLayoutConstraint.activate([
            secondStackView.leadingAnchor.constraint(equalTo: topStackView.leadingAnchor),
            secondStackView.trailingAnchor.constraint(equalTo: topStackView.trailingAnchor),
            secondStackView.topAnchor.constraint(equalTo: topStackView.bottomAnchor,constant: 20)
        ])
        
        let thirdStackView = generateKakaoStackView()
                
        self.view.addSubview(thirdStackView)
        NSLayoutConstraint.activate([
            thirdStackView.leadingAnchor.constraint(equalTo: secondStackView.leadingAnchor),
            thirdStackView.trailingAnchor.constraint(equalTo: secondStackView.trailingAnchor),
            thirdStackView.topAnchor.constraint(equalTo: secondStackView.bottomAnchor,constant: 20)
        ])
        
        lazy var fourthStackView : UIStackView = {
            
            let stackView = UIStackView(arrangedSubviews: [
                generateKakaoStackView(),
                generateKakaoStackView(),
                generateKakaoStackView(),
                generateKakaoStackView(),
            ])
            stackView.spacing = 5
            stackView.alignment = .center
            stackView.axis = .vertical
            stackView.distribution = .fillEqually
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.backgroundColor = UIColor.lightGray
            stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
            stackView.isLayoutMarginsRelativeArrangement = true // 패딩 마진 허용
            stackView.layer.borderColor = UIColor.systemOrange.cgColor
            stackView.layer.borderWidth = 2
            stackView.layer.cornerRadius = 10
            
            return stackView
        }()
        
                
        self.view.addSubview(fourthStackView)
        NSLayoutConstraint.activate([
            fourthStackView.leadingAnchor.constraint(equalTo: thirdStackView.leadingAnchor),
            fourthStackView.trailingAnchor.constraint(equalTo: thirdStackView.trailingAnchor),
            fourthStackView.topAnchor.constraint(equalTo: thirdStackView.bottomAnchor,constant: 20)
        ])
        
    }
}

// view 관련
extension SecondStackViewController {
    
    /// 카카오 스택뷰 생성
    /// - Returns: 생성된 스택뷰
    fileprivate func generateKakaoStackView() -> UIStackView {
        
        
        let firstLabel = UILabel()
        firstLabel.text = "내 카카오 뱅크 입출금 통장"
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        let secondLabel = UILabel()
        secondLabel.text = "젤리 교환소"
        secondLabel.font = UIFont.systemFont(ofSize: 12)
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let trailingImageView = UIImageView(image: UIImage(systemName: "square.and.arrow.up.circle.fill"))
        trailingImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            trailingImageView.widthAnchor.constraint(equalToConstant: 20),
            trailingImageView.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        
        
        lazy var secondStackView : UIStackView = {
            
            let stackView = UIStackView(arrangedSubviews: [
                firstLabel,
                secondLabel,
                trailingImageView
            ])
            stackView.spacing = 5
            stackView.alignment = .center
            stackView.axis = .horizontal
            stackView.distribution = .equalCentering
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.backgroundColor = UIColor.systemYellow
            stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
            stackView.isLayoutMarginsRelativeArrangement = true // 패딩 마진 허용
            stackView.layer.borderColor = UIColor.systemOrange.cgColor
            stackView.layer.borderWidth = 2
            stackView.layer.cornerRadius = 10
            
            return stackView
        }()
        return secondStackView
    }
    

    /// 젤리 스택뷰 생성
    /// - Returns: 생성된 스택뷰
    fileprivate func generateJellyStackView() -> UIStackView {
        let leadingImageView = UIImageView(image: UIImage(systemName: "square.and.arrow.up.circle.fill"))
        leadingImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leadingImageView.widthAnchor.constraint(equalToConstant: 50),
            leadingImageView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        let centerLabel = UILabel()
        centerLabel.text = "젤리 교환소"
        centerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let trailingImageView = UIImageView(image: UIImage(systemName: "square.and.arrow.up.circle.fill"))
        trailingImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            trailingImageView.widthAnchor.constraint(equalToConstant: 50),
            trailingImageView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        
        
        lazy var secondStackView : UIStackView = {
            
            let stackView = UIStackView(arrangedSubviews: [
                leadingImageView,
                centerLabel,
                trailingImageView
            ])
            stackView.spacing = 0
            stackView.alignment = .center
            stackView.axis = .horizontal
            stackView.distribution = .equalCentering
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.backgroundColor = UIColor.systemYellow
            stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
            stackView.isLayoutMarginsRelativeArrangement = true // 패딩 마진 허용
            stackView.layer.borderColor = UIColor.systemOrange.cgColor
            stackView.layer.borderWidth = 2
            stackView.layer.cornerRadius = 10
            
            return stackView
        }()
        return secondStackView
    }
    
    fileprivate func generateMyCardView() -> MyCardView {
        let cardView = MyCardView()
        cardView.translatesAutoresizingMaskIntoConstraints = false
        return cardView
    }
    
    /// 카드뷰 생성 및 반환
    /// - Returns: 카드뷰
    fileprivate func generateCardView() -> UIView {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = UIColor.systemYellow
        
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
        containerView.addSubview(titleLabel)
        containerView.addSubview(SubtitleLabelContainer)
        containerView.addSubview(bottomImageView)
        
        
        // firstView 대한 요소들 위치잡기
        NSLayoutConstraint.activate([
            containerView.heightAnchor.constraint(equalToConstant: 200),
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor,constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 20),
            
            SubtitleLabelContainer.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 5),
            SubtitleLabelContainer.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            bottomImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
            bottomImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10)
        ])
        
        return containerView
    }
}


#if DEBUG
import SwiftUI

struct SecondStackViewControllerPresentable : UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        SecondStackViewController()
    }
    
    struct SecondStackControllerPrepresentable_PreviewProvider : PreviewProvider {
        static var previews: some View {
            SecondStackViewControllerPresentable()
                .previewDevice("iPhone 12 mini")
                .ignoresSafeArea()
        }
    }
}

#endif

