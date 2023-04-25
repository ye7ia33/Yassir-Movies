//
//  UIViewController+Extension.swift
//  Yassir-Movies
//
//  Created by Yahia El-Dow on 25/04/2023.
//

import UIKit
import NVActivityIndicatorView

extension UIViewController {
    
    func showToast(message: String) {
        
        let toastContainer = UIView(frame: CGRect())
        toastContainer.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastContainer.alpha = 0.0
        toastContainer.layer.cornerRadius = 25;
        toastContainer.clipsToBounds  =  true
        
        let toastLabel = UILabel(frame: CGRect())
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font.withSize(12.0)
        toastLabel.text = message
        toastLabel.clipsToBounds  =  true
        toastLabel.numberOfLines = 0
        
        toastContainer.addSubview(toastLabel)
        self.getTopVC()?.view.addSubview(toastContainer)
        
        toastLabel.translatesAutoresizingMaskIntoConstraints = false
        toastContainer.translatesAutoresizingMaskIntoConstraints = false
        
        let a1 = NSLayoutConstraint(item: toastLabel, attribute: .leading, relatedBy: .equal, toItem: toastContainer, attribute: .leading, multiplier: 1, constant: 15)
        let a2 = NSLayoutConstraint(item: toastLabel, attribute: .trailing, relatedBy: .equal, toItem: toastContainer, attribute: .trailing, multiplier: 1, constant: -15)
        let a3 = NSLayoutConstraint(item: toastLabel, attribute: .bottom, relatedBy: .equal, toItem: toastContainer, attribute: .bottom, multiplier: 1, constant: -15)
        let a4 = NSLayoutConstraint(item: toastLabel, attribute: .top, relatedBy: .equal, toItem: toastContainer, attribute: .top, multiplier: 1, constant: 15)
        toastContainer.addConstraints([a1, a2, a3, a4])
        
        let c1 = NSLayoutConstraint(item: toastContainer, attribute: .leading, relatedBy: .equal, toItem: getTopVC()?.view, attribute: .leading, multiplier: 1, constant: 65)
        let c2 = NSLayoutConstraint(item: toastContainer, attribute: .trailing, relatedBy: .equal, toItem: getTopVC()?.view, attribute: .trailing, multiplier: 1, constant: -65)
        let c3 = NSLayoutConstraint(item: toastContainer, attribute: .bottom, relatedBy: .equal, toItem: getTopVC()?.view, attribute: .bottom, multiplier: 1, constant: -100)
        self.getTopVC()?.view.addConstraints([c1, c2, c3])
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
            toastContainer.alpha = 1.0
        }, completion: { _ in
            UIView.animate(withDuration: 0.5, delay: 1.5, options: .curveEaseOut, animations: {
                toastContainer.alpha = 0.0
            }, completion: {_ in
                toastContainer.removeFromSuperview()
            })
        })
    }
    
     func getTopVC()-> UIViewController?{
        if let vc = UIApplication.shared.keyWindow?.rootViewController {
            var topController =  vc
            while (topController.presentedViewController != nil) {
                topController = topController.presentedViewController!
            }
            return topController
        }
        return nil
        
    }
    
    func showLoader() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.view.isUserInteractionEnabled = false
            let dimmedView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
            dimmedView.tag = -1991
            dimmedView.backgroundColor = UIColor.black.withAlphaComponent(0.6)
            
            let activityIndicatorView = NVActivityIndicatorView(frame: CGRect(x: self.view.frame.midX - 50 / 2,
                                                                              y: self.view.frame.midY - 50 / 2,
                                                                              width: 50 , height: 50), color: .white)
            activityIndicatorView.type = .ballClipRotatePulse
            //            activityIndicatorView.type = .pacman
            dimmedView.addSubview(activityIndicatorView)
            self.view.addSubview(dimmedView)
            activityIndicatorView.startAnimating()
        }
        
    }
    
    func hideLoader() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.view.subviews.forEach{
                if $0.tag == -1991 {
                    self.view.isUserInteractionEnabled = true
                    $0.removeFromSuperview()
                    return
                }
                
            }
        }
        
    }
}
