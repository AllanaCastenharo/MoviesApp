//
//  MoviesListPresenterSpy.swift
//  MoviesTests
//
//  Created by Allana Castenharo Santamaria on 05/06/22.
//

import Foundation
@testable import Movies

class MoviesListPresenterSpy: MoviesListPresenting {
    enum Message: Equatable {

    }

    private(set) var receivedMessages: [Message] = []

}
