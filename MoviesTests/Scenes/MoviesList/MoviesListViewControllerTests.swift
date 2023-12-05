//
//  MoviesListViewControllerTests.swift
//  MoviesTests
//
//  Created by Allana Castenharo Santamaria on 04/06/22.
//

import XCTest
import SnapshotTesting
@testable import Movies

final class MoviesListViewControllerTests: XCTestCase {
    
    let interactorSpy = MoviesListInteractorSpy()
    lazy var sut = MoviesListViewController(interactor: interactorSpy)
    
    func test_snapshot_view() {
        if UIScreen.main.sizeType == .iPhone5 {
            assertSnapshot(matching: sut, as: .image(on: .iPhoneSe, precision: 0.9), testName: "iphoneSE")
        } else {
            assertSnapshot(matching: sut, as: .image(on: .iPhoneX, precision: 0.9), testName: "intoTest")
        }
    }
}
