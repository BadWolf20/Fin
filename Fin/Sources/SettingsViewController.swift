//
//  SettingsViewController.swift
//  Fin
//
//  Created by Roman on 21.04.2023.
//

import UIKit

class SettingsViewController: UIViewController {

    // MARK: - Views

    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Pop", for: .normal)
        button.addTarget(self, action: #selector(tapButtonAction), for: .touchUpInside)
        return button
    }()


    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        // Do any additional setup after loading the view.

    }


    // MARK: - Initial

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    // MARK: - Settings

    private func setupHierarchy(){
        view.addSubview(button)
    }

    private func setupLayout(){
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }


    // MARK: - Actions

    @objc private func tapButtonAction(){
        navigationController?.popViewController(animated: true)
       // navigationController?.tabBarController?.tabBar.isHidden = false
    }

}
