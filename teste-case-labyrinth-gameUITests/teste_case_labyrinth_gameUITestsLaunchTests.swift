//
//  teste_case_labyrinth_gameUITestsLaunchTests.swift
//  teste-case-labyrinth-gameUITests
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 08/06/23.
//

import XCTest

final class teste_case_labyrinth_gameUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
