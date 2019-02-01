import UIKit

class Autografo: UIViewController, SignatureDrawingViewControllerDelegate {
    
    // MARK: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        signatureViewController.delegate = self
        addChild(signatureViewController)
        view.addSubview(signatureViewController.view)
        signatureViewController.didMove(toParent: self)
        
        resetButton.addTarget(self, action: #selector(resetTapped), for: .touchUpInside)
        view.addSubview(resetButton)
        
        // Constraints
        
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints([
            NSLayoutConstraint.init(item: resetButton, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 20),
            NSLayoutConstraint.init(item: resetButton, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 20),
            
            NSLayoutConstraint.init(item: signatureViewController.view, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0),
            NSLayoutConstraint.init(item: signatureViewController.view, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0),
            NSLayoutConstraint.init(item: signatureViewController.view, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint.init(item: signatureViewController.view, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0),
            ])
        
        
    }
    
    // MARK: SignatureDrawingViewControllerDelegate
    
    func signatureDrawingViewControllerIsEmptyDidChange(controller: SignatureDrawingViewController, isEmpty: Bool) {
        resetButton.isHidden = isEmpty
    }
    
    // MARK: Private
    
    private let signatureViewController = SignatureDrawingViewController()
    
    private let resetButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Reset", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        return button
    }()
    
    @objc private func resetTapped() {
        signatureViewController.reset()
    }
    
}

