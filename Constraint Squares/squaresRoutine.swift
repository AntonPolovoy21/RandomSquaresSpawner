//
//  squaresRoutine.swift
//  Constraint Squares
//
//  Created by Admin on 26.09.23.
//

import Foundation
import UIKit
import SnapKit

class squaresRoutine {
    init() {}
    
    private let colors: [UIColor] = [.systemRed, .systemGreen, .systemBlue, .white, .black]
    private let minSize = 10
    
    public func getRandomSquare(withParent parent: UIView) -> UIView{
        return {
            let sq = UIView()
            sq.addGestureRecognizer(UITapGestureRecognizer(target: ViewController.self, action: #selector(onTap)))
            parent.addSubview(sq)
            let size = getRandomSize(withParentWidth: parent.bounds.width)
            let color = getRandomColor()
            let center = getRandomCenter(withParent: parent, withSize: size)
            
            sq.snp.makeConstraints() { make in
                make.center.equalTo(center)
                make.width.equalTo(size)
                make.height.equalTo(size)
            }
            sq.backgroundColor = color
            sq.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1.0)
            sq.layer.borderWidth = CGFloat(size / 20 + 1)
            return sq
        }()
    }
    
    @objc private func onTap(_ qesture: UITapGestureRecognizer) {
        print("sds")
        qesture.view!.addSubview(getRandomSquare(withParent: qesture.view!))
        qesture.view!.addSubview(getRandomSquare(withParent: qesture.view!))
        qesture.view!.addSubview(getRandomSquare(withParent: qesture.view!))
    }
    
    private func getRandomSize(withParentWidth width: CGFloat) -> Int {
        Int.random(in: minSize...Int(width / 4))
    }
    
    private func getRandomColor() -> UIColor {
        colors.randomElement() ?? .white
    }
    
    private func getRandomCenter(withParent parent: UIView, withSize size: Int) -> CGPoint {
        let leftBorder = Int(parent.bounds.minX) + size / 2
        let rightBorder = Int(parent.bounds.maxX) - size / 2
        let topBorder = Int(parent.bounds.minY) + size / 2
        let bottomBorder = Int(parent.bounds.maxY) - size / 2
        
        return CGPoint(x: Int.random(in: leftBorder...rightBorder), y: Int.random(in: topBorder...bottomBorder))
    }
}
