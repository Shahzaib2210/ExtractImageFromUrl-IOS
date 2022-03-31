//
//  ViewController.swift
//  ExtractImageFromUrl
//
//  Created by Shahzaib Mumtaz on 31/03/2022.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    
    @IBOutlet weak var img: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //getting the path of the mp3 file
        let filePath = Bundle.main.path(forResource: "Song", ofType: "mp3")
        //transforming it to url
        let fileUrl = NSURL(fileURLWithPath: filePath!)
        
        //instanciating asset with url associated file
        let asset = AVAsset(url: fileUrl as URL) as AVAsset
        
        //using the asset property to get the metadata of file
        for metaDataItems in asset.commonMetadata {
            
            //  getting the title of the song
            if metaDataItems.commonKey == .commonKeyTitle {
                let titleData = metaDataItems.value as! NSString
                let title = titleData.substring(to: 9)
                let singerData = titleData.substring(from: 12)
                let singer = (singerData as NSString).substring(to: 13)
                print("title ---> \(title)")
                print("singer ---> \(singer)")
            }
            
            //getting the "Artist of the mp3 file"
            if metaDataItems.commonKey == .commonKeyArtist {
                let artistData = metaDataItems.value as! NSString
                print("artist ---> \(artistData)")
            }
            
            //   getting the thumbnail image associated with file
            if metaDataItems.commonKey == .commonKeyArtwork
            {
                let imageData = metaDataItems.value as! NSData
                let image2: UIImage = UIImage(data: imageData as Data)!
                img.image = image2
            }
        }
    }
}
