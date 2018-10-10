
//
// Day29ViewController
// 30DaysOfiOS12
//
// Created by DevTechie Interactive on 10/7/18.
// Copyright © 2018 Devtechie. All rights reserved.
//

import UIKit

class Day29ViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var resultLabel: UILabel!
    
    var data = ["¿Hola cómo estás hoy?", "Hei, kuinka voit tänään?", "Ciao, come va oggi?", "오늘 어떻게 지내니?", "こんにちは今日はどのようにしていますか", "வணக்கம் நீங்கள் இன்று எப்படி உள்ளீர்கள்?", "你好，今天好嗎？"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.textView.text = data[0]
        self.resultLabel.text = ""
        self.title = "NLP Demo"
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(randomString))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func randomString() {
        let random = Int.random(in: 0..<data.count)
        textView.text = data[random]
    }
    
    @IBAction func detectLang(_ sender: UIButton) {
        let tagger = NSLinguisticTagger(tagSchemes: [NSLinguisticTagScheme.language], options: 0)
        tagger.string = textView.text
        langLocaleToName(localeId: tagger.dominantLanguage!)
    }
    
    func langLocaleToName(localeId: String) {
        let locale = NSLocale(localeIdentifier: localeId)
        resultLabel.text = countryFromCode(code: localeId) + "\n" + locale.displayName(forKey: .languageCode, value: localeId)!
    }
    
    func countryFromCode(code: String) -> String {
        // ko : Korean
        // it : Italian
        // ta : Tamil
        // es : Spanish
        // fi : Finish
        // ja : Japanese
        switch code {
        case "ko": return "Korean"
        case "it": return "Italian"
        case "ta": return "Tamil"
        case "es": return "Spanish"
        case "fi": return "Finish"
        case "ja": return "Japanese"
        case "zh-Hant": return "Chinese(Traditional)"
        default: return "English"
        }
    }

}
