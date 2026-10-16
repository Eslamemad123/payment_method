import Flutter
import UIKit
import XCTest

@testable import kashier_flutter_sdk

/// Tests for the Kashier Flutter SDK plugin's MethodChannel routing.
///
/// These tests verify that the plugin correctly handles incoming method calls,
/// validates arguments, and returns appropriate results or errors.
@available(iOS 14.0, *)
class RunnerTests: XCTestCase {

    private var plugin: KashierFlutterSdkPlugin!
    private var channel: FlutterMethodChannel!

    override func setUp() {
        super.setUp()
        // Create a real method channel for testing — we only test handle() directly,
        // so the channel is used for construction but not for actual messaging.
        let messenger = MockBinaryMessenger()
        channel = FlutterMethodChannel(name: "kashier_flutter_sdk_test", binaryMessenger: messenger)
        plugin = KashierFlutterSdkPlugin(channel: channel)
    }

    // MARK: - isApplePayAvailable

    func testIsApplePayAvailableReturnsBool() {
        let call = FlutterMethodCall(methodName: "isApplePayAvailable", arguments: nil)
        let expectation = expectation(description: "result")

        plugin.handle(call) { result in
            XCTAssertNotNil(result)
            XCTAssert(result is Bool, "Expected Bool, got \(type(of: result))")
            expectation.fulfill()
        }

        waitForExpectations(timeout: 1)
    }

    // MARK: - presentApplePay

    func testPresentApplePayMissingArgumentsReturnsError() {
        let call = FlutterMethodCall(methodName: "presentApplePay", arguments: nil)
        let expectation = expectation(description: "result")

        plugin.handle(call) { result in
            guard let error = result as? FlutterError else {
                XCTFail("Expected FlutterError, got \(String(describing: result))")
                expectation.fulfill()
                return
            }
            XCTAssertEqual(error.code, "INVALID_ARGUMENTS")
            expectation.fulfill()
        }

        waitForExpectations(timeout: 1)
    }

    func testPresentApplePayPartialArgumentsReturnsError() {
        // Missing supportedNetworks
        let args: [String: Any] = [
            "amount": 10.0,
            "currency": "EGP",
            "storeName": "Test Store"
        ]
        let call = FlutterMethodCall(methodName: "presentApplePay", arguments: args)
        let expectation = expectation(description: "result")

        plugin.handle(call) { result in
            guard let error = result as? FlutterError else {
                XCTFail("Expected FlutterError, got \(String(describing: result))")
                expectation.fulfill()
                return
            }
            XCTAssertEqual(error.code, "INVALID_ARGUMENTS")
            expectation.fulfill()
        }

        waitForExpectations(timeout: 1)
    }

    // MARK: - completeMerchantValidation

    func testCompleteMerchantValidationMissingArgumentsReturnsError() {
        let call = FlutterMethodCall(methodName: "completeMerchantValidation", arguments: nil)
        let expectation = expectation(description: "result")

        plugin.handle(call) { result in
            guard let error = result as? FlutterError else {
                XCTFail("Expected FlutterError, got \(String(describing: result))")
                expectation.fulfill()
                return
            }
            XCTAssertEqual(error.code, "INVALID_ARGUMENTS")
            expectation.fulfill()
        }

        waitForExpectations(timeout: 1)
    }

    // MARK: - Unknown method

    func testUnknownMethodReturnsNotImplemented() {
        let call = FlutterMethodCall(methodName: "nonExistentMethod", arguments: nil)
        let expectation = expectation(description: "result")

        plugin.handle(call) { result in
            XCTAssert(result is NSObject)
            // FlutterMethodNotImplemented is a sentinel NSObject
            XCTAssertTrue(result as? NSObject === FlutterMethodNotImplemented)
            expectation.fulfill()
        }

        waitForExpectations(timeout: 1)
    }
}

// MARK: - Mock Binary Messenger

/// Minimal mock of FlutterBinaryMessenger for test channel construction.
private class MockBinaryMessenger: NSObject, FlutterBinaryMessenger {
    func send(onChannel channel: String, message: Data?) {}

    func send(onChannel channel: String, message: Data?, binaryReply callback: FlutterBinaryReply?) {
        callback?(nil)
    }

    func setMessageHandlerOnChannel(_ channel: String, binaryMessageHandler handler: FlutterBinaryMessageHandler?) -> FlutterBinaryMessengerConnection {
        return FlutterBinaryMessengerConnection(0)
    }

    func cleanUpConnection(_ connection: FlutterBinaryMessengerConnection) {}
}
