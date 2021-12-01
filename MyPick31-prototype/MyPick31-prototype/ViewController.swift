//
//  ViewController.swift
//  MyPick31-prototype
//
//  Created by Bibi on 2021/11/29.
//

import UIKit


class ViewController: UIViewController,
                      UICollectionViewDataSource,// 컬렉션뷰의 셀이 총 몇개인지
                      UICollectionViewDelegate { // 컬렉션뷰를 어떻게 보여줄 것인지
    
    @IBOutlet weak var flavorCollectionView: UICollectionView!
    // 컬렉션뷰에 델리게이트랑 데이터소스가 필요함.
    
    var flavorToSend = Flavor()
    var currentIndex = 0
    
    let flavorViewModel = FlavorViewModel() // 뷰모델 변수 추가
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return flavorViewModel.countOfImageList // 뷰모델에서 카운트 가져옴
    } // 컬렉션 뷰에 총 몇 개의 셀을 표시할 것인지
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as?
                FlavorCell else { // FlavorCell으로 형변환?
                    return UICollectionViewCell()
                }
        // dequeueReusableCell : 재활용 가능한 셀을 큐의 형태로 추가/제거
        // for: 셀의 위치를 지정하는 인덱스 경로 - 데이터 원본 개체의 인덱스 경로 지정
        // "cell" : 스토리보드에서 추가한 테이블 뷰셀의 identifier를 적음
        
        let flavorImageInfo = flavorViewModel.imageInfo(at: indexPath.item)
        // indexPath.item 기준으로 뷰모델에서 ImageInfo를 가져옴
        cell.updateImage(info: flavorImageInfo) // 해당 셀을 업데이트
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) { // 셀 선택되었을 때 실행 - 상세페이지로 넘어가기
        print(indexPath.row)
        
        flavorToSend = flavorViewModel.getFlavorWithId(id: indexPath.row)
        
        self.performSegue(withIdentifier: "DetailSegue", sender: self)
        
//        self.present(detailViewController, animated: false, completion: nil) // completion : 다 실행된 후에 할 동작?
    }
    
    // 특정 세그웨이 연결 시 실행되는 준비 메서드
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailSegue" {
            let detailVC = segue.destination as! DetailViewController
            print(flavorToSend.nameKR, flavorToSend.base)
            detailVC.setCurrentFlavorData(flavor: flavorToSend)
            
        }
    }
    
    @IBAction func goBackToMainView(_ segue: UIStoryboardSegue) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.flavorCollectionView.dataSource = self
        // 컬렉션뷰의 데이터소스를 ViewController로 지정함.
        // UICollectionViewDataSource를 채택했기 때문에 가능
        self.flavorCollectionView.delegate = self
        // UICollectionViewDelegate를 채택했기 때문에 가능
        flavorViewModel.setFlavorList()
    }
    
}





