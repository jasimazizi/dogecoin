//
//  LogoController.swift
//  LaunchScreen
//
//  Created by Jasim Azizi
//

import UIKit

class LogoController: UIViewController {

    // MARK: - Private Properties
    private var imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        imageView.image = UIImage(named: "logo")
        return imageView
    }()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        DispatchQueue.main.asyncAfter(deadline: .now()+13) {
            self.performSegue(withIdentifier: "HomeVC", sender: nil)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.center = view.center
        DispatchQueue.main.asyncAfter(deadline: .now()+5) {
            self.animate()
        }
    }
    
    /// A light status bar, intended for use on dark backgrounds.
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    
    // MARK: - Private Methods
    private func animate() {
        UIView.animate(withDuration: 1) {
            let size = self.view.frame.size.width * 2
            let diffX = size - self.view.frame.width
            let diffY = self.view.frame.height - size

            self.imageView.frame = CGRect(
                x: -(diffX/2),
                y: diffY/2,
                width: size,
                height: size)
            self.imageView.alpha = 0
            
        }
    }
}

