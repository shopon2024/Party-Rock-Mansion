//
//  PartyCell.swift
//  partyRockmansion2
//
//  Created by Habibur Rahman on 3/16/17.
//  Copyright © 2017 Habibur Rahman. All rights reserved.
//

import UIKit

class PartyCell: UITableViewCell {

    @IBOutlet weak var videoPreviewImage: UIImageView!
    @IBOutlet weak var videoTitleImage: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func updateUI(partyRock: PartyRock){
        videoTitleImage.text = partyRock.videoTitle
        
        let url = URL(string: partyRock.videoImageURL)!
        
        DispatchQueue.global().async {
            do{
                let data = try Data(contentsOf: url)
                
                DispatchQueue.global().sync {
                    self.videoPreviewImage.image = UIImage(data: data)
                }
                
            }catch {
                //handle error
            }
        }
    }

}
