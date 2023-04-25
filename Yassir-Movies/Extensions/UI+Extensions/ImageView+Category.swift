//
//  ImageView+Category.swift
//  Yassir-Movies
//
//  Created by Yahia El-Dow on 25/04/2023.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func loadImageFromUrl (imgUrl : String){
        if imgUrl.isEmpty {
            self.image = UIImage(named: "default-image")
            return
        }
        let encoding : String = imgUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let url = URL(string: encoding )
        let processor = DownsamplingImageProcessor(size: self.frame.size) |> RoundCornerImageProcessor(cornerRadius: 0)
        self.kf.indicatorType = .activity
        
        
        self.kf.setImage(with: url, placeholder: nil, options: [ .processor(processor), .scaleFactor(UIScreen.main.scale), .transition(.fade(1)), .cacheOriginalImage]) { [weak self] result in
                switch result {
                case .failure( _):
                    self?.image = UIImage(named: "default-image")
                    return
                case .success(_): return
                }
            }
        
    }
}
