//
//  ViewController.swift
//  MyPDF
//
//  Created by koingdev on 3/6/18.
//  Copyright © 2018 koingdev. All rights reserved.
//

import UIKit
import PDFGenerator

class ViewController: UIViewController {

    var data = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    
    @IBAction func generatePdf(_ sender: Any) {
        let filePath = NSHomeDirectory() + "/mypdf.pdf"
        var pages = [PDFPage]()
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let splittedArr = data.chunks(5)
        splittedArr.forEach {
            let tableVC = sb.instantiateViewController(withIdentifier: "tb") as! TableViewController
            tableVC.data = $0
            pages.append(PDFPage.view(tableVC.view))
        }
        try! PDFGenerator.generate(pages, to: filePath)
        print("DONE => \(filePath)")
    }

}

// FIXME: - Should replace with Swift 4
extension Array {
    func chunks(_ chunkSize: Int) -> [[Element]] {
        return stride(from: 0, to: self.count, by: chunkSize).map {
            Array(self[$0..<Swift.min($0 + chunkSize, self.count)])
        }
    }
}

// MARK: - Swift 4 Edition
//let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
//
//extension Array {
//    func splitBy(subSize: Int) -> [[Element]] {
//        return 0.stride(to: self.count, by: subSize).map { startIndex in
//            let endIndex = startIndex.advancedBy(subSize, limit: self.count)
//            return Array(self[startIndex ..< endIndex])
//        }
//    }
//}
//
//let chunks = arr.splitBy(5)
//
//print(chunks) // [[1, 2, 3, 4, 5], [6, 7, 8, 9, 10], [11, 12]]




