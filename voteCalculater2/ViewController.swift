//
//  ViewController.swift
//  voteCalculater2
//
//  Created by Jendrick Burgos on 11/1/24.
import UIKit

class ViewController: UIViewController {
    
    let blob1 = [18,2,1,16,9,8,3,10,17,1,1,15,20,20,14,3,19,18,14,22,23,7,20,18,11,20,16,18,5]
    
    let blob2 = [23,3,3,20,10,1,5,9,2,16,13,1,3,16,13,6,22,9,20,6,19,18,13,1,20,3,17,20,4]
    
    let blob3 = [17,20,17,6,3,18,6,20,18,3,17,14,2,8,19,18,13,7,17,18,1,1,2,17,18,9,18,4,16]
    
    var blobbyHighScore = 0
    var whatBlobby = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLength()
       // checkForDuplicates()
    }
    func checkLength(){
        //are all 3 array the same lengths
        if blob1.count == blob2.count && blob2.count == blob3.count {
            print("The arrays are the same length.")
            checkForDuplicates()
        } else {
            print("The arrays do not match.")
        }
    }
    func checkForDuplicates(){
        //Did any students vote for the same student twice?
        for i in 0..<blob1.count {
            if blob1[i] == blob2[i] || blob1[i] == blob3[i] ||
                blob2[i] == blob3[i] {
                print("Found a duplicate for \(i)")
            } else {
                //print("Didnt find any duplicates")
                tallyVote()
            }
        }
    }
    func tallyVote() {
        for b in 1...23 {
            let allBlob = blob1 + blob2 + blob3
            var tempCount = 0
            for i in allBlob {
                if b == i {
                    tempCount += 1
                }
            }
            print("Blobby \(b) recieved \(tempCount) votes")
            if tempCount > blobbyHighScore {
                blobbyHighScore = tempCount
                whatBlobby = b
            }
        }
        print("THE WINNER IS \(whatBlobby) WITH \(blobbyHighScore) VOTES, CONGRATS \(whatBlobby)")
    }
}
