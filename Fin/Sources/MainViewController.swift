//
//  ViewController.swift
//  Fin
//
//  Created by Roman on 10.01.2023.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {

    // MARK: Outlets

    let appDelegateStorageManager = StorageManager()

    private lazy var balanceMounthLabel: UILabel = {
        let label = UILabel()
//        label.text = Strings.balanceMounthLabel
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .black

        return label
    }()

    private lazy var balanceMounthTextLabel: UILabel = {
        let label = UILabel()
//        let text = appDelegateStorageManager.getMounthBalance()
//        label.text = separatedNumber(text)
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black

        return label
    }()

    private lazy var balanceDayLabel: UILabel = {
        let label = UILabel()
//        label.text = Strings.balanceDayLabel
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 17)

        label.textColor = .black

        return label
    }()

    private lazy var balanceDayTextLabel: UILabel = {
        let label = UILabel()
//        let text = appDelegateStorageManager.getDayBalance()
//        label.text = separatedNumber(text)
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 28)

        label.textColor = .black

        return label
    }()

    private lazy var expenseLabel: UILabel = {
        let label = UILabel()
//        label.text = separatedNumber(Strings.expenseLabel)
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 34)

        label.textColor = .black
        label.backgroundColor = .systemGray5
        label.layer.cornerRadius = 15
        label.clipsToBounds = true

        return label
    }()

    private lazy var numPudButton_1: UIButton = {
        let button = UIButton()
        return button
    }()

    private lazy var numPudButton_2: UIButton = {
        let button = UIButton()
        return button
    }()

    private lazy var numPudButton_3: UIButton = {
        let button = UIButton()
        return button
    }()

    private lazy var numPudButton_4: UIButton = {
        let button = UIButton()
        return button
    }()
    private lazy var numPudButton_5: UIButton = {
        let button = UIButton()
        return button
    }()
    private lazy var numPudButton_6: UIButton = {
        let button = UIButton()
        return button
    }()
    private lazy var numPudButton_7: UIButton = {
        let button = UIButton()
        return button
    }()
    private lazy var numPudButton_8: UIButton = {
        let button = UIButton()
        return button
    }()
    private lazy var numPudButton_9: UIButton = {
        let button = UIButton()
        return button
    }()
    private lazy var numPudButton_Del: UIButton = {
        let button = UIButton()
        button.setTitle("Del", for: .normal)
        return button
    }()
    private lazy var numPudButton_0: UIButton = {
        let button = UIButton()
        button.setTitle("0", for: .normal)
        return button
    }()
    private lazy var numPudButton_Ok: UIButton = {
        let button = UIButton()
        button.setTitle("OK", for: .normal)
        return button
    }()


    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupHierarchy()
        setupLayout()
        numpad()
        setupStrings()

        print("OK status")
    }

    // MARK: Setup


    private func setupHierarchy() {
        view.addSubview(balanceMounthLabel)
        view.addSubview(balanceMounthTextLabel)
        view.addSubview(balanceDayLabel)
        view.addSubview(balanceDayTextLabel)
        view.addSubview(expenseLabel)

    }

    private func setupLayout() {
        balanceMounthLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceMounthTextLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceDayLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceDayTextLabel.translatesAutoresizingMaskIntoConstraints = false
        expenseLabel.translatesAutoresizingMaskIntoConstraints = false

        balanceMounthLabel.snp.makeConstraints{ make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(view.snp.top).offset(100)
            make.height.equalTo(22)
        }

        balanceMounthTextLabel.snp.makeConstraints{ make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(balanceMounthLabel.snp.bottom).offset(5)
            make.height.equalTo(25)
        }

        balanceDayLabel.snp.makeConstraints{ make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(balanceMounthTextLabel.snp.bottom).offset(45)
            make.height.equalTo(22)
        }

        balanceDayTextLabel.snp.makeConstraints{ make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(balanceDayLabel.snp.bottom).offset(5)
            make.height.equalTo(34)
        }

        expenseLabel.snp.makeConstraints{ make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(balanceDayTextLabel.snp.bottom).offset(51)
            make.height.equalTo(41+9)
            make.width.greaterThanOrEqualTo(200)
            make.width.lessThanOrEqualTo(view.snp.width).offset(-30)
        }
    }

    private func setupStrings() {
        balanceMounthLabel.text = Strings.balanceMounthLabel
        balanceMounthTextLabel.text = separatedNumber(appDelegateStorageManager.getMounthBalance())
        balanceDayLabel.text = Strings.balanceDayLabel
        balanceDayTextLabel.text = separatedNumber(appDelegateStorageManager.getDayBalance())
        expenseLabel.text = separatedNumber(Strings.expenseLabel)

    }


    // MARK: Actions


    // MARK: Functions

    private func separatedNumber(_ number: String) -> String {
        if number != "" {
            var text = number
            for t in text {
                if t == " " {
                    text.remove(at: text.firstIndex(of: " ")!)
                }
            }

            let num = Int(text)
            guard let itIsANumber = num as? NSNumber else {return "Not a number" }
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.groupingSeparator = " "
            return formatter.string(from: itIsANumber)!
        }
        return ""
    }

}


