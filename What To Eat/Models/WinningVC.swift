//
//  WinningVC.swift
//  What To Eat
//
//  Created by Jonathan Oh on 9/8/17.
//  Copyright © 2017 esohjay. All rights reserved.
//

import UIKit

protocol TappedResetRoundDelegate {
    func didTapResetRound()
}

class WinningVC: UIViewController {
    
    var delegate: TappedResetRoundDelegate?
    let testLabel = UILabel()
    var searchString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        
        testLabel.text = "\(searchString ?? "") is the Winner!"
        testLabel.translatesAutoresizingMaskIntoConstraints = false
        testLabel.textAlignment = .center
        testLabel.backgroundColor = .white
        view.addSubview(testLabel)
        
        testLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        testLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        testLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        testLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Reset Round", style: .plain, target: self, action: #selector(tappedResetButton))
        //navigationController?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Reset Round", style: .plain, target: self, action: #selector(tappedResetButton))
    }
    
    func tappedResetButton() {
        navigationController?.popViewController(animated: true)
        delegate?.didTapResetRound()
    }
    
}
