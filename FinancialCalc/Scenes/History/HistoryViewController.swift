//
//  HistoryViewController.swift
//  FinancialCalc
//
//  Created by Bhagya Gunawardena on 12/6/20.
//  Copyright © 2020 iit. All rights reserved.
//

import UIKit
import CoreData

class HistoryViewController: CustomViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var tableView: UITableView!
    
    var loans = [Loan]()
    var mortgageList = [Loan]()
    var loanList = [Loan]()
    var investmentList = [Investment]()
    var savingsList = [Saving]()
    var showNoData: Bool = false
    var context:NSManagedObjectContext? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        return appDelegate.persistentContainer.viewContext
    }
    var selectedType : String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        loadData()
    }
    
    func loadData() {
        if let title = selectedType {
            self.title = "\(title) HISTORY"
            if (selectedType == "LOAN" || selectedType == "MORTGAGE") {
                if let tempLoans = loadLoans() {
                    for loan in tempLoans {
                        guard let loanType = loan.type else {
                            return
                        }
                        if loanType == "LOAN" {
                            loanList += [loan]
                        } else {
                            mortgageList += [loan]
                        }
                    }
                    if ((loanList.count == 0 && selectedType == "LOAN") || (mortgageList.count == 0 && selectedType == "MORTGAGE")) {
                        showNoData = true
                        tableView.beginUpdates()
                        tableView.rowHeight = 30
                        tableView.endUpdates()
                    }
                    tableView.reloadData()
                }
            } else if (selectedType == "SAVING") {
                if let savings = loadSavings() {
                    savingsList = savings
                    tableView.reloadData()
                }
            } else if (selectedType == "INVESTMENT"){

                if let investments = loadInvestments() {
                    investmentList = investments
                    tableView.reloadData()
                }
            }
        }
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 240
        tableView.separatorStyle = .none
    }

    private func loadLoans() -> [Loan]? {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Loan")
        do {
            let loans = try self.context?.fetch(request) as! [Loan]
            if(loans.count > 0) {
                return loans
            } else {
                showNoData = true
                tableView.beginUpdates()
                tableView.rowHeight = 30
                tableView.endUpdates()
                print("No results found")
            }
        } catch {
            print("Error while fetching items")
        }
        return nil
    }
    
    private func loadSavings() -> [Saving]? {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Saving")
        do {
            let savings = try self.context?.fetch(request) as! [Saving]
            if(savings.count > 0) {
                return savings
            } else {
                showNoData = true
                tableView.beginUpdates()
                tableView.rowHeight = 30
                tableView.endUpdates()
                print("No results found")
            }
        } catch {
            print("Error while fetching items")
        }
        return nil
    }
    
    private func loadInvestments() -> [Investment]? {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Investment")
        do {
            let investments = try self.context?.fetch(request) as! [Investment]
            if(investments.count > 0) {
                return investments
            } else {
                showNoData = true
                tableView.beginUpdates()
                tableView.rowHeight = 30
                tableView.endUpdates()
                print("No results found")
            }
        } catch {
            print("Error while fetching items")
        }
        return nil
    }
}

extension HistoryViewController : UITableViewDataSource , UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (!showNoData) {
            if (selectedType == "LOAN") {
                return loanList.count
            } else if (selectedType == "MORTGAGE") {
                return mortgageList.count
            } else if (selectedType == "SAVING") {
                return savingsList.count
            } else if (selectedType == "INVESTMENT"){
                return investmentList.count
            } else {
                return 0
            }
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (showNoData) {
            let cellIdentifier = "noDataCell"
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
            if let type = selectedType?.lowercased() {
                cell.textLabel?.text = "No history data found for \(type)"
                cell.textLabel?.textColor = ColorName.buttonGreyLight.color
                cell.textLabel?.contentMode = .center
            }
            return cell
        } else {
            let cellIdentifier = "historyCell"
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? HistoryTableViewCell else {
                fatalError("The dequed cell is not an instance of HistoryTableViewCell")
            }
            cell.holderSetup(selectedType: selectedType ?? "")
            if (selectedType == "LOAN") {
                let item = loanList[indexPath.row]
                cell.setUp(valPresent: item.loan ?? "",
                           valFuture: item.total ?? "",
                           valRate: item.rate ?? "",
                           valYear: item.year ?? "",
                           valCompound: item.compounds ?? "",
                           valContribution: item.payment ?? "",
                           time: item.time ?? "")
            } else if (selectedType == "MORTGAGE") {
                let item = mortgageList[indexPath.row]
                cell.setUp(valPresent: item.loan ?? "",
                           valFuture: item.total ?? "",
                           valRate: item.rate ?? "",
                           valYear: item.year ?? "",
                           valCompound: item.compounds ?? "",
                           valContribution: item.payment ?? "",
                           time: item.time ?? "")
            } else if (selectedType == "SAVING") {
                let item = savingsList[indexPath.row]
                cell.setUp(valPresent: item.presentValue ?? "",
                           valFuture: item.futureValue ?? "",
                           valRate: item.interestRate ?? "",
                           valYear: item.years ?? "",
                           valCompound: item.compounds ?? "",
                           valContribution: item.monthlyContribution ?? "",
                           time: item.time ?? "")
            } else if (selectedType == "INVESTMENT"){
                let item = investmentList[indexPath.row]
                cell.setUp(valPresent: item.presentValue ?? "",
                           valFuture: item.futureValue ?? "",
                           valRate: item.interestRate ?? "",
                           valYear: item.years ?? "",
                           valCompound: item.compounds ?? "",
                           valContribution: "",
                           time: item.time ?? "")
            }
            return cell
        }
    }
    
}
