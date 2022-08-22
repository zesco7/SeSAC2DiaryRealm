//
//  RealmModel.swift
//  SeSAC2DiaryRealm
//
//  Created by Mac Pro 15 on 2022/08/22.
//

import Foundation
import RealmSwift


//UserDiary: 테이블 이름
//@Persisted: 컬럼

class UserDiary: Object {
    @Persisted var diaryTitle: String // 제목(필수)
    @Persisted var diaryContents: String? //내용(옵션)
    @Persisted var diaryDate = Date() //작성날짜(필수)
    @Persisted var registeryDate = Date() //등록날짜(필수)
    @Persisted var favorite: Bool //즐겨찾기(필수)
    @Persisted var like: Bool //즐겨찾기(필수)
    @Persisted var photo: String? //사진String(옵션)
    //@Persisted var diaryPhoto: String? //사진String(옵션)
    
    //PK(필수): Int, UUID, ObjectId(UUID, ObjectId는 중복값없이 랜덤으로 값생성해줌)  
    @Persisted(primaryKey: true) var ObjectId: ObjectId
    
    convenience init(diaryTitle: String, diaryContents: String?, diaryDate: Date, registerDate: Date, photo: String?) {
           self.init()
        self.diaryTitle = diaryTitle
        self.diaryContents = diaryContents
        self.diaryDate = diaryDate
        self.registeryDate = registeryDate
        self.favorite = false
        self.like = false
        self.photo = photo
        //self.diaryPhoto = photo
        
    }
    

}



