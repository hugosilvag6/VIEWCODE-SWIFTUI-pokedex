//
//  LoginVC.swift
//  Pokedex-SwiftUI+UIKit
//
//  Created by Hugo Silva on 09/12/22.
//

import UIKit

class LoginVC: UIViewController {
   
   // MARK: - Properties
   var screen: LoginView?
   
   // MARK: - Lifecycle
   override func viewDidLoad() {
      super.viewDidLoad()
      screen?.delegate = self
   }
   override func loadView() {
      self.screen = LoginView()
      self.view = self.screen
   }
   
}

extension LoginVC: LoginViewDelegate {
   func handleLoginButton() {
      print("Teste")
   }
}
