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
    var context:NSManagedObjectContext? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        return appDelegate.persistentContainer.viewContext
    }
    var selectedType : String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "\(selectedType) HISTORY"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 240
        tableView.separatorStyle = .none

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
            tableView.reloadData()
        }
        
        if let savings = loadSavings() {
            savingsList = savings
            tableView.reloadData()
        }
    
        if let investments = loadInvestments() {
            investmentList = investments
            tableView.reloadData()
        }
    }

    private func loadLoans() -> [Loan]? {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Loan")
        do {
            let loans = try self.context?.fetch(request) as! [Loan]
            if(loans.count > 0) {
                return loans
            } else {
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
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
