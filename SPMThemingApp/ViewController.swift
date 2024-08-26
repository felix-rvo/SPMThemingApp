//
//  ViewController.swift
//  SPMThemingApp
//
//  Created by Jonathan Fuentes on 26/8/24.
//

import UIKit
import Theming

class ViewController: UIViewController {

    private var buttonStackView: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    @objc private func changeThemeButtonTapped(_ sender: UIButton) {
        let themeViewController: UIViewController
        
        switch sender.tag {
        case 1:
            themeViewController = ThemedViewController(theme: FacebookTheme())
        case 2:
            themeViewController = ThemedViewController(theme: InstagramTheme())
        case 3:
            themeViewController = ThemedViewController(theme: TwitterTheme())
        case 4:
            themeViewController = ThemedViewController(theme: LinkedInTheme())
        case 5:
            themeViewController = ThemedViewController(theme: WhatsAppTheme())
        case 6:
            themeViewController = ThemedViewController(theme: SlackTheme())
        case 7:
            themeViewController = ThemedViewController(theme: SpotifyTheme())
        case 8:
            themeViewController = ThemedViewController(theme: UberTheme())
        case 9:
            themeViewController = ThemedViewController(theme: GoogleTheme())
        case 10:
            themeViewController = ThemedViewController(theme: DarkModeTheme())
        default:
            return
        }

        let navigationController = UINavigationController(rootViewController: themeViewController)
        navigationController.modalPresentationStyle = .pageSheet
        present(navigationController, animated: true, completion: nil)
    }

    private func setupViews() {
        buttonStackView = UIStackView()
        buttonStackView.axis = .vertical
        buttonStackView.spacing = 15
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonStackView)

        NSLayoutConstraint.activate([
            buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            buttonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buttonStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])

        // Crear y agregar los botones al stack view
        let themes: [Theme] = [
            FacebookTheme(), InstagramTheme(), TwitterTheme(), LinkedInTheme(),
            WhatsAppTheme(), SlackTheme(), SpotifyTheme(), UberTheme(),
            GoogleTheme(), DarkModeTheme()
        ]
        
        let buttonTitles = [
            "Facebook Theme", "Instagram Theme", "Twitter Theme", "LinkedIn Theme",
            "WhatsApp Theme", "Slack Theme", "Spotify Theme", "Uber Theme",
            "Google Theme", "Dark Mode Theme"
        ]
        
        for (index, theme) in themes.enumerated() {
            let button = UIButton(type: .system)
            button.setTitle(buttonTitles[index], for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.tag = index + 1
            button.addTarget(self, action: #selector(changeThemeButtonTapped(_:)), for: .touchUpInside)
            buttonStackView.addArrangedSubview(button)
            
            // Aplicar el estilo del tema al botón
            applyThemeToButton(button, with: theme)
        }
    }
    
    private func applyThemeToButton(_ button: UIButton, with theme: Theme) {
        button.backgroundColor = theme.buttonBackgroundColor
        button.setTitleColor(theme.buttonTextColor, for: .normal)
        button.titleLabel?.font = theme.buttonFont
        button.layer.cornerRadius = 10
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.3
        button.clipsToBounds = false
        button.layer.borderWidth = 1
        button.layer.borderColor = theme.buttonTextColor.cgColor
        
        // Configurar tamaño de botón según el tema
        button.widthAnchor.constraint(equalToConstant: theme.buttonSize.width).isActive = true
        button.heightAnchor.constraint(equalToConstant: theme.buttonSize.height).isActive = true
    }
}
