//
//  MovieDetailsViewController.swift
//  Flix
//
//  Created by Hao Qin on 2/24/21.
//

import UIKit
import AlamofireImage

class MovieDetailsViewController: UIViewController {
    
    @IBOutlet weak var backdropView: UIImageView!
    
    @IBOutlet weak var posterView: UIImageView!

    @IBOutlet weak var synophsisLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!

    
    var movie: [String:Any]!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleLabel.text = movie["title"] as? String
        titleLabel.sizeToFit()
        synophsisLabel.text = movie["overview"] as? String
        synophsisLabel.sizeToFit()
        let baseUrl="https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string:baseUrl+posterPath)
        posterView.af.setImage(withURL: posterUrl!)
        
        let backdropPath = movie["backdrop_path"] as! String
        let backdropUrl = URL(string:"https://image.tmdb.org/t/p/w780"+backdropPath)
        backdropView.af.setImage(withURL: backdropUrl!)

    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        
        // Pass the selected object to the new view controller
        
        
        let webViewController = segue.destination as! TrailerWebView
        webViewController.movie = movie
    }

}
