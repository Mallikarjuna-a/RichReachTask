//
//  ViewController.swift
//  RichReachTask
//
//  Created by Mallikarjuna on 02/01/21.
//  Copyright © 2021 Mallikarjuna. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var categories = ["Competition Info","Complaints","Market info","Newsletter","Other"]
    var selectedCategory = 0

    @IBOutlet weak var createChannelTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        createChannelTableView.delegate = self
        createChannelTableView.dataSource = self
        let titleCell = UINib(nibName: "TitleTableViewCell", bundle:nil)
        createChannelTableView.register(titleCell, forCellReuseIdentifier: "TitleCell")
        let relatedCell = UINib(nibName: "RelatedtoTableViewCell", bundle: nil)
        createChannelTableView.register(relatedCell, forCellReuseIdentifier: "RelatedCell")
        let participantsCell = UINib(nibName: "ParticipantsTableViewCell", bundle: nil)
        createChannelTableView.register(participantsCell, forCellReuseIdentifier: "ParticipantsCell")
        let communicationCell = UINib(nibName: "CommunicationsTableViewCell", bundle: nil)
        createChannelTableView.register(communicationCell, forCellReuseIdentifier: "CommunicationCell")
        let generalCell = UINib(nibName: "GeneralTableViewCell", bundle: nil)
        createChannelTableView.register(generalCell, forCellReuseIdentifier: "GeneralCell")
        let createChannelCell = UINib(nibName: "CreatChannelTableViewCell", bundle: nil)
        createChannelTableView.register(createChannelCell, forCellReuseIdentifier: "CreateChannelCell")
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 30))
        let label = UILabel()
        
        if section == 0 {
            label.frame = CGRect(x: 5, y: 0, width: headerView.frame.width-10, height: 30)
            label.text = "Title(*)"
            label.textAlignment = .left
        } else if section == 1 {
            label.frame = CGRect(x: 5, y: 0, width: headerView.frame.width-10, height: 30)
            label.text = "Category(*)"
            label.textAlignment = .left
            
        } else if section == 2 {
            label.frame = CGRect(x: 5, y: 0, width: headerView.frame.width-10, height: 30)
            label.text = "Related to"
            label.textAlignment = .left
            
        } else if section == 3 {
            label.frame = CGRect(x: 50, y: 0, width: headerView.frame.width-60, height: 30)
            label.text = "Participants"
            headerView.backgroundColor = UIColor.gray
            label.textAlignment = .center
            let imageView = UIImageView(image: UIImage(named: "abc"))
            imageView.frame = CGRect(x: 5, y: 0, width: 30, height: 30)
            headerView.addSubview(imageView)
        } else if section == 4 {
            label.frame = CGRect(x: 5, y: 0, width: headerView.frame.width-10, height: 30)
            headerView.backgroundColor = UIColor.gray
            label.text = "Communications"
            label.textAlignment = .center
            
        } else if section == 5 {
            label.frame = CGRect(x: 5, y: 0, width: headerView.frame.width-10, height: 30)
            label.text = "General"
            
        } else {
            label.frame = CGRect(x: 5, y: 0, width: headerView.frame.width-10, height: 30)
            label.text = ""
            
        }
        
        headerView.addSubview(label)
        return headerView
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TitleCell", for: indexPath) as! TitleTableViewCell
            cell.titleLbl.text = "Markou Pharmacities"
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TitleCell", for: indexPath) as! TitleTableViewCell
            cell.titleLbl.text = "Sales Leads"
            return cell
        } else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RelatedCell", for: indexPath)
            return cell
        } else if indexPath.section == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ParticipantsCell", for: indexPath)
            return cell
        } else if indexPath.section == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CommunicationCell", for: indexPath)
            return cell
        } else if indexPath.section == 5 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "GeneralCell", for: indexPath)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CreateChannelCell", for: indexPath)
            return cell
        
        }
    }
//
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if section == 0 {
//            return "Title(*)"
//        } else if section == 1 {
//            return "Category(*)"
//        } else if section == 2 {
//            return "Related to"
//        } else if section == 3 {
//            return "Participants"
//        } else if section == 4 {
//            return "Communications"
//        } else if section == 5 {
//            return "General"
//        } else {
//            return ""
//        }
//    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 || indexPath.section == 1{
            return 40
        } else if indexPath.section == 2 {
            return 150
        } else if indexPath.section == 3 {
            return 120
        } else if indexPath.section == 4 {
            return 80
        } else if indexPath.section == 5 {
            return 100
        } else {
            return 44
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 || section == 1 || section == 2 || section == 3 || section == 4 || section == 5{
            return 40
        } else {
            return 30
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            selectCategory()

        }
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func selectCategory() {
        let categorySheet = UIAlertController(title: "Channel Category", message: nil, preferredStyle: .actionSheet)
        for i in 0..<categories.count {
            let action = UIAlertAction(title: categories[i], style: UIAlertAction.Style.default) { [weak self] _ in
                self?.selectedCategory = i
                self?.createChannelTableView.reloadData()
            }
            categorySheet.addAction(action)
        }
        let addCategoryAction = UIAlertAction(title: "+ Add a new category +", style: UIAlertAction.Style.destructive) { [weak self] _ in
            let alert = UIAlertController(title: "Category name", message: nil, preferredStyle: .alert)
            alert.addTextField()
            
            let submitAction = UIAlertAction(title: "Add", style: .default) { [unowned alert] _ in
                let answer = alert.textFields![0]
                if let categoryName = answer.text, !categoryName.isEmpty {
                    self?.categories.append(categoryName)
                }
            }
            alert.addAction(submitAction)
            self?.dismiss(animated: true) {
                self?.present(alert, animated: true)
            }
        }
        categorySheet.addAction(addCategoryAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        categorySheet.addAction(cancelAction)
        present(categorySheet, animated: true,completion: nil)
    }
}

