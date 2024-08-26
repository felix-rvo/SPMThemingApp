//
//  ThemedView.swift
//  SPMThemingApp
//
//  Created by Jonathan Fuentes on 26/8/24.
//

import Foundation
import UIKit
import Theming

class ThemedView: UIView {

    private let titleLabel = UILabel()
    private let paragraphLabel = UILabel()
    private let actionButton = UIButton(type: .system)
    private let containerView = UIView()

    var theme: Theme? {
        didSet {
            applyTheme()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }

    private func setupViews() {
        addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: centerYAnchor),
            containerView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.85),
            containerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.75)
        ])

        containerView.addSubview(titleLabel)
        containerView.addSubview(paragraphLabel)
        containerView.addSubview(actionButton)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        paragraphLabel.translatesAutoresizingMaskIntoConstraints = false
        actionButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),

            paragraphLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            paragraphLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            paragraphLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),

            actionButton.topAnchor.constraint(equalTo: paragraphLabel.bottomAnchor, constant: 30),
            actionButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20)
        ])
    }

    private func applyTheme() {
        guard let theme = theme else { return }

        backgroundColor = theme.backgroundColor

        titleLabel.textColor = theme.textColor
        titleLabel.font = theme.titleFont
        titleLabel.text = "Themed Title"
        titleLabel.textAlignment = .center

        paragraphLabel.textColor = theme.textColor
        paragraphLabel.font = theme.paragraphFont
        paragraphLabel.text = "This is a themed paragraph demonstrating how the theme's properties are applied."
        paragraphLabel.numberOfLines = 0
        paragraphLabel.textAlignment = .center

        actionButton.backgroundColor = theme.buttonBackgroundColor
        actionButton.setTitleColor(theme.buttonTextColor, for: .normal)
        actionButton.titleLabel?.font = theme.buttonFont
        actionButton.setTitle("Action Button", for: .normal)
        actionButton.layer.cornerRadius = 10
        actionButton.layer.borderWidth = 1
        actionButton.layer.borderColor = theme.buttonTextColor.cgColor
        actionButton.layer.shadowColor = UIColor.black.cgColor
        actionButton.layer.shadowOffset = CGSize(width: 0, height: 3)
        actionButton.layer.shadowRadius = 5
        actionButton.layer.shadowOpacity = 0.3
        actionButton.clipsToBounds = false
        actionButton.frame.size = theme.buttonSize
    }
}
