//
//  TVCNotes.swift
//  MyNotesApp
//
//  Created by Alumno on 4/2/19.
//  Copyright © 2019 UTNG. All rights reserved.
//

import UIKit

class TVCNotes: UITableViewCell {

    @IBOutlet weak var buDelete: UIButton!
    
    @IBOutlet weak var buEdit: UIButton!
    
    @IBOutlet weak var laTitle: UILabel!
    @IBOutlet weak var laDetails: UITextView!
    @IBOutlet weak var laDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func setNotes(note:MyNotes){
        laTitle.text = note.title
        laDetails.text = note.details
        
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "MM/dd/yy h:mm a"
        let now = dateFormat.string(from: note.date_save as! Date)
        laDate.text = now
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
