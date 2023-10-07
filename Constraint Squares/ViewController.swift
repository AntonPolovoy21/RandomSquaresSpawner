import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let colors: [UIColor] = [.red, .green, .blue, .white, .black]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTap)))
    }
    
    @objc private func onTap(_ gesture: UITapGestureRecognizer) {
        for _ in 0...2 {
            guard let view = gesture.view else { return }
            let sq = UIView()
            let sqSize = Int.random(in: Int(view.bounds.width / 7)...Int(view.bounds.width / 3))
            view.addSubview(sq)
            sq.backgroundColor = colors.randomElement() ?? .black
            sq.layer.borderWidth = 1
            sq.snp.makeConstraints(){
                $0.top.equalTo(Int.random(in: 0...Int(view.bounds.height - CGFloat(sqSize))))
                $0.left.equalTo(Int.random(in: 0...Int(view.bounds.width - CGFloat(sqSize))))
                $0.size.equalTo(CGSize(width: sqSize, height: sqSize))
            }
            sq.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTap)))
        }
    }
}
