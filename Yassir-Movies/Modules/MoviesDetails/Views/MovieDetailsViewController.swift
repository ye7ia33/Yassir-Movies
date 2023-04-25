//
//  MovieDetailsViewController.swift
//  Yassir-Movies
//
//  Created by Yahia El-Dow on 25/04/2023.
//

import UIKit

class MovieDetailsViewController: UIViewController, Storyboarded {
    var viewModel: MoviesDetailsViewModel?
    
    @IBOutlet weak var posterImage: UIImageView! {
        didSet {
            posterImage.image = #imageLiteral(resourceName: "default-image")
        }
    }
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            self.titleLabel.text = ""
        }
    }
    @IBOutlet weak var subtitleLabel: UILabel! {
        didSet {
            self.subtitleLabel.text = ""
        }
    }
    @IBOutlet weak var overviewLabel: UILabel! {
        didSet {
            self.overviewLabel.text = ""
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Trending Movies"
        self.setViews()
        self.setViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel?.getMoviesDetails()
    }
    
    private func setViewModel() {
        viewModel?.showLoader = {  [weak self] in
            self?.showLoader()
        }
        
        viewModel?.hideLoader = {  [weak self] in
            self?.hideLoader()
        }
        
        viewModel?.completionHandlerWithErrorMessage = { [weak self] (errMsg) in
            self?.showToast(message: errMsg)
        }
        
        viewModel?.completionHandler = { [weak self] in
            self?.setViews()
        }
        
    }
    
    private func setViews() {
        self.posterImage.loadImageFromUrl(imgUrl: viewModel?.getPosterURL() ?? "")
        self.titleLabel.text = viewModel?.getTitle()
        self.subtitleLabel.text = viewModel?.getSubtitle()
        self.overviewLabel.text = viewModel?.getOverview()
    }
    
    
}
