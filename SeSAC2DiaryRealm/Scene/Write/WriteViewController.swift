//
//  WriteViewController.swift
//  SeSAC2DiaryRealm
//
//  Created by jack on 2022/08/21.
//

import UIKit
import RealmSwift //Realm1.

class WriteViewController: BaseViewController {

    let mainView = WriteView()
    let localRealm = try! Realm() //Realm2. Realm 테이블에 데이터를 CRUD할 때 Realm테이블 경로에 접근
    
    override func loadView() {
        self.view = mainView
    }
     
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Realm is located at:", localRealm.configuration.fileURL!)
    }
    
    override func configure() {
        mainView.searchImageButton.addTarget(self, action: #selector(selectImageButtonClicked), for: .touchUpInside)
        mainView.sampleButton.addTarget(self, action: #selector(sampleButtonClicked), for: .touchUpInside)
    }
      
    //Realm Create Sample
    @objc func sampleButtonClicked() {
        
        //레코드 내용 입력
        let task = UserDiary(diaryTitle: "하오늘의 일기 \(Int.random(in: 1...100))", diaryContents: "일기 테스트 내용", diaryDate: Date(), registerDate: Date(), photo: nil)
        
        //레코드 생성
        try! localRealm.write {
            localRealm.add(task)
            print("Realm Succeed")
            dismiss(animated: true)
        }
        
    }
    
    @objc func selectImageButtonClicked() {
        let vc = SearchImageViewController()
        transition(vc)
    }
}

