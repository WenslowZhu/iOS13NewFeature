//
//  SignInWithAppleViewController.swift
//  iOS13NewFeature
//
//  Created by tstone10 on 2019/6/28.
//  Copyright © 2019 朱廷. All rights reserved.
//

import UIKit
import AuthenticationServices

class SignInWithAppleViewController: UIViewController, ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        let sighUpButton = ASAuthorizationAppleIDButton(authorizationButtonType: ButtonType.signUp, authorizationButtonStyle: ButtonStyle.black)
        view.addSubview(sighUpButton)
        sighUpButton.frame = CGRect(x: 50, y: 100, width: 300, height: 50)
        
        let continueButton = ASAuthorizationAppleIDButton(authorizationButtonType: ButtonType.continue, authorizationButtonStyle: ButtonStyle.black)
        view.addSubview(continueButton)
        continueButton.frame = CGRect(x: 50, y: 200, width: 300, height: 50)
        
        let signInButton = ASAuthorizationAppleIDButton(authorizationButtonType: ButtonType.default, authorizationButtonStyle: ButtonStyle.black)
        view.addSubview(signInButton)
        signInButton.frame = CGRect(x: 50, y: 300, width: 300, height: 50)
        
        let whiteButton = ASAuthorizationAppleIDButton(authorizationButtonType: ButtonType.default, authorizationButtonStyle: ButtonStyle.white)
        view.addSubview(whiteButton)
        whiteButton.frame = CGRect(x: 50, y: 400, width: 300, height: 50)
        
        sighUpButton.addTarget(self, action: #selector(handleAuthorizationButtonPress), for: UIControl.Event.touchUpInside)
    }
    
    @objc func handleAuthorizationButtonPress() {
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.presentationContextProvider = self
        controller.performRequests()
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print(error)
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        print(authorization)
    }
}
