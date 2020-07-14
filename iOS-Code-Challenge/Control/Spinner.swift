//
//  Agent.swift
//  iOS-Code-Challenge
//
//  Created by iSparshiT on 13/07/20.
//  Copyright © 2020 iSparshit. All rights reserved.
//

import UIKit
import SwiftUI

struct Spinner: UIViewRepresentable {
    let isAnimating: Bool
    let style: UIActivityIndicatorView.Style

    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let spinner = UIActivityIndicatorView(style: style)
        spinner.hidesWhenStopped = true
        return spinner
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}
