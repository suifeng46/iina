//
//  Utility.swift
//  mpvx
//
//  Created by lhc on 8/7/16.
//  Copyright © 2016年 lhc. All rights reserved.
//

import Cocoa

class Utility {
  static func showAlert(message: String, alertStyle: NSAlertStyle = .critical) {
    let alert = NSAlert()
    alert.messageText = message
    alert.alertStyle = alertStyle
    alert.runModal()
  }
  
  static func log(_ message: String) {
    NSLog("%@", message)
  }
  
  static func assert(_ expr: Bool, _ errorMessage: String, _ block: () -> Void = {}) {
    if !expr {
      NSLog("%@", errorMessage)
      block()
      exit(1)
    }
  }
  
  static func fatal(_ message: String, _ block: () -> Void = {}) {
    NSLog("%@", message)
    block()
    exit(1)
  }
  
  class Regex {
    var regex: RegularExpression?
    
    init (_ pattern: String) {
      if let exp = try? RegularExpression(pattern: pattern, options: []) {
        self.regex = exp
      } else {
        Utility.fatal("Cannot create regex \(pattern)")
      }
    }
    
    func matches(_ str: String) -> Bool {
      return regex?.numberOfMatches(in: str, options: [], range: NSMakeRange(0, str.characters.count)) > 0
    }
  }

}
