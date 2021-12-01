//
//  ViewController.swift
//  MyPick31-prototype
//
//  Created by Bibi on 2021/11/29.
//

import UIKit

struct FlavorImageInfo {
    let nameKR: String
    
    var image: UIImage? {
    return self.resizeImage(image: UIImage(named: "\(nameKR)")!, targetSize: CGSize(width: 170.0, height: 170.0)) // Assets에 있는 이미지 이름 지정해 불러오기.
    }
    
    init(nameKR: String) {
        self.nameKR = nameKR
    }
    
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage? { // 이미지 크기를 조정해 주는 함수?
        let size = image.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(origin: .zero, size: newSize)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0) // 스위프트 자체 API 사용
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
}

class ViewController: UIViewController,
                      UICollectionViewDataSource,// 컬렉션뷰의 셀이 총 몇개인지
                      UICollectionViewDelegate { // 컬렉션뷰를 어떻게 보여줄 것인지
    
    @IBOutlet weak var flavorCollectionView: UICollectionView!
    // 컬렉션뷰에 델리게이트랑 데이터소스가 필요함.
    
    
    let imageViewModel = ImageViewModel() // 뷰모델 변수 추가
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageViewModel.countOfImageList // 뷰모델에서 카운트 가져옴
    } // 컬렉션 뷰에 총 몇 개의 셀을 표시할 것인지
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as?
                FlavorCell else { // FlavorCell으로 형변환?
                    return UICollectionViewCell()
                }
        // dequeueReusableCell : 재활용 가능한 셀을 큐의 형태로 추가/제거
        // for: 셀의 위치를 지정하는 인덱스 경로 - 데이터 원본 개체의 인덱스 경로 지정
        // "cell" : 스토리보드에서 추가한 테이블 뷰셀의 identifier를 적음
        
        let flavorImageInfo = imageViewModel.imageInfo(at: indexPath.item)
        // indexPath.item 기준으로 뷰모델에서 ImageInfo를 가져옴
        cell.update(info: flavorImageInfo) // 해당 셀을 업데이트
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) { // 셀 선택되었을 때 실행 - 상세페이지로 넘어가기
        print(indexPath.row)
        
        let detailViewController = DetailViewController()
        // DetailViewController에 보내 줄 아이스크림 정보 만들기?
        self.present(detailViewController, animated: false, completion: nil) // completion : 다 실행된 후에 할 동작?
        // 1. Segue
        // 2. xib 파일로 - 제제추천
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.flavorCollectionView.dataSource = self
        // 컬렉션뷰의 데이터소스를 ViewController로 지정함.
        // UICollectionViewDataSource를 채택했기 때문에 가능
        self.flavorCollectionView.delegate = self
        // UICollectionViewDelegate를 채택했기 때문에 가능
    }
    
}

class FlavorCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var nameKR: UILabel!
    @IBOutlet weak var nameEN: UILabel!
    @IBOutlet weak var signatureOrSeason: UILabel!
    @IBOutlet weak var onSaleOrNot: UILabel!
    
    func update(info: FlavorImageInfo) {
        image.image = info.image
        nameKR.text = info.nameKR
    }
}

// view model
class ImageViewModel {
    let imageInfoList: [FlavorImageInfo] = [
        FlavorImageInfo(nameKR: "바닐라"),
        FlavorImageInfo(nameKR: "초콜릿"),
        FlavorImageInfo(nameKR: "31요거트"),
        FlavorImageInfo(nameKR: "그린티"),
        FlavorImageInfo(nameKR: "레인보우 샤베트"),
        FlavorImageInfo(nameKR: "체리쥬빌레"),
        FlavorImageInfo(nameKR: "엄마는 외계인"),
        FlavorImageInfo(nameKR: "민트 초콜릿 칩"),
        FlavorImageInfo(nameKR: "아몬드 봉봉"),
        FlavorImageInfo(nameKR: "오레오 쿠키 앤 크림"),
        FlavorImageInfo(nameKR: "초콜릿 무스"),
        FlavorImageInfo(nameKR: "슈팅스타"),
        FlavorImageInfo(nameKR: "뉴욕 치즈케이크"),
        FlavorImageInfo(nameKR: "이상한 나라의 솜사탕"),
        FlavorImageInfo(nameKR: "베리베리 스트로베리"),
        FlavorImageInfo(nameKR: "사랑에 빠진 딸기"),
        FlavorImageInfo(nameKR: "바람과 함께 사라지다"),
        FlavorImageInfo(nameKR: "피스타치오 아몬드"),
        FlavorImageInfo(nameKR: "자모카 아몬드 훠지"),
        FlavorImageInfo(nameKR: "월넛"),
        
    ]
    
    var countOfImageList: Int {
        return imageInfoList.count
    }
    
    func imageInfo(at index: Int) -> FlavorImageInfo {
        return imageInfoList[index]
    }
}

