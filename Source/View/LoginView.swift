//
//  LoginView.swift
//  Pokedex-SwiftUI+UIKit
//
//  Created by Hugo Silva on 09/12/22.
//

import UIKit

protocol LoginViewDelegate: AnyObject {
   func handleLoginButton()
}

class LoginView: UIView {
   
   // MARK: - Properties
   weak var delegate: LoginViewDelegate?
   
   lazy var emailTextField: UITextField = {
      let tf = UITextField()
      tf.placeholder = "Digite seu email"
      tf.autocorrectionType = .no
      tf.backgroundColor = .white
      tf.textColor = .darkGray
      tf.layer.borderColor = UIColor.darkGray.cgColor
      tf.layer.borderWidth = 1
      tf.textAlignment = .center
      return tf
   }()
   lazy var passwordTextField: UITextField = {
      let tf = UITextField()
      tf.placeholder = "Digite sua senha"
      tf.autocorrectionType = .no
      tf.backgroundColor = .white
      tf.textColor = .darkGray
      tf.layer.borderColor = UIColor.darkGray.cgColor
      tf.layer.borderWidth = 1
      tf.textAlignment = .center
      return tf
   }()
   lazy var loginButton: UIButton = {
      let bt = UIButton()
      bt.setTitle("Entrar", for: .normal)
      bt.backgroundColor = .blue
      bt.setTitleColor(.darkGray, for: .normal)
      bt.addTarget(self, action: #selector(handleLoginButton), for: .touchUpInside)
      bt.setTitleColor(.white, for: .normal)
      return bt
   }()
   
   // MARK: - Lifecycle
   override init(frame: CGRect) {
      super.init(frame: frame)
      self.configureUI()
   }
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
   // MARK: - Selectors
   @objc func handleLoginButton() {
      delegate?.handleLoginButton()
   }
   
   // MARK: - Helpers
   private func configureUI() {
      self.backgroundColor = .white
      setPasswordTextfield()
      setEmailTextfield()
      setLoginButton()
   }
}

extension LoginView {
   private func setPasswordTextfield() {
      self.addSubview(passwordTextField)
      passwordTextField.centerY(inView: self)
      passwordTextField.anchor(left: leftAnchor, right: rightAnchor, paddingLeft: 20, paddingRight: 20, height: 40)
   }
   private func setEmailTextfield() {
      self.addSubview(emailTextField)
      emailTextField.anchor(left: passwordTextField.leftAnchor, bottom: passwordTextField.topAnchor, right: passwordTextField.rightAnchor, paddingBottom: 20, height: 40)
   }
   private func setLoginButton() {
      self.addSubview(loginButton)
      loginButton.anchor(top: passwordTextField.bottomAnchor, left: passwordTextField.leftAnchor, right: passwordTextField.rightAnchor, paddingTop: 20, height: 40)
      loginButton.layer.cornerRadius = 40/2
   }
}
