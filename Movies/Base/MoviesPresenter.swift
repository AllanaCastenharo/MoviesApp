//
//  MoviesPresenter.swift
//  Movies
//
//  Created by Allana Castenharo Santamaria on 27/05/22.
//

import UIKit

open class MoviesPresenter <Coordinator> {
    public let coordinator: Coordinator
    
    public init(coordinator: Coordinator) {
        self.coordinator = coordinator
    }
}
