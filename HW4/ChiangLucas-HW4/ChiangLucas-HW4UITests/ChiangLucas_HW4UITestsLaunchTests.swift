//
//  ChiangLucas_HW4UITestsLaunchTests.swift
//  ChiangLucas-HW4UITests
//
//  Created by Lucas Chiang on 10/5/25.
//

// Project: ChiangLucas-HW4
// EID: lmc4866
// Course: CS329E

import XCTest

final class ChiangLucas_HW4UITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
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
