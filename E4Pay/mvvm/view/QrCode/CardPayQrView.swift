//
//  CardPayQrView.swift
//  E4Pay
//
//  Created by 20-N311 on 1/15/24.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct CardPayQrView: View {
    @State private var text = "cardNumber:1251223"
    
    var body: some View {
        VStack {
            Image(uiImage: UIImage(data: generateQR(text: text)!)!)
                .resizable()
                .frame(width: 200, height: 200)
        }
    }
    
    func generateQR(text: String) -> Data? {
        let filter = CIFilter.qrCodeGenerator()
        guard let data = text.data(using: .ascii, allowLossyConversion: false) else { return nil }
        filter.message = data
        guard let ciimage = filter.outputImage else { return nil }
        let transform = CGAffineTransform(scaleX: 10, y: 10)
        let scaledCIImage = ciimage.transformed(by: transform)
        let uiimage = UIImage(ciImage: scaledCIImage)
        return uiimage.pngData()!
    }
}

#Preview {
    CardPayQrView()
}
