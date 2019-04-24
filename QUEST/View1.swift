//
//  View1.swift
//  QUEST
//
//  Created by Паша on 24/04/2019.
//  Copyright © 2019 Паша. All rights reserved.
//

import UIKit

class View1: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    var Action: Int?
    var ImageArray = [(image: "Экран 1",
                       NAME:  "ВДНХ",
                       Info: "Самые загадочные места\nЖанр: приключение",
                       indicator: "Group"),
                      (image: "Экран 2.2",
                       NAME:  "MosCity",
                       Info: "Самые красочные виды\nЖанр: панорама",
                       indicator: "Group2"),
                      (image: "Экран 3.3",
                       NAME:  "Джунгли",
                       Info: "Уровень сложности: 4\nЖанр: приключение",
                       indicator: "Group3")]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ImageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCellImage", for: indexPath) as! CollectionViewCellImage
        
        cell.ImageImg.image = UIImage(named: ImageArray[indexPath.row].image)
        cell.NAME.text = ImageArray[indexPath.row].NAME
        cell.Info.text = ImageArray[indexPath.row].Info
        cell.indicator.image = UIImage(named: ImageArray[indexPath.row].indicator)
        
        return cell
    }
    
    @IBAction func Q(_ sender: Any) {Action = 1}
    @IBAction func Karta(_ sender: Any) {Action = 2}
    @IBAction func SMS(_ sender: Any) {Action = 3}
    @IBAction func person(_ sender: Any) {Action = 4}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dvc = segue.destination as? ClassTabBar else {return}
        guard let ProveAction = Action else {return}
        dvc.Number_of_Section = ProveAction - 1
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
