//
//  UIViewController+Gradient.swift
//  LoginScreenAPI
//
//  Created by Cesar Rojas on 4/23/25.
//

import UIKit

extension UIViewController {
    func applyBlueGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.systemBlue.cgColor, UIColor.blue.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)

        // Guardar referencia si necesitas actualizar luego el tamaño
        if let vc = self as? GradientSupportable {
            vc.gradientLayer = gradientLayer
        }
    }
}

// Protocolo para mantener referencia al gradient layer (opcional)
protocol GradientSupportable: UIViewController {
    var gradientLayer: CAGradientLayer? { get set }
}

extension GradientSupportable {
    func updateGradientFrame() {
        gradientLayer?.frame = view.bounds
    }
}
