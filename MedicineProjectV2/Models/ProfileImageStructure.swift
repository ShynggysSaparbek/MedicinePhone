//
//  ProfileImageStructure.swift
//  MedicineProjectV2
//
//  Created by w2 on 8/17/19.
//  Copyright © 2019 w2. All rights reserved.
//

import UIKit
import CoreData

struct ProfileImageStructure: Setable {
    var data: NSData?
    
    init(){
        
    }
    init(uiImage: UIImage){
        guard let png = uiImage.pngData() else {
            return
        }
        self.data = png as NSData
    }
    
    func setValues<T: NSManagedObject>(of object: T){
        guard let profileImage = object as? ProfileImage else { return }
        profileImage.setValue(data, forKey: "data")
    }
    mutating func getValues<T: NSManagedObject>(from object: T){
        guard let profileImage = object as? ProfileImage else { return }
        self.data = profileImage.data as NSData?
    }
}
