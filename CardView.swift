//
//  Cards.swift
//  
//
//  Created by CoinJackson, Jordan on 6/26/19.
//

import Foundation
import UIKit

class CardView: UIView {

    private var stackView = UIStackView(arrangedSubviews: [])

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    init(controls: [UIView]? = nil) {
        super.init(frame: CGRect.zero)

        layer.addCardShadow()
        backgroundColor = UIColor.white

        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = CGFloat(10)
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true

        if let controls = controls {
            addControls(controls)
        }
        stackView.layoutIfNeeded()
    }

    func addControl(_ control: UIView) {
        control.removeFromSuperview()
        stackView.addArrangedSubview(control)
    }

    func addControls(_ controls: [UIView]) {
        for control in controls {
            addControl(control)
        }
    }

}

extension CALayer {
    func addCardShadow() {
        cornerRadius = 15
        shadowOpacity = 0.5
        masksToBounds = false
        shadowColor = UIColor.black.cgColor
        shadowOffset = CGSize(width: 1, height: 1)
        shadowRadius = 3
    }
}
