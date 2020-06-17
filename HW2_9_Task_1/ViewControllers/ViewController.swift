//
//  ViewController.swift
//  HW2_9_Task_1
//
//  Created by Роман Захаров on 16.06.2020.
//  Copyright © 2020 Роман Захаров. All rights reserved.
//

import UIKit
import Spring

enum AnimationPreset: String, CaseIterable {
    case SlideLeft = "slideLeft"
    case SlideRight = "slideRight"
    case SlideDown = "slideDown"
    case SlideUp = "slideUp"
    case SqueezeLeft = "squeezeLeft"
    case SqueezeRight = "squeezeRight"
    case SqueezeDown = "squeezeDown"
    case SqueezeUp = "squeezeUp"
    case FadeIn = "fadeIn"
    case FadeOut = "fadeOut"
    case FadeOutIn = "fadeOutIn"
    case FadeInLeft = "fadeInLeft"
    case FadeInRight = "fadeInRight"
    case FadeInDown = "fadeInDown"
    case FadeInUp = "fadeInUp"
    case ZoomIn = "zoomIn"
    case ZoomOut = "zoomOut"
    case Fall = "fall"
    case Shake = "shake"
    case Pop = "pop"
    case FlipX = "flipX"
    case FlipY = "flipY"
    case Morph = "morph"
    case Squeeze = "squeeze"
    case Flash = "flash"
    case Wobble = "wobble"
    case Swing = "swing"
}

enum AnimationCurve: String, CaseIterable {
    case EaseIn = "easeIn"
    case EaseOut = "easeOut"
    case EaseInOut = "easeInOut"
    case Linear = "linear"
    case Spring = "spring"
    case EaseInSine = "easeInSine"
    case EaseOutSine = "easeOutSine"
    case EaseInOutSine = "easeInOutSine"
    case EaseInQuad = "easeInQuad"
    case EaseOutQuad = "easeOutQuad"
    case EaseInOutQuad = "easeInOutQuad"
    case EaseInCubic = "easeInCubic"
    case EaseOutCubic = "easeOutCubic"
    case EaseInOutCubic = "easeInOutCubic"
    case EaseInQuart = "easeInQuart"
    case EaseOutQuart = "easeOutQuart"
    case EaseInOutQuart = "easeInOutQuart"
    case EaseInQuint = "easeInQuint"
    case EaseOutQuint = "easeOutQuint"
    case EaseInOutQuint = "easeInOutQuint"
    case EaseInExpo = "easeInExpo"
    case EaseOutExpo = "easeOutExpo"
    case EaseInOutExpo = "easeInOutExpo"
    case EaseInCirc = "easeInCirc"
    case EaseOutCirc = "easeOutCirc"
    case EaseInOutCirc = "easeInOutCirc"
    case EaseInBack = "easeInBack"
    case EaseOutBack = "easeOutBack"
    case EaseInOutBack = "easeInOutBack"
}


class ViewController: UIViewController {

    @IBOutlet var springAnimationView: SpringView!
    @IBOutlet var springAnimationLabel: SpringLabel!
    @IBOutlet var startSpringAnimationButton: SpringButton!
    
    var codeText: String = ""
    var animation: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        springAnimationView.layer.cornerRadius = 10
        startSpringAnimationButton.layer.cornerRadius = 10
        animation = AnimationPreset.allCases.randomElement()!.rawValue
        startSpringAnimationButton.setTitle(animation, for: .normal)
    }


    @IBAction func startSpringAnimation(_ sender: SpringButton) {
        let curve = AnimationCurve.allCases.randomElement()!.rawValue
        let force: CGFloat = 1
        let delay: CGFloat = 0
        let duration: CGFloat = 0.7
        let damping: CGFloat = 0.7
        let velocity: CGFloat = 0.7
        let rotate: CGFloat = 0
        
        codeText = ""
        if animation != "" {
            codeText += "animation = \"\(animation)\"\n"
        }
        if curve != "" {
            codeText += "curve = \"\(curve)\"\n"
        }
        if force != 1 {
            codeText += String(format: "layer.force =  %.1f\n", Double(force))
        }
        if duration != 0.7 {
            codeText += String(format: "layer.duration =  %.1f\n", Double(duration))
        }
        if delay != 0 {
            codeText += String(format: "layer.delay =  %.1f\n", Double(delay))
        }
        if rotate != 0 {
            codeText += String(format: "layer.rotate =  %.1f\n", Double(rotate))
        }
        if damping != 0.7 {
            codeText += String(format: "layer.damping =  %.1f\n", Double(damping))
        }
        if velocity != 0.7 {
            codeText += String(format: "layer.velocity =  %.1f\n", Double(velocity))
        }

        springAnimationLabel.text = codeText
        
        springAnimationView.animation = animation
        springAnimationView.curve = curve
        springAnimationView.force = 2
        springAnimationView.duration = 1
        springAnimationView.delay = 1
        springAnimationView.rotate = 1
        springAnimationView.damping = 1
        springAnimationView.velocity = 1
        springAnimationView.animate()
        
        animation = AnimationPreset.allCases.randomElement()!.rawValue
        startSpringAnimationButton.setTitle(animation, for: .normal)
//        sender.animation = animation
//        sender.force = 1
//        sender.duration = 0.7
//        sender.animate()
    }
}

