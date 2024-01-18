//
//  MoneyPayListView.swift
//  E4Pay
//
//  Created by 20-N311 on 1/14/24.
//

import SwiftUI


enum Menu: Int, CaseIterable {
    case menu1 = 0
    case menu2 = 1
    case menu3 = 2
    case menu4 = 3

  var title: String {
      switch self {
        case .menu1: return "E4베이커리"
        case .menu2: return "E4 Coffee"
        case .menu3: return "C가맹점"
        case .menu4: return "D가맹점"
        }
    }
}

//enum tapInfo : String, CaseIterable {
//    case info = "E4베이커리1"
//    case size = "E4 Coffee"
//    case review = "C가맹점"
//    case call = "D가맹점"
//}

struct MoneyPayListView: View {
    @State private var activePicker = Menu.menu1
//    @State private var selectedPicker: tapInfo = .info
    @Namespace private var animation
    
    var body: some View {
        VStack{
            
            animate()
            
            testView(tests: activePicker)
            
        }
        .customNavigationBar(
            centerView: {
                Text("머니 결제")
            },
            leftView: {
                ToolbarBackBtnView()
            },
            rightView: {
                EmptyView()
            }
        )
    }
    
    
    @ViewBuilder
    private func animate() -> some View {
        HStack {
            ForEach(Menu.allCases, id: \.self) { item in
                VStack {
                    Text(item.title)
                        .font(.system(size: 16, weight: .regular))
                        .frame(maxWidth: .infinity/4, minHeight: 50)
                        .foregroundColor(activePicker == item ? .black : .gray)

                    if activePicker == item {
                        ZStack{
                            Capsule()
                                .foregroundColor(.black)
                                .frame(height: 3)
                                .matchedGeometryEffect(id: "info", in: animation)
                        }
                    }
//                    else{
//                        Capsule()
//                            .foregroundColor(.gray)
//                            .frame(width:.infinity,height: 3)
//                    }
                        
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        print(item)
                        self.activePicker = item
                    }
                }
            }
        }
    }
    
}

#Preview {
    MoneyPayListView()
}





struct testView : View {
    
    var tests : Menu
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Text("asdasd")
        }
//        ScrollView(.vertical, showsIndicators: false) {
//            switch tests {
//            case .info:
//                ForEach(0..<5) { _ in
//                    Text("블랙컬러")
//                        .padding()
//                    Image("shoes")
//                        .resizable()
//                        .frame(maxWidth: 350, minHeight: 500)
//                }
//            case .size:
//                Text("사이즈 참고해주세요")
//                    .font(.system(size: 15, weight: .bold, design: .monospaced))
//                    .frame(width: 300, height: 20, alignment: .center)
//                Text("발폭 넓으신분 -> 한사이즈 up!")
//                    .padding()
//            case .review:
//                ScrollView(.horizontal, showsIndicators: false) {
//                    ForEach(0..<10) { _ in
//                        LazyHStack {
//                            ForEach(0..<2) { _ in
//                                NavigationLink(destination: HomeView()){
//                                    VStack(spacing: 5) {
//                                        Image("shoes")
//                                            .resizable()
//                                            .frame(width: 160, height: 200, alignment: .center)
//                                        Text("실착용 솔직 한달 후기 입니다")
//                                            .font(.system(size: 15, weight: .bold, design: .monospaced))
//                                            .frame(width: 160, height: 20, alignment: .leading)
//                                            .foregroundColor(.black)
//                                        Text("Sky Blue")
//                                            .font(.system(size: 13, weight: .medium, design: .monospaced))
//                                            .frame(width: 160, height: 20, alignment: .leading)
//                                            .foregroundColor(.black)
//                                        Text("평발인데 너무편해요 공간도 넉넉해서 걸을때 불편하지 않아요 최고입니다 ㅋㅋ 재구매의사 100%")
//                                            .font(.system(size: 13, weight: .medium, design: .default))
//                                            .frame(width: 160, height: 50, alignment: .leading)
//                                            .foregroundColor(.black)
//                                        Text("평발인데 너무편해요 공간도 넉넉해서 걸을때 불편하지 않아요 최고입니다 ㅋㅋ 재구매의사 100%")
//                                            .font(.system(size: 13, weight: .medium, design: .default))
//                                            .frame(width: 160, height: 50, alignment: .leading)
//                                            .foregroundColor(.black)
//                                        Text("평발인데 너무편해요 공간도 넉넉해서 걸을때 불편하지 않아요 최고입니다 ㅋㅋ 재구매의사 100%")
//                                            .font(.system(size: 13, weight: .medium, design: .default))
//                                            .frame(width: 160, height: 50, alignment: .leading)
//                                            .foregroundColor(.black)
//                                        Text("평발인데 너무편해요 공간도 넉넉해서 걸을때 불편하지 않아요 최고입니다 ㅋㅋ 재구매의사 100%")
//                                            .font(.system(size: 13, weight: .medium, design: .default))
//                                            .frame(width: 160, height: 50, alignment: .leading)
//                                            .foregroundColor(.black)
//                                    }
//                                    .padding(15)
//                                }
//                            }
//                        }
//                    }
//                }
//            case .call:
//                VStack {
//                    Text("별도의 커뮤니티를 운영하지 않습니다.")
//                    Text("자세한 문의는 여기로 부탁드립니다")
//                    Text("02-xxx-xxxx")
//                        .padding()
//                }.padding()
//            }
//        }
    }
}
