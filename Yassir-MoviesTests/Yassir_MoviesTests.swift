//
//  Yassir_MoviesTests.swift
//  Yassir-MoviesTests
//
//  Created by Yahia El-Dow on 24/04/2023.
//

import XCTest
@testable import Yassir_Movies

final class Yassir_MoviesTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testDetailsViewModel() {
        let dummyObj = self.getMoviesDetailsDummy()
        XCTAssertNotNil(dummyObj != nil, "The Dummy Object is null")
        XCTAssert(dummyObj?.id != nil, "The Dummy Object is equal null")
        
        let viewModel = MoviesDetailsViewModel(movieDetails: dummyObj!)
        XCTAssertNotEqual(viewModel.getTitle(), "")
        XCTAssertNotEqual(viewModel.getOverview(), "")
        XCTAssertNotEqual(viewModel.getSubtitle(), "")
        XCTAssertNotEqual(viewModel.getPosterURL(), "")
    }
    
    private func getMoviesDetailsDummy() -> MovieDetails? {
        let json = """
            {
                "id": 1,
                "original_title": "test_original_title",
                "overview": "test_overview",
                "poster_path": "test_poster_path",
                "release_date" : "test_release_date",
                "vote_average": 3.5,
                "vote_count": 40
            }
            """
        
        let jsonData = json.data(using: .utf8)!
        do {
            let decoder = JSONDecoder()
            let movieDetails = try decoder.decode(MovieDetails.self, from: jsonData)
            print(movieDetails)
            return movieDetails
        } catch {
            print(error)
            XCTFail("faile to create MovieDetails Object.")
            return nil
        }
        
    }
}

