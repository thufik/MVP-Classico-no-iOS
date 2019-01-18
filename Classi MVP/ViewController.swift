//
//  ViewController.swift
//  Classi MVP
//
//  Created by EquipeSuporteAplicacao on 7/30/18.
//  Copyright © 2018 Thufik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    lazy var data : [String] = []
    lazy var presenter = { () -> Presenter in
        var model = Model()
        var presenter = Presenter(delegate: self, model : model)
        
        return presenter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        presenter.requestData()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController : UITableViewDelegate{
    
}

extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = data[indexPath.row]
        
        return cell
    }
}

extension ViewController : ViewProtocol{
    func setDataArray(array: [String]) {
        self.data = array
    }
}

protocol ViewProtocol {
    func setDataArray(array : [String])
}

