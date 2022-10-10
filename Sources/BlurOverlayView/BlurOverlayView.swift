import Foundation
import UIKit

@IBDesignable
public class BlurOverlayView: UIVisualEffectView {
    private var animator: UIViewPropertyAnimator?
    
    @IBInspectable
    public var intensity: Double = 0.2
    
    public var style: UIBlurEffect.Style = .regular {
        didSet {
            setupBlur()
        }
    }
    
    override public var isHidden: Bool {
        didSet {
            setupBlur()
        }
    }
    
    override public func didMoveToSuperview() {
        super.didMoveToSuperview()
        backgroundColor = .clear
        setupBlur()
    }
    
    override public func didMoveToWindow() {
        super.didMoveToWindow()
        setupBlur()
    }
    
    private func setupBlur() {
        animator?.stopAnimation(true)
        animator = nil
        effect = nil
        
        if isHidden {
            return
        }
        
        if superview == nil {
            return
        }
        
        if window == nil {
            return
        }
        
        if intensity <= 0.0 {
            return
        }
        
        if intensity >= 1.0 {
            effect = UIBlurEffect(style: style)
            return
        }
        
        animator = UIViewPropertyAnimator(duration: 1, curve: .linear)
        
        animator!.addCompletion { [weak self] _ in
            DispatchQueue.main.async { [weak self] in
                self?.setupBlur()
            }
        }
        
        animator!.addAnimations { [weak self] in
            guard let self = self else {
                return
            }
            self.effect = UIBlurEffect(style: self.style)
        }
        
        animator!.fractionComplete = intensity
    }
    
    deinit {
        animator?.stopAnimation(true)
        animator = nil
    }
}
