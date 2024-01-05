//
//  Comments.swift
//  SunSwiftBaseProject
//
//  Created by suni on 2024/01/05.
//

import Foundation

/// 주석과 퀵헬프
/// 주석 단축키 : command + /
/// 퀵헬프 단축키 : command + option + /
class Comments {
    
    // 한 줄 주석
    
    /*
     여러 줄 주석
     */
    
    /* 여러 줄 주석 안쪽에
     /* 여러 중첩 주석 가능
     // 한 줄도 가능
     */
     여기도 주석!
     */
    
    // MARK: - 문서화 주석
    /// 한 줄 문서화 주석
    /** 여러 줄 문서화 주석
     */
    
    
    /// 오류 타입의 열거형
    /// - noName: 이름이 없을 때 발생하는 오류
    /// - inappropriateGrade(grade: Int): 학년이 1학년 미만, 3학년 초과인 경우 잘못된 학년으로 인식하여 오류로 처리
    /// - unknown: 알 수 없는 오류
    enum ErrorStudentInfo: Error {
        case noName
        case inappropriateGrade(grade: Int)
        case unknown
    }
    
    /**
     여기서 부터 Description 부분
     
     줄바꿈 : 텍스트 간의 한 줄을 비워놓기
     
     원형 글머리 기호 : '-' '+' '*'
     
     - 원형 글머리
     + 모두 같은
     * 역할
     
     번호 글머리
     
     1. 1번
     2. 2번
     6. 3번 번호 글머리는 앞에 붙은 번호와 상관 없이, 순서대로 넘버링됨.
     
     텍스트 기울기 : *A pair of marks*
     
     텍스트 볼드 : **Two pair of marks**
     
     링크 : [Suni Blog](https://sunidev.tistory.com/)
     
     키워드 목록 : Precondition, Postcondition, Requires, Invariant, Complexity, Important, Warning, Author, Authors, Copyright, Date, SeeAslo, Since, Version, Attention, Bug, Experiment, Note, Remark, ToDo
     - note: 강조하고 싶은 메모 노트
     - author: 작성자
     - warning: 주의해야 할 점
     
     ---
     > 매개변수와 반환값 표기 하기
     - parameters:
         - studentName: 학생 이름
         - studentGrade: 학생 학년, 1 미만 또는 3을 초과 하면 오류 발생
     - Throws: 오류가 발생하면 ErrorStudentInfo의 한 케이스를 throw
     - returns: Success Save Student Info
     */
    func saveStudentInfo(studentName: String?, studentGrade grade: Int = 0) throws -> String {
        
        guard let name: String = studentName else {
            throw ErrorStudentInfo.noName
        }
        
        if grade > 3 {
            throw ErrorStudentInfo.inappropriateGrade(grade: grade)
        }
        
        return "🟢 Success Save Student Info 🟢 name : \(name)." + (grade > 0 ? " grade : \(grade)." : "")
    }
}

