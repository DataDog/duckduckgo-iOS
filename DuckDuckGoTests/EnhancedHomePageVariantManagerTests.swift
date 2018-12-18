//
//  EnhancedHomePageVariantManagerTests.swift
//  DuckDuckGo
//
//  Copyright © 2017 DuckDuckGo. All rights reserved.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import XCTest
@testable import Core

class EnhancedHomePageVariantManagerTests: XCTestCase {
    
    func testWhenSerpVariantAndOnPadThenVariantIsSelected() {
        
        let mockStatisticsStore = MockStatisticsStore()
        let mockRng = MockVariantRNG(returnValue: 0)
        
        let variantManager = DefaultVariantManager(storage: mockStatisticsStore, rng: mockRng, uiIdiom: .pad)
        variantManager.assignVariantIfNeeded()
        
        XCTAssertNotNil(mockStatisticsStore.variant)
    }

    func testWhenSerpVariantAndNotOnPadThenVariantIsSelected() {
        
        let mockStatisticsStore = MockStatisticsStore()
        let mockRng = MockVariantRNG(returnValue: 0)
        
        let variantManager = DefaultVariantManager(storage: mockStatisticsStore, rng: mockRng, uiIdiom: .phone)
        variantManager.assignVariantIfNeeded()
        
        XCTAssertNotNil(mockStatisticsStore.variant)
    }
    
    func testWhenEnhancedHomePageVariantAndNotOnPadThenVariantIsSelected() {
        
        let mockStatisticsStore = MockStatisticsStore()
        let mockRng = MockVariantRNG(returnValue: Variant.defaultVariants.count)
        
        let variantManager = DefaultVariantManager(storage: mockStatisticsStore, rng: mockRng, uiIdiom: .phone)
        variantManager.assignVariantIfNeeded()
        
        XCTAssertNotNil(mockStatisticsStore.variant)
    }

    func testWhenEnhancedHomePageVariantAndOnPadThenNoVariantIsSelected() {
        
        let mockStatisticsStore = MockStatisticsStore()
        let mockRng = MockVariantRNG(returnValue: Variant.defaultVariants.count)
        
        let variantManager = DefaultVariantManager(storage: mockStatisticsStore, rng: mockRng, uiIdiom: .pad)
        variantManager.assignVariantIfNeeded()
        
        XCTAssertNil(mockStatisticsStore.variant)
    }
    
}