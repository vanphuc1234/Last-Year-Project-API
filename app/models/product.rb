class Product < ApplicationRecord
  belongs_to :user
  
  def self.generate_data
    50.times do |index|
      Product.create(
        user_id: User.order('random()').first.try(:id),
        business_type: ['sell', 'rent'].sample,
        category_type: ['can_ho_chung_cu', 'nha_rieng',"nha_mat_pho","biet_thu_lien_ke","dat_nen_du_an","dat","trang_trai_khu_nghi_duong","nha_tro_phong_tro","van_phong","cua_hang_kiot","kho_nha_xuong","bat_dong_san_khac"].sample,
        title: Faker::Address.full_address, 
        description: Faker::Address.full_address, 
        price: rand(1000000..100000000000),
        area: rand(20..250),
        direction: ['huong_dong', 'huong_tay'].sample,
        beds_count: rand(1..10),
        baths_count: rand(1..10),
        city: "Hồ Chí Minh",
        district: "Quận 12",
        ward: "Phường Hiệp Thành",
        street: "Đường HT13",
        facade: rand(1..100),
        floor_count: rand(1..5)
        

      )
    end
  end
  
  def self.fake_aggs
    {
      "category_types": [
        {
          "params": {
            "category_type": "nha_rieng"
          },
          "text": "nha_rieng",
          "count": 86607
        },
        {
          "params": {
            "category_type": "dat"
          },
          "text": "dat",
          "count": 83096
        },
        {
          "params": {
            "category_type": "can_ho_chung_cu"
          },
          "text": "can_ho_chung_cu",
          "count": 55842
        },
        {
          "params": {
            "category_type": "nha_mat_pho"
          },
          "text": "nha_mat_pho",
          "count": 46990
        },
        {
          "params": {
            "category_type": "biet_thu_lien_ke"
          },
          "text": "biet_thu_lien_ke",
          "count": 22683
        },
        {
          "params": {
            "category_type": "dat_nen_du_an"
          },
          "text": "dat_nen_du_an",
          "count": 17648
        },
        {
          "params": {
            "category_type": "van_phong"
          },
          "text": "van_phong",
          "count": 1767
        },
        {
          "params": {
            "category_type": "nha_tro_phong_tro"
          },
          "text": "nha_tro_phong_tro",
          "count": 1326
        },
        {
          "params": {
            "category_type": "bat_dong_san_khac"
          },
          "text": "bat_dong_san_khac",
          "count": 959
        },
        {
          "params": {
            "category_type": "trang_trai_khu_nghi_duong"
          },
          "text": "trang_trai_khu_nghi_duong",
          "count": 922
        },
        {
          "params": {
            "category_type": "kho_nha_xuong"
          },
          "text": "kho_nha_xuong",
          "count": 657
        },
        {
          "params": {
            "category_type": "cua_hang_kiot"
          },
          "text": "cua_hang_kiot",
          "count": 638
        }
      ],
      "areas": [
        {
          "params": {
            "min_area": 0,
            "max_area": 30
          },
          "text": "< 30 m2",
          "count": 671
        },
        {
          "params": {
            "min_area": 30,
            "max_area": 50
          },
          "text": "30-50 m2",
          "count": 30010
        },
        {
          "params": {
            "min_area": 50,
            "max_area": 60
          },
          "text": "50-60 m2",
          "count": 23267
        },
        {
          "params": {
            "min_area": 60,
            "max_area": 70
          },
          "text": "60-70 m2",
          "count": 23958
        },
        {
          "params": {
            "min_area": 70,
            "max_area": 80
          },
          "text": "70-80 m2",
          "count": 22178
        },
        {
          "params": {
            "min_area": 80,
            "max_area": 100
          },
          "text": "80-100 m2",
          "count": 37871
        },
        {
          "params": {
            "min_area": 100,
            "max_area": 120
          },
          "text": "100-120 m2",
          "count": 21858
        },
        {
          "params": {
            "min_area": 120,
            "max_area": 150
          },
          "text": "120-150 m2",
          "count": 20318
        },
        {
          "params": {
            "min_area": 150,
            "max_area": 200
          },
          "text": "150-200 m2",
          "count": 17013
        },
        {
          "params": {
            "min_area": 200,
            "max_area": 250
          },
          "text": "200-250 m2",
          "count": 9501
        }
      ],
      "prices": [
        {
          "params": {
            "min_price": 0,
            "max_price": 300,
            "price_unit": "trieu"
          },
          "text": "< 300 triệu",
          "count": 1617
        },
        {
          "params": {
            "min_price": 1,
            "max_price": 3,
            "price_unit": "trieu"
          },
          "text": "1-3 triệu",
          "count": 7
        },
        {
          "params": {
            "min_price": 3,
            "max_price": 5,
            "price_unit": "trieu"
          },
          "text": "3-5 triệu",
          "count": 12
        },
        {
          "params": {
            "min_price": 5,
            "max_price": 8,
            "price_unit": "trieu"
          },
          "text": "5-8 triệu",
          "count": 19
        },
        {
          "params": {
            "min_price": 8,
            "max_price": 10,
            "price_unit": "trieu"
          },
          "text": "8-10 triệu",
          "count": 15
        },
        {
          "params": {
            "min_price": 10,
            "max_price": 15,
            "price_unit": "trieu"
          },
          "text": "10-15 triệu",
          "count": 125
        },
        {
          "params": {
            "min_price": 15,
            "max_price": 20,
            "price_unit": "trieu"
          },
          "text": "15-20 triệu",
          "count": 105
        },
        {
          "params": {
            "min_price": 20,
            "max_price": 25,
            "price_unit": "trieu"
          },
          "text": "20-25 triệu",
          "count": 83
        },
        {
          "params": {
            "min_price": 25,
            "max_price": 40,
            "price_unit": "trieu"
          },
          "text": "25-40 triệu",
          "count": 133
        },
        {
          "params": {
            "min_price": 40,
            "max_price": 60,
            "price_unit": "trieu"
          },
          "text": "40-60 triệu",
          "count": 138
        },
        {
          "params": {
            "min_price": 300,
            "max_price": 500,
            "price_unit": "trieu"
          },
          "text": "300-500 triệu",
          "count": 2985
        },
        {
          "params": {
            "min_price": 500,
            "max_price": 800,
            "price_unit": "trieu"
          },
          "text": "500-800 triệu",
          "count": 8174
        },
        {
          "params": {
            "min_price": 0,
            "max_price": 1,
            "price_unit": "ty"
          },
          "text": "< 1 tỷ",
          "count": 8309
        },
        {
          "params": {
            "min_price": 1,
            "max_price": 2,
            "price_unit": "ty"
          },
          "text": "1-2 tỷ",
          "count": 40383
        },
        {
          "params": {
            "min_price": 2,
            "max_price": 3,
            "price_unit": "ty"
          },
          "text": "2-3 tỷ",
          "count": 37461
        },
        {
          "params": {
            "min_price": 3,
            "max_price": 4,
            "price_unit": "ty"
          },
          "text": "3-4 tỷ",
          "count": 29402
        },
        {
          "params": {
            "min_price": 4,
            "max_price": 5,
            "price_unit": "ty"
          },
          "text": "4-5 tỷ",
          "count": 22664
        },
        {
          "params": {
            "min_price": 5,
            "max_price": 6,
            "price_unit": "ty"
          },
          "text": "5-6 tỷ",
          "count": 19594
        },
        {
          "params": {
            "min_price": 6,
            "max_price": 7,
            "price_unit": "ty"
          },
          "text": "6-7 tỷ",
          "count": 16257
        },
        {
          "params": {
            "min_price": 7,
            "max_price": 8,
            "price_unit": "ty"
          },
          "text": "7-8 tỷ",
          "count": 12684
        },
        {
          "params": {
            "min_price": 8,
            "max_price": 10,
            "price_unit": "ty"
          },
          "text": "8-10 tỷ",
          "count": 18050
        },
        {
          "params": {
            "min_price": 10,
            "max_price": 12,
            "price_unit": "ty"
          },
          "text": "10-12 tỷ",
          "count": 13266
        },
        {
          "params": {
            "min_price": 12,
            "max_price": 15,
            "price_unit": "ty"
          },
          "text": "12-15 tỷ",
          "count": 17268
        },
        {
          "params": {
            "min_price": 15,
            "max_price": 20,
            "price_unit": "ty"
          },
          "text": "15-20 tỷ",
          "count": 19110
        },
        {
          "params": {
            "min_price": 20,
            "max_price": 30,
            "price_unit": "ty"
          },
          "text": "20-30 tỷ",
          "count": 19141
        },
        {
          "params": {
            "min_price": 30,
            "max_price": 40,
            "price_unit": "ty"
          },
          "text": "30-40 tỷ",
          "count": 10281
        },
        {
          "params": {
            "min_price": 40,
            "max_price": 50,
            "price_unit": "ty"
          },
          "text": "40-50 tỷ",
          "count": 5615
        },
        {
          "params": {
            "min_price": 50,
            "max_price": 100,
            "price_unit": "ty"
          },
          "text": "50-100 tỷ",
          "count": 10409
        }
      ],
      "cities": [
        {
          "params": {
            "city_id": 1
          },
          "city_id": 1,
          "count": 109755
        },
        {
          "params": {
            "city_id": 2
          },
          "city_id": 2,
          "count": 102164
        },
        {
          "params": {
            "city_id": 3
          },
          "city_id": 3,
          "count": 12130
        },
        {
          "params": {
            "city_id": 4
          },
          "city_id": 4,
          "count": 11947
        },
        {
          "params": {
            "city_id": 5
          },
          "city_id": 5,
          "count": 9567
        },
        {
          "params": {
            "city_id": 6
          },
          "city_id": 6,
          "count": 8980
        },
        {
          "params": {
            "city_id": 7
          },
          "city_id": 7,
          "count": 7734
        },
        {
          "params": {
            "city_id": 8
          },
          "city_id": 8,
          "count": 7546
        },
        {
          "params": {
            "city_id": 14
          },
          "city_id": 14,
          "count": 6313
        },
        {
          "params": {
            "city_id": 23
          },
          "city_id": 23,
          "count": 5478
        },
        {
          "params": {
            "city_id": 10
          },
          "city_id": 10,
          "count": 5203
        },
        {
          "params": {
            "city_id": 13
          },
          "city_id": 13,
          "count": 4530
        },
        {
          "params": {
            "city_id": 9
          },
          "city_id": 9,
          "count": 3421
        },
        {
          "params": {
            "city_id": 24
          },
          "city_id": 24,
          "count": 2649
        },
        {
          "params": {
            "city_id": 12
          },
          "city_id": 12,
          "count": 2401
        },
        {
          "params": {
            "city_id": 32
          },
          "city_id": 32,
          "count": 1779
        },
        {
          "params": {
            "city_id": 17
          },
          "city_id": 17,
          "count": 1721
        },
        {
          "params": {
            "city_id": 18
          },
          "city_id": 18,
          "count": 1712
        },
        {
          "params": {
            "city_id": 29
          },
          "city_id": 29,
          "count": 1601
        },
        {
          "params": {
            "city_id": 11
          },
          "city_id": 11,
          "count": 1451
        },
        {
          "params": {
            "city_id": 19
          },
          "city_id": 19,
          "count": 1408
        },
        {
          "params": {
            "city_id": 25
          },
          "city_id": 25,
          "count": 1204
        },
        {
          "params": {
            "city_id": 16
          },
          "city_id": 16,
          "count": 989
        },
        {
          "params": {
            "city_id": 15
          },
          "city_id": 15,
          "count": 909
        },
        {
          "params": {
            "city_id": 44
          },
          "city_id": 44,
          "count": 649
        },
        {
          "params": {
            "city_id": 36
          },
          "city_id": 36,
          "count": 542
        },
        {
          "params": {
            "city_id": 31
          },
          "city_id": 31,
          "count": 496
        },
        {
          "params": {
            "city_id": 28
          },
          "city_id": 28,
          "count": 431
        },
        {
          "params": {
            "city_id": 49
          },
          "city_id": 49,
          "count": 421
        },
        {
          "params": {
            "city_id": 20
          },
          "city_id": 20,
          "count": 415
        },
        {
          "params": {
            "city_id": 26
          },
          "city_id": 26,
          "count": 352
        },
        {
          "params": {
            "city_id": 22
          },
          "city_id": 22,
          "count": 339
        },
        {
          "params": {
            "city_id": 38
          },
          "city_id": 38,
          "count": 337
        },
        {
          "params": {
            "city_id": 50
          },
          "city_id": 50,
          "count": 333
        },
        {
          "params": {
            "city_id": 43
          },
          "city_id": 43,
          "count": 325
        },
        {
          "params": {
            "city_id": 42
          },
          "city_id": 42,
          "count": 322
        },
        {
          "params": {
            "city_id": 33
          },
          "city_id": 33,
          "count": 287
        },
        {
          "params": {
            "city_id": 53
          },
          "city_id": 53,
          "count": 266
        },
        {
          "params": {
            "city_id": 34
          },
          "city_id": 34,
          "count": 254
        },
        {
          "params": {
            "city_id": 37
          },
          "city_id": 37,
          "count": 240
        },
        {
          "params": {
            "city_id": 21
          },
          "city_id": 21,
          "count": 214
        },
        {
          "params": {
            "city_id": 45
          },
          "city_id": 45,
          "count": 198
        },
        {
          "params": {
            "city_id": 27
          },
          "city_id": 27,
          "count": 153
        },
        {
          "params": {
            "city_id": 40
          },
          "city_id": 40,
          "count": 148
        },
        {
          "params": {
            "city_id": 56
          },
          "city_id": 56,
          "count": 141
        },
        {
          "params": {
            "city_id": 46
          },
          "city_id": 46,
          "count": 140
        },
        {
          "params": {
            "city_id": 30
          },
          "city_id": 30,
          "count": 107
        },
        {
          "params": {
            "city_id": 54
          },
          "city_id": 54,
          "count": 102
        },
        {
          "params": {
            "city_id": 35
          },
          "city_id": 35,
          "count": 89
        },
        {
          "params": {
            "city_id": 51
          },
          "city_id": 51,
          "count": 88
        },
        {
          "params": {
            "city_id": 39
          },
          "city_id": 39,
          "count": 75
        },
        {
          "params": {
            "city_id": 47
          },
          "city_id": 47,
          "count": 65
        },
        {
          "params": {
            "city_id": 52
          },
          "city_id": 52,
          "count": 57
        },
        {
          "params": {
            "city_id": 41
          },
          "city_id": 41,
          "count": 53
        },
        {
          "params": {
            "city_id": 48
          },
          "city_id": 48,
          "count": 43
        },
        {
          "params": {
            "city_id": 60
          },
          "city_id": 60,
          "count": 26
        },
        {
          "params": {
            "city_id": 55
          },
          "city_id": 55,
          "count": 15
        },
        {
          "params": {
            "city_id": 57
          },
          "city_id": 57,
          "count": 14
        },
        {
          "params": {
            "city_id": 61
          },
          "city_id": 61,
          "count": 9
        },
        {
          "params": {
            "city_id": 58
          },
          "city_id": 58,
          "count": 5
        },
        {
          "params": {
            "city_id": 62
          },
          "city_id": 62,
          "count": 5
        },
        {
          "params": {
            "city_id": 63
          },
          "city_id": 63,
          "count": 4
        },
        {
          "params": {
            "city_id": 59
          },
          "city_id": 59,
          "count": 3
        }
      ]
    }
  end
  
end
