//
// @file library.swift
// @project SwiftFromC
// @author Matthew M. Burke <matthew.burke@captialone.com>
// @version 1.0 (2016-07-15)
//
// A few functions, returning various data types, that can be called from the C main.
//
import Foundation

@_silgen_name("retrieveAnInt") // override name mangling
func retrieveAnInt() -> Int {
     return 17 // the most random number
}

@_silgen_name("retrieveADouble")
func retrieveADouble() -> Double {
     return 8.124038404635961 // root 66
}

@_silgen_name("stringToC")
func stringToC() -> UnsafeMutablePointer<Int8> {
     let result = "Hello from Swift"
     let cString = result.cString(using: NSASCIIStringEncoding)!
     return UnsafeMutablePointer<Int8>(cString)
}
