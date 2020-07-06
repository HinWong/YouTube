//
//  VideoTableViewCell.swift
//  YouTube App
//
//  Created by Hin Wong on 7/6/20.
//  Copyright © 2020 Hin Wong. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    //MARK: - Outlets
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    //MARK: - Properties
    
    var video: Video?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ v: Video) {
        
        self.video = v
        
        //Set the title
        self.titleLabel.text = video?.title
        
        //Ensure that we have a video
        guard self.video != nil else {return}
        
        //Set the date label
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: video!.published)
        
        //Set the thumbnail
        guard self.video?.thumbnail != "" else {
            return
        }
        
        //Check cache before downloading data
        if let cachedData = CacheManager.getVideoCache(self.video!.thumbnail) {
            
            //Set the thumbnail image view
            self.thumbnailImageView.image = UIImage(data: cachedData)
            return
        }
        
        //Download the thumbnail
        let url = URL(string: self.video!.thumbnail)
        
        //Get the shared URL Session object
        let session = URLSession.shared
        
        //Create a data task
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if error == nil && data != nil {
                
                //Save the data in the cache
                CacheManager.setVideoCache(url!.absoluteString, data)
                
                //Check that the downloaded url matches the video thumbnail url that this cell is currently set to display
                
                if url!.absoluteString != self.video?.thumbnail {
                    //Video cell has been recycled for another video and no longer matches the thumbnail that was downloaded
                    return
                }
                
                //Create the image object
                let image = UIImage(data: data!)
                
                //Set the image view
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
                
            }
        }
        //Start data task
        dataTask.resume()
    }

}