// MARK: - Numpad
extension MainViewController {

    private func numpad() {
        var num = [
            numPudButton_1, numPudButton_2, numPudButton_3,
            numPudButton_4, numPudButton_5, numPudButton_6,
            numPudButton_7, numPudButton_8, numPudButton_9
        ]
        var o = 1
        for i in num {
            i.setTitle(String(o), for: .normal)
            o += 1
        }

        num.append(numPudButton_Del)
        num.append(numPudButton_0)
        num.append(numPudButton_Ok)

        numPudButton_1.addTarget(self, action: #selector(pressed_1), for: .touchUpInside)
        numPudButton_2.addTarget(self, action: #selector(pressed_2), for: .touchUpInside)
        numPudButton_3.addTarget(self, action: #selector(pressed_3), for: .touchUpInside)
        numPudButton_4.addTarget(self, action: #selector(pressed_4), for: .touchUpInside)
        numPudButton_5.addTarget(self, action: #selector(pressed_5), for: .touchUpInside)
        numPudButton_6.addTarget(self, action: #selector(pressed_6), for: .touchUpInside)
        numPudButton_7.addTarget(self, action: #selector(pressed_7), for: .touchUpInside)
        numPudButton_8.addTarget(self, action: #selector(pressed_8), for: .touchUpInside)
        numPudButton_9.addTarget(self, action: #selector(pressed_9), for: .touchUpInside)
        numPudButton_0.addTarget(self, action: #selector(pressed_0), for: .touchUpInside)
        numPudButton_Ok.addTarget(self, action: #selector(pressed_Ok), for: .touchUpInside)
        numPudButton_Del.addTarget(self, action: #selector(pressed_Del), for: .touchUpInside)

        for i in num {
            i.translatesAutoresizingMaskIntoConstraints = false
            i.setTitleColor(UIColor.white, for: .normal)
            i.clipsToBounds = true
            i.titleLabel?.font = UIFont.systemFont(ofSize: 30)
            i.backgroundColor = .gray
            i.layer.cornerRadius = 40

            view.addSubview(i)

            i.snp.makeConstraints{ make in
                make.height.equalTo(80)
                make.width.equalTo(100)
            }

        }

        for i in num {
            switch (i.titleLabel?.text) {
            case "1", "2", "3":
                i.snp.makeConstraints{ make in
                    make.top.equalTo(expenseLabel.snp.bottom).offset(30)
                }
            case "4", "5", "6":
                i.snp.makeConstraints{ make in
                    make.top.equalTo(numPudButton_2.snp.bottom).offset(10)
                }
            case "7", "8", "9":
                i.snp.makeConstraints{ make in
                    make.top.equalTo(numPudButton_5.snp.bottom).offset(10)
                }
            case "Del", "0", "OK":
                i.snp.makeConstraints{ make in
                    make.top.equalTo(numPudButton_8.snp.bottom).offset(10)
                }
            default:
                print("q")
            }

            switch (i.titleLabel?.text) {
            case "2", "5", "8", "0":
                i.snp.makeConstraints{ make in
                    make.centerX.equalTo(view.snp.centerX)
                }
            case "1", "4", "7", "Del":
                i.snp.makeConstraints{ make in
                    make.right.equalTo(numPudButton_2.snp.left).offset(-10)
                }
            case "3", "6", "9", "OK":
                i.snp.makeConstraints{ make in
                    make.left.equalTo(numPudButton_2.snp.right).offset(10)
                }
            default:
                print("q")
            }

        }
    }

    // MARK: - Numpad functions


    @objc private func pressed_1() {
        addSumbol(textToAdd: "1")
    }
    @objc private func pressed_2() {
        addSumbol(textToAdd: "2")
    }
    @objc private func pressed_3() {
        addSumbol(textToAdd: "3")
    }
    @objc private func pressed_4() {
        addSumbol(textToAdd: "4")
    }
    @objc private func pressed_5() {
        addSumbol(textToAdd: "5")
    }
    @objc private func pressed_6() {
        addSumbol(textToAdd: "6")
    }
    @objc private func pressed_7() {
        addSumbol(textToAdd: "7")
    }
    @objc private func pressed_8() {
        addSumbol(textToAdd: "8")
    }
    @objc private func pressed_9() {
        addSumbol(textToAdd: "9")
    }
    @objc private func pressed_0() {
        if expenseLabel.text != " " {
            addSumbol(textToAdd: "0")
        }
    }
    @objc private func pressed_Ok() {
        OkPresed()
    }
    @objc private func pressed_Del() {
        delSumbol()
    }

    private func addSumbol(textToAdd: String) {
        var text = expenseLabel.text ?? " "
        text += textToAdd
        expenseLabel.text = separatedNumber(text)
    }

    private func delSumbol() {
        var text = expenseLabel.text ?? " "
        if text != "" {
            text.remove(at: text.index(before: text.endIndex))
        }
        expenseLabel.text = separatedNumber(text)
    }

    private func OkPresed() {
        guard var sum = expenseLabel.text else { return }
        guard var day = balanceDayTextLabel.text else { return }
        guard var mounth = balanceMounthTextLabel.text else { return }

        for t in sum {
            if t == " " {
                sum.remove(at: sum.firstIndex(of: " ")!)
            }
        }
        for t in day {
            if t == " " {
                day.remove(at: day.firstIndex(of: " ")!)
            }
        }
        for t in mounth {
            if t == " " {
                mounth.remove(at: mounth.firstIndex(of: " ")!)
            }
        }

        guard let sumI = Int(sum) else { return }
        guard let dayI = Int(day) else { return }
        guard let mounthI = Int(mounth) else { return }

        day = String(dayI - sumI)
        mounth = String(mounthI - sumI)
        balanceDayTextLabel.text = separatedNumber(day)
        balanceMounthTextLabel.text = separatedNumber(mounth)
        expenseLabel.text = "0"

        appDelegateStorageManager.setDayBalance(str: day)
        appDelegateStorageManager.setMounthBalance(str: mounth)

        print("Ok presed")
    }

}

// MARK: - Constants

extension MainViewController {
    enum Colors {
        static let ViewBackGround: UIColor = .clear

    }

    enum Metric {
        static let balanceMounthLabelTopOffset: CGFloat = 100
        static let balanceMounthLabelHeight: CGFloat = 22

        static let balanceMounthTextLabelTopOffset: CGFloat = 5
        static let balanceMounthTextLabelHeight: CGFloat = 25

        static let balanceDayLabelTopOffset: CGFloat = 45
        static let balanceDayLabelHeight: CGFloat = 22

        static let balanceDayTextLabelOffset: CGFloat = 5
        static let balanceDayTextLabelHeight: CGFloat = 34

        static let expenseLabelTopOffset: CGFloat = 51
        static let expenseLabelHeight: CGFloat = 50

    }

    enum Strings {
        static let balanceMounthLabel: String = "Остаток на месяц"
        static let balanceDayLabel: String = "Остаток на день"
        static let expenseLabel: String = "50"

    }
}

