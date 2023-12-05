//
//  BaseViewController.swift
//  Movies
//
//  Created by Allana Castenharo Santamaria on 27/05/22.
//

import UIKit

open class MoviesViewController <Interactor>: UIViewController {
    public let interactor: Interactor
    
    public init(interactor: Interactor) { 
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hideHairline()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        nil
    }
}
