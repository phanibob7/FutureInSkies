//
//  LaunchesVC.swift
//  FutureInSkies
//
//  Created by phanindra on 22/09/18.
//  Copyright © 2018 Phanibob. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class LaunchesVC: UITableViewController, NVActivityIndicatorViewable {

    var launchesArr: [Launch]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        navigationItem.leftBarButtonItem = createLabelHeader(title: "Launches")
        createAccountButton(in: self, action: #selector(openAccountVC))
        tableView.removeEmptyCells()
        tableView.separatorStyle = .none
        tableView.registerCellClasses([LaunchCell.self])
        
        
        addRefreshControl()
        getFeed(isRefresh: false)
    }

    @objc func openAccountVC() {
        
        if UserDefaults.standard.bool(forKey: kIsUserLoggedIn) {
            navigationController?.pushViewController(ProfileVC(), animated: true)
        } else {
            navigationController?.pushViewController(LoginVC(), animated: true)
        }
    }

}

extension LaunchesVC {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.launchesArr?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let launch: Launch = self.launchesArr?[indexPath.row] else { return UITableViewCell() }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: LAUNCH_CELL_ID, for: indexPath) as! LaunchCell
        cell.launchInfo = launch
        cell.updateData()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let launchObj = launchesArr?[indexPath.row] else { return }
        let detailVC = LaunchDetailsVC()
        detailVC.launchInfo = launchObj
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

//MARK: Network related stuff
extension LaunchesVC {
    func getFeed(isRefresh: Bool) {
        guard let launchesUrl = URL(string: LAUNCHES_URL) else {
            print("ERROR: Unable to construct URL")
            return
        }
        
        if isRefresh {
            if #available(iOS 10.0, *) {
                self.tableView.refreshControl?.beginRefreshing()
            } else {
                if let refreshView = self.tableView.backgroundView as? UIRefreshControl {
                    refreshView.beginRefreshing()
                }
            }
        } else {
            startAnimating(CGSize(width: 60, height: 60), message: "", type: .orbit,  color: navBarColor, fadeInAnimation: nil)
        }

        URLSession.shared.dataTask(with: launchesUrl) {[weak self] (data, response, error) in
            guard let data = data else {
                self?.stopAnimating(nil)
                self?.tableView.refreshControl?.endRefreshing()
                self?.present((self?.createAlertithMessage(string: "Unable to get launches feed! Try again."))!, animated: true, completion: nil)
                return
            }
            
            //            let dataStr = String(bytes: data, encoding: .utf8)
            //            print(dataStr!)
            //            print("++++++++++++++++++++\n\n\n")
            
            do {
                let launches = try JSONDecoder().decode([Launch].self, from: data)
                
//                launches.forEach({
//                    print("\n\n\($0)\n\n")
//                })
                
                self?.launchesArr = launches
                
                DispatchQueue.main.async {
                    if isRefresh {
                        if #available(iOS 10.0, *) {
                            self?.tableView.refreshControl?.endRefreshing()
                        } else {
                            if let refreshView = self?.tableView.backgroundView as? UIRefreshControl {
                                refreshView.endRefreshing()
                            }
                        }
                    } else {
                        self?.stopAnimating(nil)
                    }
                    
                    self?.tableView.reloadData()
                }
                
            } catch let jsonError {
                print("JSON DECODING ERROR: \(jsonError)")
            }
            
            }.resume()
    }
}

//MARK: Refresh control
extension LaunchesVC {
    func addRefreshControl() {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = navBarColor
        
        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
        
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.backgroundView = refreshControl
        }
    }
    
    @objc func refresh(_ refreshControl: UIRefreshControl) {
        getFeed(isRefresh: true)
    }
}
