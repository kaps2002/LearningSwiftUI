//
//  ImageSaver.swift
//  InterfaceUIKit
//
//  Created by Roro on 01/04/24.
//

import UIKit

class ImageSaver: NSObject {
    func writetoAlbum(image: UIImage){
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)

    }
    @objc func saveCompleted(_ image: UIImage, didFinishSavingwithError error: Error?, contextInfo: UnsafeRawPointer) {
        print("save completed")
    }
}
