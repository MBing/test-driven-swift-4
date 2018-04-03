//
//  ViewController.swift
//  FirstDemo
//
//  Created by Martin Demiddel on 26.03.18.
//  Copyright © 2018 Martin Demiddel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfVowels(in string: String) -> Int {
        let vowels: [Character] = [
            "a", "e", "i", "o", "u"
            ]
        
        return string.lowercased().reduce(0) {
            $0 + (vowels.contains($1) ? 1 : 0)
        }
    }
    
    func makeHeadline(from string: String) -> String {
        let words = string.components(separatedBy: " ")
        
        let headlineWords = words.map { (word) -> String in
            var mutableWord = word
            let first = mutableWord.remove(at: mutableWord.startIndex)
            
            return String(first).uppercased() + mutableWord
        }

        return headlineWords.joined(separator: " ")

//  objc like code implementation:
//
//        var headline = ""
//        for var word in words {
//            let firstCharacter = word.remove(at: word.startIndex)
//            headline += "\(String(firstCharacter).uppercased())\(word) "
//        }
//        headline.remove(at: headline.index(before: headline.endIndex))
//        return headline
    }
}
