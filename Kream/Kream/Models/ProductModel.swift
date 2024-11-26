//
//  ProductModel.swift
//  KREAM
//
//  Created by 류한비 on 11/2/24.
//

import Foundation
import UIKit

struct ProductModel {
    let image: String
    let name: String
    let info: String
    let price: String
    let label: String
}

extension ProductModel {
    static func dummy() -> [ProductModel] {
        return [
            ProductModel(image: "https://kream-phinf.pstatic.net/MjAyNDA5MDlfMjc5/MDAxNzI1ODY2NjI4OTIz.ZcXt64ClwWv2S3XZ6EM7wGsZr93BvQG9Td3GdLWK2bgg.Nidpifsf7VkxmsDWcBLrGN7VZi8-NNflkg-w5vgs9o0g.PNG/a_54368cab35444044acedb05fd470edce.png?type=l_webp", name: "Adidas", info: "Adidas Samba OG Dark Brown Clay Brown", price: "203,000원", label: "거래 9,732"),
            ProductModel(image: "https://kream-phinf.pstatic.net/MjAyNDA3MTZfNjgg/MDAxNzIxMDk4MjkzMzQz.ftxP8ayZpAkk_0wzGRz5uKbMrkkT4-T1MmQ0Nnmpn0wg.PskwqF7ImXb10Ozg9QWpVHAXCxjkkHiwtVjQJW1grsIg.PNG/a_30694b0f86e04c93bf78c752e6e28279.png?type=l_webp", name: "Salomon", info: "Salomon x Sandy Liang RX Marie Jeanne Black", price: "250,000원", label: "거래 9.6만"),
            ProductModel(image: "https://kream-phinf.pstatic.net/MjAyNDExMTFfMjMw/MDAxNzMxMzE5OTE1MzI3.86q-gENiRkH_ftuxv0M9iAuF9Fiqzx5YQWoDcqA4NMIg.ir5dNZ0U6gYSWlVWFdrsQKrHSq4ztsIHYY8pjH_sRxYg.PNG/a_71a3c9044e804a6ebeb1e8f2daa4bfb8.png?type=l_webp", name: "The North Face", info: "White Label Wave RDS Down Jacket Black", price: "310,000원", label: "거래 12.8만"),
            ProductModel(image: "https://kream-phinf.pstatic.net/MjAyNDA5MzBfMzQg/MDAxNzI3Njk5MDE5NTAz.Pet9CGmCp3TNnkacNPFc1gE1kJo8UTfWzEn0PbXj978g.JT2UyQQTDhBG15lCL0iVIGRZ-k5euApW_zUvJlACN3og.PNG/a_16c79c9592824e14abe63de96316bfc2.png?type=l_webp", name: "IAB Studio", info: "IAB Studio Hoodie Light Gray", price: "228,000원", label: "거래 15.6만"),
            ProductModel(image: "https://kream-phinf.pstatic.net/MjAyNDA5MjRfMTc0/MDAxNzI3MTQxMzcyODk2.MMwJpp3eL7QVUZoro5xNwqdnQS2_rnnUnHBMYZMTOpEg.mN_bsPvUt6YP6Xjo90dOI45RCHcB9J6UHqvdC4MAYAYg.PNG/a_577ebd58effb4855a98763950793b6c4.png?type=m_webp", name: "Arc'teryx", info: "Arc'teryx Heliad 15 Backpack Black", price: "203,000원", label: "거래 9,732"),
            ProductModel(image: "https://kream-phinf.pstatic.net/MjAyMzEyMDFfMjQ2/MDAxNzAxNDIyODMwMzc3.7wesmuvLmfQ9YRBUlwAtedg4uNPA_D-jgm-nHWW_MOwg.E6Crwp-h63IwWNlbH6PsO5LbMRjDwYU0GQaVqfvGUxAg.JPEG/a_5b3c3ab96be34fd7af64d393e209c765.jpg?type=l_webp", name: "Stussy", info: "Stussy Down Parka Micro Ripstop Phantom Black", price: "203,000원", label: "거래 9,732"),
            ProductModel(image: "https://kream-phinf.pstatic.net/MjAyNDA5MDRfOTkg/MDAxNzI1NDQyNjA5NjY4.qbGTDbqFoxJMU9f5bjTfuVNVqoUVCXmkt6pm8QpWJXwg.7YiI6DxHBQ3FuL_7F8tcW9HF-3ye7F0VzvIeaXl3sT4g.JPEG/p_b6396853995e46298f21ac7f339dc269.jpg?type=m_webp", name: "ANNOT", info: "ANNOT I.L.A Logo Long Bill Washing Cap Brown", price: "203,000원", label: "거래 9,732"),
            ProductModel(image: "https://kream-phinf.pstatic.net/MjAyNDA5MjdfNTMg/MDAxNzI3NDEzNjI1OTQw.kGXQYtdOH-N6MvoVDzGSkZErpkWO-OEMvmqknijOFqYg.APJ73ee6Gbua9UZIQisJc1PMN5yc5SuVfemf7Z4F4MYg.PNG/p_107a3032f74744c8a3cfd4b961c64bad.png?type=m_webp", name: "Kashiko", info: "Kashiko Leopard Print Shoulder Bag Blue Gray", price: "203,000원", label: "거래 9,732"),
            ProductModel(image: "https://kream-phinf.pstatic.net/MjAyMzExMjhfMjM2/MDAxNzAxMTU2Mzc5Mzg1.efCd5graszEDojXqXVaZCTYXOo50VHYA1F9mUmlI56kg.2DITvir8McV55RVXAkopXzgg3U5JMHwcKo3IH17ksYAg.JPEG/a_a222d0328b7a4dadb10511e7593ea35e.jpg?type=m_webp", name: "BAPE", info: "BAPE Baby Milo Mini Fur Backpack Brown", price: "203,000원", label: "거래 9,732"),
            ProductModel(image: "https://kream-phinf.pstatic.net/MjAyMzEyMDdfMjA3/MDAxNzAxOTQyMjEwNTg0.yFMaNnO-g34Fw8oPzwv-UGzrE1HcgYlBqzLtA4MjkWUg.VqOrsSCD0qOSLho4cZJgzymTaFkf0ldVWa79_pUhPIQg.JPEG/a_54337716ca0f4d2eb1a6bc54b13f2e77.jpg?type=m_webp", name: "Nike", info: "NSW Reversible Faux Fur Bomber Jacket Black - Asia", price: "203,000원", label: "거래 9,732"),
        ]
    }
}
