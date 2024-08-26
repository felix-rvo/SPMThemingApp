//
//  ThemedViewController.swift
//  SPMThemingApp
//
//  Created by Jonathan Fuentes on 26/8/24.
//

import Foundation
import UIKit
import Theming

class ThemedViewController: UIViewController {

    private let themedView = ThemedView()
    
    private let theme: Theme

    init(theme: Theme) {
        self.theme = theme
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(themedView)
        themedView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            themedView.topAnchor.constraint(equalTo: view.topAnchor),
            themedView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            themedView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            themedView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])

        themedView.theme = theme

        title = "Themed View"
    }
}
