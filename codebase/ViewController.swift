//
//  ViewController.swift
//  codebase
//
//  Created by 안주환 on 2023/01/08.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        self.view.backgroundColor = UIColor.white
        
        let yellowView = UIView()
        yellowView.backgroundColor = UIColor.yellow
        
//        yellowView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(yellowView)
        
        yellowView.snp.makeConstraints{(make) -> Void in
//            make.size.equalTo(100) // 정사각형인 경우 가능
            make.width.equalTo(150)
            make.height.equalTo(150)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(100)
        }
        
        
//        NSLayoutConstraint.activate([
//            yellowView.widthAnchor.constraint(equalToConstant: 200),
//            yellowView.heightAnchor.constraint(equalToConstant: 200),
//            yellowView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            yellowView.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor,
//                                                constant: 100
//                                               )
//        ])
        
        //        // 크기완료
        //        yellowView.widthAnchor.constraint(equalToConstant: 100).isActive = true // 가로사이즈
        //        yellowView.heightAnchor.constraint(equalToConstant: 100).isActive = true // 세로사이즈
        //
        //        // 위치
        //        yellowView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        //        yellowView.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor,
        //        constant: 100
        //        ).isActive = true
        
        
        
        print(#function)
    }
}

#if DEBUG
import SwiftUI

struct ViewControllerPresentable : UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        ViewController()
    }
    
    struct ViewControllerPrepresentable_PreviewProvider : PreviewProvider {
        static var previews: some View {
            ViewControllerPresentable()
                .previewDevice("iPhone 12 mini")
                .ignoresSafeArea()
        }
    }
}

#endif
