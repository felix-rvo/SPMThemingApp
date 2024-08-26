//
//  SubViews.swift
//  SPMThemingApp
//
//  Created by Jonathan Fuentes on 26/8/24.
//

import Foundation
import Theming
import UIKit

class FacebookThemedView: ThemedView {
    override var theme: Theme? {
        didSet {
            super.theme = FacebookTheme()
        }
    }
}

class InstagramThemedView: ThemedView {
    override var theme: Theme? {
        didSet {
            super.theme = InstagramTheme()
        }
    }
}

class TwitterThemedView: ThemedView {
    override var theme: Theme? {
        didSet {
            super.theme = TwitterTheme()
        }
    }
}

class LinkedInThemedView: ThemedView {
    override var theme: Theme? {
        didSet {
            super.theme = LinkedInTheme()
        }
    }
}

class WhatsAppThemedView: ThemedView {
    override var theme: Theme? {
        didSet {
            super.theme = WhatsAppTheme()
        }
    }
}

class SlackThemedView: ThemedView {
    override var theme: Theme? {
        didSet {
            super.theme = SlackTheme()
        }
    }
}

class SpotifyThemedView: ThemedView {
    override var theme: Theme? {
        didSet {
            super.theme = SpotifyTheme()
        }
    }
}

class UberThemedView: ThemedView {
    override var theme: Theme? {
        didSet {
            super.theme = UberTheme()
        }
    }
}

class GoogleThemedView: ThemedView {
    override var theme: Theme? {
        didSet {
            super.theme = GoogleTheme()
        }
    }
}

class DarkModeThemedView: ThemedView {
    override var theme: Theme? {
        didSet {
            super.theme = DarkModeTheme()
        }
    }
}
