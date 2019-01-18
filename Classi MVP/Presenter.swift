//
//  Presenter.swift
//  Classi MVP
//
//  Created by EquipeSuporteAplicacao on 7/30/18.
//  Copyright © 2018 Thufik. All rights reserved.
//

import UIKit

class Presenter: NSObject {

    var delegate : ViewProtocol
    var model : Model
    
    init(delegate : ViewProtocol, model : Model) {
        self.delegate = delegate
        self.model = model
    }
    
    func requestData(){
        var array : [String] = []
        
        array = model.requestData()
        
        delegate.setDataArray(array: array)
    }
}
