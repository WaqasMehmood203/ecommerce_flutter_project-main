// import 'package:cloud_firestore/cloud_firestore.dart';

// // import 'package:flutterproject/features/shop/models/category_model.dart';
// // import 'package:flutterproject/utils/constants/image_strings.dart';
// // const products = [
// // // --- Outfitter (Brand ID: 1) ---
// //   {
// //     "CategoryId": "4", // TShirts
// //     "SKU": "OutShirt01",
// //     "Title": "Outfitter Classic T-Shirts",
// //     "Price": 2200,
// //     "SalePrice": 1900,
// //     "Stock": 30,
// //     "ProductType": "ProductType.single",
// //     "Description": "A soft cotton shirt perfect for daily wear.",
// //     "Thumbnail":
// //         "https://outfitters.com.pk/cdn/shop/files/F1329106007_1.jpg?v=1748598149",
// //     "Images": [
// //       "https://outfitters.com.pk/cdn/shop/files/F1329106007_1.jpg?v=1748598149",
// //       "https://outfitters.com.pk/cdn/shop/files/F1329106007_4.jpg?v=1748598149",
// //       "https://outfitters.com.pk/cdn/shop/files/F1329106007_2.jpg?v=1748598149"
// //     ],
// //     "IsFeatured": true,
// //     "Brand": {
// //       "Id": "1",
// //       "Name": "Outfitter",
// //       "IsFeatured": true,
// //       "ProductsCount": 15,
// //       "Image":
// //           "https://i.pinimg.com/474x/26/e9/9a/26e99ae8c56dd31650a20adbe3db141c.jpg"
// //     }
// //   },
// //   {
// //     "CategoryId": "4", // TShirts
// //     "SKU": "OutShirt02",
// //     "Title": "Outfitter Polo Shirt",
// //     "Price": 2500,
// //     "SalePrice": 2200,
// //     "Stock": 20,
// //     "ProductType": "ProductType.single",
// //     "Description": "Comfortable cotton polo shirt for casual outings.",
// //     "Thumbnail":
// //         "https://outfitters.com.pk/cdn/shop/files/F1244106814_1.jpg?v=1745995020",
// //     "Images": [
// //       "https://outfitters.com.pk/cdn/shop/files/F1244106814_4_6982ad3d-c9ec-405a-9be9-a3794e09fa93.jpg?v=1745995020",
// //       "https://outfitters.com.pk/cdn/shop/files/F1244106814_2.jpg?v=1745995021",
// //       "https://outfitters.com.pk/cdn/shop/files/F1244106618_1_dfc5a1d8-3d2f-47d5-befc-5da60dd92c7e.jpg?v=1745995020",
// //       "https://outfitters.com.pk/cdn/shop/files/F1244106618_4.jpg?v=1745995020"
// //     ],
// //     "IsFeatured": true,
// //     "Brand": {
// //       "Id": "1",
// //       "Name": "Outfitter",
// //       "IsFeatured": true,
// //       "ProductsCount": 15,
// //       "Image":
// //           "https://i.pinimg.com/474x/26/e9/9a/26e99ae8c56dd31650a20adbe3db141c.jpg"
// //     }
// //   },
// //   {
// //     "CategoryId": "5", // Pants / Jeans
// //     "SKU": "OutPant01",
// //     "Title": "Outfitter Slim Fit Pants",
// //     "Price": 3200,
// //     "SalePrice": 2900,
// //     "Stock": 25,
// //     "ProductType": "ProductType.single",
// //     "Description": "Modern slim-fit pants for everyday wear.",
// //     "Thumbnail":
// //         "https://outfitters.com.pk/cdn/shop/files/F0480108901Lower_1.jpg?v=1742210305",
// //     "Images": [
// //       "https://outfitters.com.pk/cdn/shop/files/F0480108901_2_copy.jpg?v=1742210305",
// //       "https://outfitters.com.pk/cdn/shop/files/F0480108007LOWER.jpg?v=1742210305",
// //       "https://outfitters.com.pk/cdn/shop/files/F0480108007_2_copy.jpg?v=1742210305",
// //       "https://outfitters.com.pk/cdn/shop/files/F0480108618LOWER_ec9684ac-faa1-430a-b99d-9e109550b214.jpg?v=1742210305",
// //       "https://outfitters.com.pk/cdn/shop/files/F0480108618_2_copy.jpg?v=1742210305",
// //     ],
// //     "IsFeatured": true,
// //     "Brand": {
// //       "Id": "1",
// //       "Name": "Outfitter",
// //       "IsFeatured": true,
// //       "ProductsCount": 15,
// //       "Image":
// //           "https://i.pinimg.com/474x/26/e9/9a/26e99ae8c56dd31650a20adbe3db141c.jpg"
// //     }
// //   },
// //   {
// //     "CategoryId": "4", // TShirts
// //     "SKU": "OutTee01",
// //     "Title": "Outfitter Graphic Tee",
// //     "Price": 1800,
// //     "SalePrice": 1600,
// //     "Stock": 15,
// //     "ProductType": "ProductType.single",
// //     "Description": "Trendy printed tee with unique graphics.",
// //     "Thumbnail":
// //         "https://outfitters.com.pk/cdn/shop/files/F1326106513_2.jpg?v=1747914039",
// //     "Images": [
// //       "https://outfitters.com.pk/cdn/shop/files/F1326106513_1.jpg?v=1747914039",
// //       "https://outfitters.com.pk/cdn/shop/files/F1326106513_3.jpg?v=1747914039",
// //       "https://outfitters.com.pk/cdn/shop/files/F1326106513_4.jpg?v=1747914039"
// //     ],
// //     "IsFeatured": true,
// //     "Brand": {
// //       "Id": "1",
// //       "Name": "Outfitter",
// //       "IsFeatured": true,
// //       "ProductsCount": 15,
// //       "Image":
// //           "https://i.pinimg.com/474x/26/e9/9a/26e99ae8c56dd31650a20adbe3db141c.jpg"
// //     }
// //   },

// // // --- Enginee (Brand ID: 2) ---
// //   {
// //     "CategoryId": "4", // TShirts
// //     "SKU": "EngShirt01",
// //     "Title": "Engine Button Down",
// //     "Price": 2500,
// //     "SalePrice": 2100,
// //     "Stock": 20,
// //     "ProductType": "ProductType.single",
// //     "Description": "A formal shirt ideal for office wear.",
// //     "Thumbnail":
// //         "https://engine.com.pk/cdn/shop/products/mc3112-blk_2.jpg?v=1700634664",
// //     "Images": [
// //       "https://engine.com.pk/cdn/shop/products/MC3112-MRN_1.jpg?v=1701951798",
// //       "https://engine.com.pk/cdn/shop/products/MC3112-CML_1.jpg?v=1701951789"
// //     ],
// //     "IsFeatured": true,
// //     "Brand": {
// //       "Id": "2",
// //       "Name": "Enginee",
// //       "IsFeatured": true,
// //       "ProductsCount": 3,
// //       "Image":
// //           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQd_cxqzyRBCWNIpA1ynqjUIklsGB93gsw-hQ&s"
// //     }
// //   },
// //   {
// //     "CategoryId": "4", // TShirts
// //     "SKU": "EngTee01",
// //     "Title": "Engine Graphic T-Shirt",
// //     "Price": 1800,
// //     "SalePrice": 1500,
// //     "Stock": 18,
// //     "ProductType": "ProductType.single",
// //     "Description": "Soft and comfortable t-shirt with bold graphics.",
// //     "Thumbnail":
// //         "https://engine.com.pk/cdn/shop/files/MT4087-WHT_2.jpg?v=1718357585",
// //     "Images": [
// //       "https://engine.com.pk/cdn/shop/files/MT4087-WHT_1.jpg?v=1718357585",
// //       "https://engine.com.pk/cdn/shop/files/MT4087-WHT_3.jpg?v=1718357424",
// //       "https://engine.com.pk/cdn/shop/files/MT4087-WHT_4.jpg?v=1718357424"
// //     ],
// //     "IsFeatured": true,
// //     "Brand": {
// //       "Id": "2",
// //       "Name": "Enginee",
// //       "IsFeatured": true,
// //       "ProductsCount": 3,
// //       "Image":
// //           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQd_cxqzyRBCWNIpA1ynqjUIklsGB93gsw-hQ&s"
// //     }
// //   },
// //   {
// //     "CategoryId": "5", // Pants / Jeans
// //     "SKU": "EngPant01",
// //     "Title": "Engine Casual Pants",
// //     "Price": 2700,
// //     "SalePrice": 2300,
// //     "Stock": 22,
// //     "ProductType": "ProductType.single",
// //     "Description": "Versatile pants for formal and casual events.",
// //     "Thumbnail":
// //         "https://engine.com.pk/cdn/shop/files/FP5002-BGE_2.jpg?v=1740518854",
// //     "Images": [
// //       "https://engine.com.pk/cdn/shop/files/MP4002-BLK_3.jpg?v=1735669976",
// //       "https://engine.com.pk/cdn/shop/files/FP5007-NVY_1.jpg?v=1742467801"
// //     ],
// //     "IsFeatured": true,
// //     "Brand": {
// //       "Id": "2",
// //       "Name": "Enginee",
// //       "IsFeatured": true,
// //       "ProductsCount": 3,
// //       "Image":
// //           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQd_cxqzyRBCWNIpA1ynqjUIklsGB93gsw-hQ&s"
// //     }
// //   },
// //   {
// //     "CategoryId": "4", // TShirts
// //     "SKU": "EngShirt02",
// //     "Title": "Engine Striped Shirt",
// //     "Price": 2800,
// //     "SalePrice": 2500,
// //     "Stock": 15,
// //     "ProductType": "ProductType.single",
// //     "Description": "Elegant striped shirt with a modern cut.",
// //     "Thumbnail":
// //         "https://engine.com.pk/cdn/shop/files/FC4004-WHT_2_d6d708e0-f9cc-485a-b976-cbc14f48f3b3.jpg?v=1718088102",
// //     "Images": [
// //       "https://engine.com.pk/cdn/shop/files/FC4068-WHT_2.jpg?v=1719900718"
// //     ],
// //     "IsFeatured": true,
// //     "Brand": {
// //       "Id": "2",
// //       "Name": "Enginee",
// //       "IsFeatured": true,
// //       "ProductsCount": 3,
// //       "Image":
// //           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQd_cxqzyRBCWNIpA1ynqjUIklsGB93gsw-hQ&s"
// //     }
// //   },
// //   {
// //     "CategoryId": "4", // TShirts
// //     "SKU": "PumaTee01",
// //     "Title": "Puma Essentials Logo Tee",
// //     "Price": 3200,
// //     "SalePrice": 2800,
// //     "Stock": 30,
// //     "ProductType": "ProductType.single",
// //     "Description": "Bold branding and breathable comfort.",
// //     "Thumbnail":
// //         "https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_2000,h_2000/global/586960/01/mod01/fnd/SEA/fmt/png/Essentials-Logo-Tee-Youth",
// //     "Images": [
// //       "https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_2000,h_2000/global/586960/01/mod02/fnd/SEA/fmt/png/Essentials-Logo-Tee-Youth",
// //       "https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_2000,h_2000/global/586960/01/fnd/SEA/fmt/png/Essentials-Logo-Tee-Youth",
// //       "https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_2000,h_2000/global/586960/01/bv/fnd/SEA/fmt/png/Essentials-Logo-Tee-Youth"
// //     ],
// //     "IsFeatured": true,
// //     "Brand": {
// //       "Id": "3",
// //       "Name": "Puma",
// //       "IsFeatured": true,
// //       "ProductsCount": 4,
// //       "Image":
// //           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNOhHZ-0c3De3DFuwuosHkDnJRDwhDb-tLdw&s"
// //     }
// //   },
// //   {
// //     "CategoryId": "5", // Pants / Jeans
// //     "SKU": "PumaPant01",
// //     "Title": "Puma Men’s Track Pants",
// //     "Price": 4200,
// //     "SalePrice": 3800,
// //     "Stock": 15,
// //     "ProductType": "ProductType.single",
// //     "Description": "Designed for movement and comfort.",
// //     "Thumbnail":
// //         "https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_750,h_750/global/629682/01/mod01/fnd/IND/fmt/png/PUMATECH-Men's-Track-Pants",
// //     "Images": [
// //       "https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_750,h_750/global/629682/01/mod05/fnd/IND/fmt/png/PUMATECH-Men's-Track-Pants",
// //       "https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_750,h_750/global/629682/79/mod01/fnd/IND/fmt/png/PUMATECH-Men's-Track-Pants",
// //       "https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_750,h_750/global/629682/79/mod05/fnd/IND/fmt/png/PUMATECH-Men's-Track-Pants",
// //       "https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_750,h_750/global/629682/87/mod01/fnd/IND/fmt/png/PUMATECH-Men's-Track-Pants",
// //       "https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_750,h_750/global/629682/87/mod04/fnd/IND/fmt/png/PUMATECH-Men's-Track-Pants"
// //     ],
// //     "IsFeatured": true,
// //     "Brand": {
// //       "Id": "3",
// //       "Name": "Puma",
// //       "IsFeatured": true,
// //       "ProductsCount": 4,
// //       "Image":
// //           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNOhHZ-0c3De3DFuwuosHkDnJRDwhDb-tLdw&s"
// //     }
// //   },

// //   {
// //     "CategoryId": "4", // TShirts
// //     "SKU": "AdidasTee01",
// //     "Title": "Adidas 3-Stripes Tee",
// //     "Price": 3000,
// //     "SalePrice": 2700,
// //     "Stock": 28,
// //     "ProductType": "ProductType.single",
// //     "Description": "Comfortable tee with iconic 3-stripes.",
// //     "Thumbnail":
// //         "https://assets.adidas.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/a8e5928175214d5ebc8f5d57e73af43b_9366/Adicolor_Classics_3-Stripes_Tee_Blue_IM9392_21_model.jpg",
// //     "Images": [
// //       "https://assets.adidas.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/a8dac888a08249f0a0225d4e53f1687f_9366/Adicolor_Classics_3-Stripes_Tee_Beige_IZ2366_21_model.jpg",
// //       "https://assets.adidas.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/9a08a3c0f5574dc79f65d36c8c28713f_9366/Adicolor_Classics_3-Stripes_Tee_Blue_JD2880_21_model.jpg",
// //       "https://assets.adidas.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/03c761bf7e83443fadb14b70a1d0c064_9366/Adicolor_Classics_3-Stripes_Tee_Grey_JN7016_21_model.jpg",
// //       "https://assets.adidas.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/0a3bd04a41f341eaa585b42c404316dc_9366/Adicolor_Classics_3-Stripes_Tee_Red_JN7019_21_model.jpg",
// //       "https://assets.adidas.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/19840b41c773489d88229fe788d6abdb_9366/Adicolor_Classics_3-Stripes_Tee_White_JN7020_21_model.jpg",
// //       "https://assets.adidas.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/b68913c040db4ba78819c5614d7c5a3c_9366/Adicolor_Classics_3-Stripes_Tee_Grey_JY1369_21_model.jpg"
// //     ],
// //     "IsFeatured": true,
// //     "Brand": {
// //       "Id": "4",
// //       "Name": "Adidas",
// //       "IsFeatured": true,
// //       "ProductsCount": 4,
// //       "Image":
// //           "https://cdn.logojoy.com/wp-content/uploads/20231013154327/Adidas-logo-1991-1-600x319.png"
// //     }
// //   },
// //   {
// //     "CategoryId": "4", // TShirts
// //     "SKU": "NikeTee01",
// //     "Title": "Nike Sportswear Club Tee",
// //     "Price": 3600,
// //     "SalePrice": 3200,
// //     "Stock": 24,
// //     "ProductType": "ProductType.single",
// //     "Description": "Soft cotton tee for all-day comfort.",
// //     "Thumbnail":
// //         "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/divhtybtltxjtyhhq2i5/M+NSW+CLUB+TEE.png",
// //     "Images": [
// //       "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/i1-5ab954cc-ad06-4763-8b1a-2dc2ea5bb779/M+NSW+CLUB+TEE.png",
// //       "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/qipxty6qfzfmhlvygc3g/M+NSW+CLUB+TEE.png",
// //       "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/a686d27e-7bcc-414d-b7af-d7cd4a27082d/M+NSW+CLUB+TEE.png",
// //       "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/85b9bbe7-2726-4f2b-937c-15ae7bed2679/M+NSW+CLUB+TEE.png",
// //       "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/b71be779-4952-4883-bec0-465968b6b8ef/M+NSW+CLUB+TEE.png",
// //       "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/4eec77af-5bee-4278-9ae9-aefb323f8070/M+NSW+CLUB+TEE.png",
// //       "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/hfoqjmvml1z5itd4lzg5/M+NSW+CLUB+TEE.png",
// //       "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/ef754e1e-065d-41e8-be16-f94d01a8bde9/M+NSW+CLUB+TEE.png",
// //       "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/89bf494d-4bb4-4d23-b98f-42216f4e64e0/M+NSW+CLUB+TEE.png"
// //     ],
// //     "IsFeatured": true,
// //     "Brand": {
// //       "Id": "5",
// //       "Name": "Nike",
// //       "IsFeatured": true,
// //       "ProductsCount": 4,
// //       "Image":
// //           "https://images.seeklogo.com/logo-png/9/1/nike-logo-png_seeklogo-99478.png"
// //     }
// //   },

// //   {
// //     "CategoryId": "5", // Pants / Jeans
// //     "SKU": "AdidasPant01",
// //     "Title": "Adidas Training Pants",
// //     "Price": 4000,
// //     "SalePrice": 3600,
// //     "Stock": 20,
// //     "ProductType": "ProductType.single",
// //     "Description": "Breathable workout pants for daily use.",
// //     "Thumbnail":
// //         "https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/6f6c1d11ebc748f0b2da549e0120bb51_9366/Designed_for_Training_Hybrid_Pants_Blue_JI8160_21_model.jpg",
// //     "Images": [
// //       "https://assets.adidas.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/180a7b51daa6455aa4ee5de155c9cf58_9366/Designed_for_Training_Hybrid_Pants_Black_IY1123_21_model.jpg",
// //       "https://assets.adidas.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/aa5fe09e39d34eb08168571e66a5d02d_9366/Designed_for_Training_Hybrid_Pants_Brown_JI8155_21_model.jpg",
// //       "https://assets.adidas.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/0c66658482ce49ca9951ce9c02cb5b10_9366/Designed_for_Training_Hybrid_Pants_Green_JI8156_21_model.jpg",
// //       "https://assets.adidas.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/eaa287834fb44227967c08b44be102bf_9366/Designed_for_Training_Hybrid_Pants_Pink_JI8158_21_model.jpg",
// //       "https://assets.adidas.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/edd4c5b30df641a8b4f9ef0cbec216fa_9366/Designed_for_Training_Hybrid_Pants_Green_JI8159_21_model.jpg"
// //     ],
// //     "IsFeatured": true,
// //     "Brand": {
// //       "Id": "4",
// //       "Name": "Adidas",
// //       "IsFeatured": true,
// //       "ProductsCount": 4,
// //       "Image":
// //           "https://cdn.logojoy.com/wp-content/uploads/20231013154327/Adidas-logo-1991-1-600x319.png"
// //     }
// //   },

// //   {
// //     "CategoryId": "6", // Shoes
// //     "SKU": "PumaShoe01",
// //     "Title": "Puma Smash V2 Sneakers",
// //     "Price": 5800,
// //     "SalePrice": 5300,
// //     "Stock": 20,
// //     "ProductType": "ProductType.single",
// //     "Description": "Timeless design and daily comfort in one pair.",
// //     "Thumbnail":
// //         "https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa/global/365215/01/sv01/fnd/PNA/fmt/png",
// //     "Images": [
// //       "https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_750,h_750/global/364989/03/sv01/fnd/PNA/fmt/png/PUMA-Smash-v2-Sneakers",
// //       "https://speedsports.pk/cdn/shop/files/36521504_sv01-01_1.jpg?v=1706052874&width=900"
// //     ],
// //     "IsFeatured": true,
// //     "Brand": {
// //       "Id": "3",
// //       "Name": "Puma",
// //       "IsFeatured": true,
// //       "ProductsCount": 4,
// //       "Image":
// //           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNOhHZ-0c3De3DFuwuosHkDnJRDwhDb-tLdw&s"
// //     }
// //   },
// //   {
// //     "CategoryId": "6", // Shoes
// //     "SKU": "AdidasShoe01",
// //     "Title": "Adidas Duramo SL",
// //     "Price": 6800,
// //     "SalePrice": 6400,
// //     "Stock": 25,
// //     "ProductType": "ProductType.single",
// //     "Description": "Lightweight and breathable running shoes.",
// //     "Thumbnail":
// //         "https://assets.adidas.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/a73975545aa740b19fbeedf6960311e6_9366/Duramo_SL_2_Running_Shoes_White_IH8215_HM1.jpg",
// //     "Images": [
// //       "https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/dea1765f5a004cdeafb72795bd742713_9366/Duramo_SL_2_Running_Shoes_Black_IH8218_HM1.jpg",
// //       "https://assets.adidas.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/2836ecd0ec5b492f9fbe2835e0718ed5_9366/Duramo_SL_2_Running_Shoes_Green_IF9395_01_standard.jpg",
// //       "https://assets.adidas.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/dea1765f5a004cdeafb72795bd742713_9366/Duramo_SL_2_Running_Shoes_Black_IH8218_HM1.jpg",
// //       "https://assets.adidas.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/6ae284a4cf1948bba43f04f9e0490f81_9366/Duramo_SL_2_Running_Shoes_Grey_IH8219_HM1.jpg",
// //       "https://assets.adidas.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/1e9012db20114e93bc4fd2d3cbccdaf0_9366/Duramo_SL_2_Running_Shoes_Black_IH8220_HM1.jpg",
// //       "https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/906100ee37894147ad87f69743edc82a_9366/Duramo_SL_2_Running_Shoes_Blue_IH8221_HM1.jpg",
// //       "https://assets.adidas.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/216c3eb9ba85401d9af75fa648c945b3_9366/Duramo_SL_2_Running_Shoes_White_JS4395_HM1.jpg"
// //     ],
// //     "IsFeatured": true,
// //     "Brand": {
// //       "Id": "4",
// //       "Name": "Adidas",
// //       "IsFeatured": true,
// //       "ProductsCount": 4,
// //       "Image":
// //           "https://cdn.logojoy.com/wp-content/uploads/20231013154327/Adidas-logo-1991-1-600x319.png"
// //     }
// //   },
// //   {
// //     "CategoryId": "6", // Shoes
// //     "SKU": "NikeShoe01",
// //     "Title": "Nike Air Max 270",
// //     "Price": 14000,
// //     "SalePrice": 13000,
// //     "Stock": 20,
// //     "ProductType": "ProductType.single",
// //     "Description": "Modern design with maximum cushioning and style.",
// //     "Thumbnail":
// //         "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/awjogtdnqxniqqk0wpgf/AIR+MAX+270.png",
// //     "Images": [
// //       "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/skwgyqrbfzhu6uyeh0gg/AIR+MAX+270.png",
// //       "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/gorfwjchoasrrzr1fggt/AIR+MAX+270.png",
// //       "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/da58f543-363c-4a2e-8a27-3ffc3cf7357b/AIR+MAX+270.png",
// //       "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/45743c09-2f1d-4118-b24c-04eb3f5d37ad/AIR+MAX+270.png",
// //       "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/247184b0-3670-45f2-8ad9-76307cae5a80/AIR+MAX+270.png"
// //     ],
// //     "IsFeatured": true,
// //     "Brand": {
// //       "Id": "5",
// //       "Name": "Nike",
// //       "IsFeatured": true,
// //       "ProductsCount": 4,
// //       "Image":
// //           "https://images.seeklogo.com/logo-png/9/1/nike-logo-png_seeklogo-99478.png"
// //     }
// //   },

// //   {
// //     "CategoryId": "5", // Pants / Jeans
// //     "SKU": "NikePant01",
// //     "Title": "Nike Dri-FIT Training Pants",
// //     "Price": 5200,
// //     "SalePrice": 4800,
// //     "Stock": 18,
// //     "ProductType": "ProductType.single",
// //     "Description": "Lightweight, sweat-wicking pants for workouts.",
// //     "Thumbnail":
// //         "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/11aa2aa6-512d-4f30-aa21-b077a453135e/M+NK+DF+DAWN+RANGE+PANT.png",
// //     "Images": [
// //       "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/feaecd89-6072-4317-ac31-65ba01e27a53/M+NK+DF+DAWN+RANGE+PANT.png",
// //       "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/ee3a4afe-f5c2-482e-945e-ea8ee799cd94/M+NK+DF+DAWN+RANGE+PANT.png"
// //     ],
// //     "IsFeatured": true,
// //     "Brand": {
// //       "Id": "5",
// //       "Name": "Nike",
// //       "IsFeatured": true,
// //       "ProductsCount": 4,
// //       "Image":
// //           "https://images.seeklogo.com/logo-png/9/1/nike-logo-png_seeklogo-99478.png"
// //     }
// //   },
// //   {
// //     "CategoryId": "8", // Glasses
// //     "SKU": "NikeGlasses01",
// //     "Title": "Nike Show X3 Sunglasses",
// //     "Price": 9500,
// //     "SalePrice": 8800,
// //     "Stock": 10,
// //     "ProductType": "ProductType.single",
// //     "Description":
// //         "Performance sunglasses designed for sports and sunlight protection.",
// //     "Thumbnail":
// //         "https://images.salsify.com/image/upload/s--G8llmU1D--/w_1300,h_1300,q_auto,c_pad/h3c1irnq9kz0bx6rxinq.jpg",
// //     "Images": [
// //       "https://images.salsify.com/image/upload/s--tArfJmYk--/w_1300,h_1300,q_auto,c_pad/fqi7zvyu9xstu3s9gmjv.jpg",
// //       "https://images.salsify.com/image/upload/s--HpqyPLJ7--/w_1300,h_1300,q_auto,c_pad/nmzoyqiklrbr3pzh3rgm.jpg",
// //       "https://images.salsify.com/image/upload/s--9lBvBNhI--/w_1300,h_1300,q_auto,c_pad/kceonkc8xw3bq5kkjddl.jpg"
// //     ],
// //     "IsFeatured": true,
// //     "Brand": {
// //       "Id": "5",
// //       "Name": "Nike",
// //       "IsFeatured": true,
// //       "ProductsCount": 4,
// //       "Image":
// //           "https://images.seeklogo.com/logo-png/9/1/nike-logo-png_seeklogo-99478.png"
// //     }
// //   },
// //   {
// //     "CategoryId": "7", // Bags
// //     "SKU": "PumaBag01",
// //     "Title": "Puma Phase Backpack",
// //     "Price": 3500,
// //     "SalePrice": 3000,
// //     "Stock": 12,
// //     "ProductType": "ProductType.single",
// //     "Description": "Lightweight and stylish for daily use.",
// //     "Thumbnail":
// //         "https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_750,h_750/global/091164/03/mod01/fnd/PNA/fmt/png/PUMA-Phase-Backpack",
// //     "Images": [
// //       "https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_750,h_750/global/091164/03/fnd/PNA/fmt/png/PUMA-Phase-Backpack",
// //       "https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_750,h_750/global/091164/02/mod01/fnd/PNA/fmt/png/PUMA-Phase-Backpack",
// //       "https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_750,h_750/global/091164/02/fnd/PNA/fmt/png/PUMA-Phase-Backpack"
// //     ],
// //     "IsFeatured": true,
// //     "Brand": {
// //       "Id": "3",
// //       "Name": "Puma",
// //       "IsFeatured": true,
// //       "ProductsCount": 4,
// //       "Image":
// //           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNOhHZ-0c3De3DFuwuosHkDnJRDwhDb-tLdw&s"
// //     }
// //   },

// //   {
// //     "CategoryId": "7", // Bags
// //     "SKU": "AdidasBag01",
// //     "Title": "Adidas Classic Backpack",
// //     "Price": 3700,
// //     "SalePrice": 3300,
// //     "Stock": 16,
// //     "ProductType": "ProductType.single",
// //     "Description": "Functional design with bold branding.",
// //     "Thumbnail":
// //         "https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/70486082cb5a4a40aa47fffe0ec15efa_9366/Excel_7_Backpack_Black_IU7678_01_standard.jpg",
// //     "Images": [
// //       "https://assets.adidas.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/5357684b6f2e493e95a95bf2c439476c_9366/Excel_7_Backpack_Grey_IU7688_01_00_standard.jpg",
// //       "https://assets.adidas.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/88c1bdd6e7934feeb3d85f4c175a8316_9366/Excel_7_Backpack_White_IU7689_01_00_standard.jpg"
// //     ],
// //     "IsFeatured": true,
// //     "Brand": {
// //       "Id": "4",
// //       "Name": "Adidas",
// //       "IsFeatured": true,
// //       "ProductsCount": 4,
// //       "Image":
// //           "https://cdn.logojoy.com/wp-content/uploads/20231013154327/Adidas-logo-1991-1-600x319.png"
// //     }
// //   },
// //   {
// //     "CategoryId": "6",
// //     "SKU": "SketcherWomen01",
// //     "Title": "Skechers Ultra Flex",
// //     "Price": 4800,
// //     "SalePrice": 4500,
// //     "Stock": 18,
// //     "ProductType": "ProductType.single",
// //     "Description": "Comfortable slip-on shoes for women, great for walking.",
// //     "Thumbnail":
// //         "https://images.skechers.com/image;width=1120%2Cformat=auto/149710_MVE_HERO_LG",
// //     "Images": [
// //       "https://images.skechers.com/image;width=1120%2Cformat=auto/149710_PERI_HERO_LG",
// //       "https://images.skechers.com/image;width=1120%2Cformat=auto/149710_BLK_HERO_LG",
// //       "https://images.skechers.com/image;width=1120%2Cformat=auto/149710_NAT_HERO_LG",
// //       "https://images.skechers.com/image;width=3000%2Cformat=auto/149710_WHT_HERO_LG",
// //       "https://images.skechers.com/image;width=1120%2Cformat=auto/149710_AQUA_HERO_LG"
// //     ],
// //     "IsFeatured": true,
// //     "Brand": {
// //       "Id": "6",
// //       "Name": "Skechers",
// //       "IsFeatured": true,
// //       "ProductsCount": 6,
// //       "Image":
// //           "https://images.seeklogo.com/logo-png/12/1/skechers-logo-png_seeklogo-127487.png"
// //     }
// //   },
// //   {
// //     "CategoryId": "6",
// //     "SKU": "SketcherWomen02",
// //     "Title": "Skechers Go Walk Joy",
// //     "Price": 5200,
// //     "SalePrice": 4900,
// //     "Stock": 22,
// //     "ProductType": "ProductType.single",
// //     "Description":
// //         "Go Walk Joy shoes are engineered for maximum comfort and breathability.",
// //     "Thumbnail":
// //         "https://images.skechers.com/image;width=1120%2Cformat=auto/125582_WMNT_HERO_LG",
// //     "Images": [
// //       "https://images.skechers.com/image;width=1120%2Cformat=auto/125582_NVLV_HERO_LG",
// //       "https://images.skechers.com/image;width=1120%2Cformat=auto/125582_BKMT_HERO_LG",
// //       "https://images.skechers.com/image;width=1120%2Cformat=auto/125582_BBK_HERO_LG"
// //     ],
// //     "IsFeatured": false,
// //     "Brand": {
// //       "Id": "6",
// //       "Name": "Skechers",
// //       "IsFeatured": true,
// //       "ProductsCount": 6,
// //       "Image":
// //           "https://images.seeklogo.com/logo-png/12/1/skechers-logo-png_seeklogo-127487.png"
// //     }
// //   },
// //   {
// //     "CategoryId": "6",
// //     "SKU": "SketcherWomen03",
// //     "Title": "Skechers D’Lites Women",
// //     "Price": 6100,
// //     "SalePrice": 5800,
// //     "Stock": 10,
// //     "ProductType": "ProductType.single",
// //     "Description":
// //         "Trendy and cushioned, perfect for street style and daily wear.",
// //     "Thumbnail":
// //         "https://images.skechers.com/image;width=1120%2Cformat=auto/150537_BKNT_HERO_LG",
// //     "Images": [
// //       "https://images.skechers.com/image;width=1120%2Cformat=auto/150537_OWBR_HERO_LG",
// //       "https://images.skechers.com/image;width=1120%2Cformat=auto/150537_NTTP_HERO_LG"
// //     ],
// //     "IsFeatured": false,
// //     "Brand": {
// //       "Id": "6",
// //       "Name": "Skechers",
// //       "IsFeatured": true,
// //       "ProductsCount": 6,
// //       "Image":
// //           "https://images.seeklogo.com/logo-png/12/1/skechers-logo-png_seeklogo-127487.png"
// //     }
// //   },
// //   {
// //     "CategoryId": "6",
// //     "SKU": "SketcherWomen04",
// //     "Title": "Skechers Arch Fit",
// //     "Price": 5700,
// //     "SalePrice": 5400,
// //     "Stock": 14,
// //     "ProductType": "ProductType.single",
// //     "Description":
// //         "Engineered with Arch Fit support for long-term foot comfort.",
// //     "Thumbnail":
// //         "https://images.skechers.com/image;width=1120%2Cformat=auto/177205_TPE_HERO_LG",
// //     "Images": [
// //       "https://images.skechers.com/image;width=1120%2Cformat=auto/177205_WHT_HERO_LG",
// //       "https://images.skechers.com/image;width=1120%2Cformat=auto/177205_SAGE_HERO_LG",
// //       "https://images.skechers.com/image;width=1120%2Cformat=auto/177205_MVE_HERO_LG"
// //     ],
// //     "IsFeatured": false,
// //     "Brand": {
// //       "Id": "6",
// //       "Name": "Skechers",
// //       "IsFeatured": true,
// //       "ProductsCount": 6,
// //       "Image":
// //           "https://images.seeklogo.com/logo-png/12/1/skechers-logo-png_seeklogo-127487.png"
// //     }
// //   },
// //   {
// //     "CategoryId": "6",
// //     "SKU": "SketcherWomen05",
// //     "Title": "Skechers Max Cushioning Elite",
// //     "Price": 6300,
// //     "SalePrice": 6000,
// //     "Stock": 12,
// //     "ProductType": "ProductType.single",
// //     "Description": "High-performance cushioning for workouts and long walks.",
// //     "Thumbnail":
// //         "https://images.skechers.com/image;width=1120%2Cformat=auto/128259_BBK_HERO_LG",
// //     "Images": [
// //       "https://images.skechers.com/image;width=1120%2Cformat=auto/128259_BBK_HERO_LG",
// //       "https://images.skechers.com/image;width=1120%2Cformat=auto/128259_NVY_HERO_LG"
// //     ],
// //     "IsFeatured": true,
// //     "Brand": {
// //       "Id": "6",
// //       "Name": "Skechers",
// //       "IsFeatured": true,
// //       "ProductsCount": 6,
// //       "Image":
// //           "https://images.seeklogo.com/logo-png/12/1/skechers-logo-png_seeklogo-127487.png"
// //     }
// //   },
// //   {
// //     "CategoryId": "6",
// //     "SKU": "HushPupWomen01",
// //     "Title": "Hush Puppies Elegant Pumps",
// //     "Price": 5200,
// //     "SalePrice": 4900,
// //     "Stock": 15,
// //     "ProductType": "ProductType.single",
// //     "Description": "Elegant leather pumps designed for everyday office wear.",
// //     "Thumbnail":
// //         "https://www.hushpuppies.com.pk/cdn/shop/files/IMG_1707.jpg?v=1743622111&width=1200",
// //     "Images": [
// //       "https://www.hushpuppies.com.pk/cdn/shop/files/IMG_1719.jpg?v=1743622112&width=1200",
// //       "https://www.hushpuppies.com.pk/cdn/shop/files/VeraStellaBeige.jpg?v=1748609607&width=1200",
// //       "https://www.hushpuppies.com.pk/cdn/shop/files/VeraStellaBlue.jpg?v=1748609667&width=1200"
// //     ],
// //     "IsFeatured": true,
// //     "Brand": {
// //       "Id": "7",
// //       "Name": "Hush Puppies",
// //       "IsFeatured": true,
// //       "ProductsCount": 8,
// //       "Image":
// //           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCqoQZ1AmInl6yTEQ2vI5960Q6sMjITpvccQ&s"
// //     }
// //   },
// //   {
// //     "CategoryId": "6",
// //     "SKU": "HushPupWomen02",
// //     "Title": "Hush Puppies Ballerina Flats",
// //     "Price": 4700,
// //     "SalePrice": 4500,
// //     "Stock": 20,
// //     "ProductType": "ProductType.single",
// //     "Description": "Lightweight ballerina flats with cushioned footbed.",
// //     "Thumbnail":
// //         "https://www.hushpuppies.com.pk/cdn/shop/files/IMG_3185.jpg?v=1743622012&width=1200",
// //     "Images": [
// //       "https://www.hushpuppies.com.pk/cdn/shop/files/IMG_3172.jpg?v=1743622012&width=1200",
// //       "https://www.hushpuppies.com.pk/cdn/shop/files/IMG_3158_5fa7fa48-4e1b-40c2-b2b0-bf98d14ba917.jpg?v=1743622013&width=1200"
// //     ],
// //     "IsFeatured": true,
// //     "Brand": {
// //       "Id": "7",
// //       "Name": "Hush Puppies",
// //       "IsFeatured": true,
// //       "ProductsCount": 8,
// //       "Image":
// //           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCqoQZ1AmInl6yTEQ2vI5960Q6sMjITpvccQ&s"
// //     }
// //   },
// //   {
// //     "CategoryId": "6",
// //     "SKU": "HushPupWomen03",
// //     "Title": "Hush Puppies Sporty Sandals",
// //     "Price": 5000,
// //     "SalePrice": 4700,
// //     "Stock": 17,
// //     "ProductType": "ProductType.single",
// //     "Description": "Adjustable sporty sandals with arch support.",
// //     "Thumbnail":
// //         "https://www.hushpuppies.com.pk/cdn/shop/files/IMG_5262.jpg?v=1743621911&width=1200",
// //     "Images": [
// //       "https://www.hushpuppies.com.pk/cdn/shop/files/IMG_5256.jpg?v=1743621912&width=1200",
// //       "https://www.hushpuppies.com.pk/cdn/shop/files/IMG_5249.jpg?v=1743621912&width=1200"
// //     ],
// //     "IsFeatured": false,
// //     "Brand": {
// //       "Id": "7",
// //       "Name": "Hush Puppies",
// //       "IsFeatured": true,
// //       "ProductsCount": 8,
// //       "Image":
// //           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCqoQZ1AmInl6yTEQ2vI5960Q6sMjITpvccQ&s"
// //     }
// //   },
// //   {
// //     "CategoryId": "6",
// //     "SKU": "HushPupWomen04",
// //     "Title": "Hush Puppies Soft Slip-Ons",
// //     "Price": 4900,
// //     "SalePrice": 4600,
// //     "Stock": 21,
// //     "ProductType": "ProductType.single",
// //     "Description":
// //         "Slip-on shoes with breathable fabric and lightweight design.",
// //     "Thumbnail":
// //         "https://www.hushpuppies.com.pk/cdn/shop/files/IMG_9119_12748082-0ed2-48d0-8742-ff2e4426709b.jpg?v=1743622183&width=1200",
// //     "Images": [
// //       "https://www.hushpuppies.com.pk/cdn/shop/files/IMG_9092_8a549ebb-60e5-4543-8891-bbf35a303995.jpg?v=1743622184&width=1200",
// //       "https://www.hushpuppies.com.pk/cdn/shop/files/IMG_9079_8ccb647f-ecfd-436f-b8be-282bc2975315.jpg?v=1743622184&width=1200"
// //     ],
// //     "IsFeatured": true,
// //     "Brand": {
// //       "Id": "7",
// //       "Name": "Hush Puppies",
// //       "IsFeatured": true,
// //       "ProductsCount": 8,
// //       "Image":
// //           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCqoQZ1AmInl6yTEQ2vI5960Q6sMjITpvccQ&s"
// //     }
// //   },
// // ];

// const products = [
// // --- Outfitter (Brand ID: 1) ---
//   {
//     "CategoryId": "4", // TShirts
//     "SKU": "OutShirt01",
//     "Title": "Outfitter Classic T-Shirts",
//     "Price": 2200,
//     "SalePrice": 1900,
//     "Stock": 30,
//     "ProductType": "ProductType.single",
//     "Description": "A soft cotton shirt perfect for daily wear.",
//     "Thumbnail": "https://i.postimg.cc/t4HQGqy7/img1.webp",
//     "Images": [
//       "https://i.postimg.cc/t4HQGqy7/img1.webp",
//       "https://i.postimg.cc/v8fwqxFC/img2.jpg",
//       "https://i.postimg.cc/W4hQMhwW/img3.webp"
//     ],
//     "IsFeatured": true,
//     "Brand": {
//       "Id": "1",
//       "Name": "Outfitter",
//       "IsFeatured": true,
//       "ProductsCount": 15,
//       "Image": "https://i.postimg.cc/bJL1mzPZ/logo7.jpg"
//     }
//   },
//   {
//     "CategoryId": "4", // TShirts
//     "SKU": "OutShirt02",
//     "Title": "Outfitter Polo Shirt",
//     "Price": 2500,
//     "SalePrice": 2200,
//     "Stock": 20,
//     "ProductType": "ProductType.single",
//     "Description": "Comfortable cotton polo shirt for casual outings.",
//     "Thumbnail": "https://i.postimg.cc/NMRC4T94/img4.webp",
//     "Images": [
//       "https://i.postimg.cc/QMTf85b3/img5.jpg",
//       "https://i.postimg.cc/zvtCSXj7/img6.webp",
//       "https://i.postimg.cc/tTDWpCLb/img7.webp",
//       "https://i.postimg.cc/tJYZbd3d/img8.webp"
//     ],
//     "IsFeatured": true,
//     "Brand": {
//       "Id": "1",
//       "Name": "Outfitter",
//       "IsFeatured": true,
//       "ProductsCount": 15,
//       "Image": "https://i.postimg.cc/bJL1mzPZ/logo7.jpg"
//     }
//   },
//   {
//     "CategoryId": "5", // Pants / Jeans
//     "SKU": "OutPant01",
//     "Title": "Outfitter Slim Fit Pants",
//     "Price": 3200,
//     "SalePrice": 2900,
//     "Stock": 25,
//     "ProductType": "ProductType.single",
//     "Description": "Modern slim-fit pants for everyday wear.",
//     "Thumbnail": "https://i.postimg.cc/3xCwPbM5/img9.webp",
//     "Images": [
//       "https://i.postimg.cc/66knKSPy/img10.webp",
//       "https://i.postimg.cc/vZ344S07/img11.webp",
//       "https://i.postimg.cc/VLwvDcTB/img12.webp",
//       "https://i.postimg.cc/vTtQpcj7/img13.webp",
//       "https://i.postimg.cc/SRdhgH2D/img14.webp",
//     ],
//     "IsFeatured": true,
//     "Brand": {
//       "Id": "1",
//       "Name": "Outfitter",
//       "IsFeatured": true,
//       "ProductsCount": 15,
//       "Image": "https://i.postimg.cc/bJL1mzPZ/logo7.jpg"
//     }
//   },
//   {
//     "CategoryId": "4", // TShirts
//     "SKU": "OutTee01",
//     "Title": "Outfitter Graphic Tee",
//     "Price": 1800,
//     "SalePrice": 1600,
//     "Stock": 15,
//     "ProductType": "ProductType.single",
//     "Description": "Trendy printed tee with unique graphics.",
//     "Thumbnail": "https://i.postimg.cc/yxvMm9tG/img15.webp",
//     "Images": [
//       "https://i.postimg.cc/6QJmGYT3/img16.webp",
//       "https://i.postimg.cc/158CCLqX/img17.webp",
//       "https://i.postimg.cc/XNzxCQzb/img18.webp"
//     ],
//     "IsFeatured": true,
//     "Brand": {
//       "Id": "1",
//       "Name": "Outfitter",
//       "IsFeatured": true,
//       "ProductsCount": 15,
//       "Image": "https://i.postimg.cc/bJL1mzPZ/logo7.jpg"
//     }
//   },

// // --- Enginee (Brand ID: 2) ---
//   {
//     "CategoryId": "4", // TShirts
//     "SKU": "EngShirt01",
//     "Title": "Engine Button Down",
//     "Price": 2500,
//     "SalePrice": 2100,
//     "Stock": 20,
//     "ProductType": "ProductType.single",
//     "Description": "A formal shirt ideal for office wear.",
//     "Thumbnail": "https://i.postimg.cc/d10m7yR3/img19.webp",
//     "Images": [
//       "https://i.postimg.cc/HLYwXcGq/img20.webp",
//       "https://i.postimg.cc/jdyP1QRV/img21.webp"
//     ],
//     "IsFeatured": true,
//     "Brand": {
//       "Id": "2",
//       "Name": "Enginee",
//       "IsFeatured": true,
//       "ProductsCount": 3,
//       "Image": "https://i.postimg.cc/zvj2Smt7/logo6.png"
//     }
//   },
//   {
//     "CategoryId": "4", // TShirts
//     "SKU": "EngTee01",
//     "Title": "Engine Graphic T-Shirt",
//     "Price": 1800,
//     "SalePrice": 1500,
//     "Stock": 18,
//     "ProductType": "ProductType.single",
//     "Description": "Soft and comfortable t-shirt with bold graphics.",
//     "Thumbnail": "https://i.postimg.cc/gJ6nZmJ9/img22.webp",
//     "Images": [
//       "https://i.postimg.cc/XJFYvLH4/img23.webp",
//       "https://i.postimg.cc/sDKD1vcQ/img24.webp",
//       "https://i.postimg.cc/1txyb69T/img25.webp"
//     ],
//     "IsFeatured": true,
//     "Brand": {
//       "Id": "2",
//       "Name": "Enginee",
//       "IsFeatured": true,
//       "ProductsCount": 3,
//       "Image": "https://i.postimg.cc/zvj2Smt7/logo6.png"
//     }
//   },
//   {
//     "CategoryId": "5", // Pants / Jeans
//     "SKU": "EngPant01",
//     "Title": "Engine Casual Pants",
//     "Price": 2700,
//     "SalePrice": 2300,
//     "Stock": 22,
//     "ProductType": "ProductType.single",
//     "Description": "Versatile pants for formal and casual events.",
//     "Thumbnail": "https://i.postimg.cc/RZymnfnF/img26.webp",
//     "Images": [
//       "https://i.postimg.cc/tRkHN8V8/img27.webp",
//       "https://i.postimg.cc/2ycMNRQ6/img28.webp"
//     ],
//     "IsFeatured": true,
//     "Brand": {
//       "Id": "2",
//       "Name": "Enginee",
//       "IsFeatured": true,
//       "ProductsCount": 3,
//       "Image": "https://i.postimg.cc/zvj2Smt7/logo6.png"
//     }
//   },
//   {
//     "CategoryId": "4", // TShirts
//     "SKU": "EngShirt02",
//     "Title": "Engine Striped Shirt",
//     "Price": 2800,
//     "SalePrice": 2500,
//     "Stock": 15,
//     "ProductType": "ProductType.single",
//     "Description": "Elegant striped shirt with a modern cut.",
//     "Thumbnail": "https://i.postimg.cc/nLhdZwL9/img29.webp",
//     "Images": ["https://i.postimg.cc/SxJ2h6hN/img30.webp"],
//     "IsFeatured": true,
//     "Brand": {
//       "Id": "2",
//       "Name": "Enginee",
//       "IsFeatured": true,
//       "ProductsCount": 3,
//       "Image": "https://i.postimg.cc/zvj2Smt7/logo6.png"
//     }
//   },
//   {
//     "CategoryId": "4", // TShirts
//     "SKU": "PumaTee01",
//     "Title": "Puma Essentials Logo Tee",
//     "Price": 3200,
//     "SalePrice": 2800,
//     "Stock": 30,
//     "ProductType": "ProductType.single",
//     "Description": "Bold branding and breathable comfort.",
//     "Thumbnail": "https://i.postimg.cc/Qd9tPjQF/img31.avif",
//     "Images": [
//       "https://i.postimg.cc/9Q7mbJ2T/img32.avif",
//       "https://i.postimg.cc/DytFSLGz/img33.avif"
//     ],
//     "IsFeatured": true,
//     "Brand": {
//       "Id": "3",
//       "Name": "Puma",
//       "IsFeatured": true,
//       "ProductsCount": 4,
//       "Image": "https://i.postimg.cc/wjc8fP1C/logo4.png"
//     }
//   },
//   {
//     "CategoryId": "5", // Pants / Jeans
//     "SKU": "PumaPant01",
//     "Title": "Puma Men’s Track Pants",
//     "Price": 4200,
//     "SalePrice": 3800,
//     "Stock": 15,
//     "ProductType": "ProductType.single",
//     "Description": "Designed for movement and comfort.",
//     "Thumbnail": "https://i.postimg.cc/pVSMSzqB/img34.avif",
//     "Images": [
//       "https://i.postimg.cc/yNsMRP87/img35.avif",
//       "https://i.postimg.cc/0NnL0wzD/img36.avif",
//       "https://i.postimg.cc/tgRXbyPd/img37.avif",
//       "https://i.postimg.cc/gcLGmgw7/img38.avif"
//     ],
//     "IsFeatured": true,
//     "Brand": {
//       "Id": "3",
//       "Name": "Puma",
//       "IsFeatured": true,
//       "ProductsCount": 4,
//       "Image": "https://i.postimg.cc/wjc8fP1C/logo4.png"
//     }
//   },

//   {
//     "CategoryId": "4", // TShirts
//     "SKU": "AdidasTee01",
//     "Title": "Adidas 3-Stripes Tee",
//     "Price": 3000,
//     "SalePrice": 2700,
//     "Stock": 28,
//     "ProductType": "ProductType.single",
//     "Description": "Comfortable tee with iconic 3-stripes.",
//     "Thumbnail": "https://i.postimg.cc/FRdXFKKS/img39.avif",
//     "Images": [
//       "https://i.postimg.cc/MGHhtGVL/img40.avif",
//       "https://i.postimg.cc/4y6MnHRY/img41.avif",
//       "https://i.postimg.cc/s2b0c4VB/img42.avif"
//     ],
//     "IsFeatured": true,
//     "Brand": {
//       "Id": "4",
//       "Name": "Adidas",
//       "IsFeatured": true,
//       "ProductsCount": 4,
//       "Image": "https://i.postimg.cc/VkMLYDdg/logo3.png"
//     }
//   },
//   {
//     "CategoryId": "4", // TShirts
//     "SKU": "NikeTee01",
//     "Title": "Nike Sportswear Club Tee",
//     "Price": 3600,
//     "SalePrice": 3200,
//     "Stock": 24,
//     "ProductType": "ProductType.single",
//     "Description": "Soft cotton tee for all-day comfort.",
//     "Thumbnail": "https://i.postimg.cc/J7NdNXSn/img43.avif",
//     "Images": [
//       "https://i.postimg.cc/50cnv93L/img44.avif",
//       "https://i.postimg.cc/kXjssvsn/img45.avif",
//       "https://i.postimg.cc/sD0P7Dfx/img46.avif"
//     ],
//     "IsFeatured": true,
//     "Brand": {
//       "Id": "5",
//       "Name": "Nike",
//       "IsFeatured": true,
//       "ProductsCount": 4,
//       "Image": "https://i.postimg.cc/fRKWtkfS/logo5.png"
//     }
//   },

//   {
//     "CategoryId": "5", // Pants / Jeans
//     "SKU": "AdidasPant01",
//     "Title": "Adidas Training Pants",
//     "Price": 4000,
//     "SalePrice": 3600,
//     "Stock": 20,
//     "ProductType": "ProductType.single",
//     "Description": "Breathable workout pants for daily use.",
//     "Thumbnail": "https://i.postimg.cc/43vhLJGz/img47.avif",
//     "Images": [
//       "https://i.postimg.cc/7YpGqCY3/img48.avif",
//       "https://i.postimg.cc/hvNj4wgD/img49.avif",
//       "https://i.postimg.cc/j5Fqv9DH/img50.avif"
//     ],
//     "IsFeatured": true,
//     "Brand": {
//       "Id": "4",
//       "Name": "Adidas",
//       "IsFeatured": true,
//       "ProductsCount": 4,
//       "Image": "https://i.postimg.cc/VkMLYDdg/logo3.png"
//     }
//   },

//   {
//     "CategoryId": "6", // Shoes
//     "SKU": "PumaShoe01",
//     "Title": "Puma Smash V2 Sneakers",
//     "Price": 5800,
//     "SalePrice": 5300,
//     "Stock": 20,
//     "ProductType": "ProductType.single",
//     "Description": "Timeless design and daily comfort in one pair.",
//     "Thumbnail": "https://i.postimg.cc/2SDW4bRz/img51.avif",
//     "Images": [
//       "https://i.postimg.cc/QNKKwkj8/img52.avif",
//       "https://i.postimg.cc/3R4WMY5S/img53.webp"
//     ],
//     "IsFeatured": true,
//     "Brand": {
//       "Id": "3",
//       "Name": "Puma",
//       "IsFeatured": true,
//       "ProductsCount": 4,
//       "Image": "https://i.postimg.cc/wjc8fP1C/logo4.png"
//     }
//   },
//   {
//     "CategoryId": "6", // Shoes
//     "SKU": "AdidasShoe01",
//     "Title": "Adidas Duramo SL",
//     "Price": 6800,
//     "SalePrice": 6400,
//     "Stock": 25,
//     "ProductType": "ProductType.single",
//     "Description": "Lightweight and breathable running shoes.",
//     "Thumbnail": "https://i.postimg.cc/HkkYDdbw/img54.avif",
//     "Images": [
//       "https://i.postimg.cc/SND4G3HJ/img55.avif",
//       "https://i.postimg.cc/8CrVN5c6/img56.avif",
//       "https://i.postimg.cc/pL4gGHCX/img57.avif",
//       "https://i.postimg.cc/hjb6t7Bf/img58.avif"
//     ],
//     "IsFeatured": true,
//     "Brand": {
//       "Id": "4",
//       "Name": "Adidas",
//       "IsFeatured": true,
//       "ProductsCount": 4,
//       "Image": "https://i.postimg.cc/VkMLYDdg/logo3.png"
//     }
//   },
//   {
//     "CategoryId": "6", // Shoes
//     "SKU": "NikeShoe01",
//     "Title": "Nike Air Max 270",
//     "Price": 14000,
//     "SalePrice": 13000,
//     "Stock": 20,
//     "ProductType": "ProductType.single",
//     "Description": "Modern design with maximum cushioning and style.",
//     "Thumbnail": "https://i.postimg.cc/8P3KDb6Z/img59.avif",
//     "Images": [
//       "https://i.postimg.cc/B6qNNYrn/img60.avif",
//       "https://i.postimg.cc/Hnnz1JsG/img61.avif",
//       "https://i.postimg.cc/mkPY608B/img62.avif"
//     ],
//     "IsFeatured": true,
//     "Brand": {
//       "Id": "5",
//       "Name": "Nike",
//       "IsFeatured": true,
//       "ProductsCount": 4,
//       "Image": "https://i.postimg.cc/fRKWtkfS/logo5.png"
//     }
//   },

//   {
//     "CategoryId": "5", // Pants / Jeans
//     "SKU": "NikePant01",
//     "Title": "Nike Dri-FIT Training Pants",
//     "Price": 5200,
//     "SalePrice": 4800,
//     "Stock": 18,
//     "ProductType": "ProductType.single",
//     "Description": "Lightweight, sweat-wicking pants for workouts.",
//     "Thumbnail": "https://i.postimg.cc/HLWB9PDs/img63.avif",
//     "Images": [
//       "https://i.postimg.cc/dQCmrKkj/img64.avif",
//       "https://i.postimg.cc/g058LMG7/img65.avif"
//     ],
//     "IsFeatured": true,
//     "Brand": {
//       "Id": "5",
//       "Name": "Nike",
//       "IsFeatured": true,
//       "ProductsCount": 4,
//       "Image": "https://i.postimg.cc/fRKWtkfS/logo5.png"
//     }
//   },
//   {
//     "CategoryId": "8", // Glasses
//     "SKU": "NikeGlasses01",
//     "Title": "Nike Show X3 Sunglasses",
//     "Price": 9500,
//     "SalePrice": 8800,
//     "Stock": 10,
//     "ProductType": "ProductType.single",
//     "Description":
//         "Performance sunglasses designed for sports and sunlight protection.",
//     "Thumbnail": "https://i.postimg.cc/2S9BgHL5/img66.jpg",
//     "Images": [
//       "https://i.postimg.cc/T1xynFFt/img67.jpg",
//       "https://i.postimg.cc/Zqy02Jhf/img68.jpg",
//       "https://i.postimg.cc/xTT8Yv2N/img69.jpg"
//     ],
//     "IsFeatured": true,
//     "Brand": {
//       "Id": "5",
//       "Name": "Nike",
//       "IsFeatured": true,
//       "ProductsCount": 4,
//       "Image": "https://i.postimg.cc/fRKWtkfS/logo5.png"
//     }
//   },
//   {
//     "CategoryId": "7", // Bags
//     "SKU": "PumaBag01",
//     "Title": "Puma Phase Backpack",
//     "Price": 3500,
//     "SalePrice": 3000,
//     "Stock": 12,
//     "ProductType": "ProductType.single",
//     "Description": "Lightweight and stylish for daily use.",
//     "Thumbnail": "https://i.postimg.cc/0yhyphJ7/img70.avif",
//     "Images": [
//       "https://i.postimg.cc/Gh5LC6K6/img71.avif",
//       "https://i.postimg.cc/Y0S7cxWp/img72.avif",
//       "https://i.postimg.cc/7LyyP42t/img73.avif"
//     ],
//     "IsFeatured": true,
//     "Brand": {
//       "Id": "3",
//       "Name": "Puma",
//       "IsFeatured": true,
//       "ProductsCount": 4,
//       "Image": "https://i.postimg.cc/wjc8fP1C/logo4.png"
//     }
//   },

//   {
//     "CategoryId": "7", // Bags
//     "SKU": "AdidasBag01",
//     "Title": "Adidas Classic Backpack",
//     "Price": 3700,
//     "SalePrice": 3300,
//     "Stock": 16,
//     "ProductType": "ProductType.single",
//     "Description": "Functional design with bold branding.",
//     "Thumbnail": "https://i.postimg.cc/43NRH5Wp/img74.avif",
//     "Images": [
//       "https://i.postimg.cc/ZKrGfggr/img75.avif",
//       "https://i.postimg.cc/mgL5mr7s/img76.avif"
//     ],
//     "IsFeatured": true,
//     "Brand": {
//       "Id": "4",
//       "Name": "Adidas",
//       "IsFeatured": true,
//       "ProductsCount": 4,
//       "Image": "https://i.postimg.cc/VkMLYDdg/logo3.png"
//     }
//   },
//   {
//     "CategoryId": "6",
//     "SKU": "SketcherWomen01",
//     "Title": "Skechers Ultra Flex",
//     "Price": 4800,
//     "SalePrice": 4500,
//     "Stock": 18,
//     "ProductType": "ProductType.single",
//     "Description": "Comfortable slip-on shoes for women, great for walking.",
//     "Thumbnail": "https://i.postimg.cc/Wzm5nR3z/img77.png",
//     "Images": [
//       "https://i.postimg.cc/3wP9Qr0W/img78.png",
//       "https://i.postimg.cc/pXqZXJ5w/img79.png",
//       "https://i.postimg.cc/Y9KNyXTW/img80.png"
//     ],
//     "IsFeatured": true,
//     "Brand": {
//       "Id": "6",
//       "Name": "Skechers",
//       "IsFeatured": true,
//       "ProductsCount": 6,
//       "Image": "https://i.postimg.cc/KzmYpBcN/logo2.png"
//     }
//   },
//   {
//     "CategoryId": "6",
//     "SKU": "SketcherWomen02",
//     "Title": "Skechers Go Walk Joy",
//     "Price": 5200,
//     "SalePrice": 4900,
//     "Stock": 22,
//     "ProductType": "ProductType.single",
//     "Description":
//         "Go Walk Joy shoes are engineered for maximum comfort and breathability.",
//     "Thumbnail": "https://i.postimg.cc/XYt9pHjz/img81.png",
//     "Images": [
//       "https://i.postimg.cc/qqB39Wwz/img82.png",
//       "https://i.postimg.cc/Dzq4m7YS/img83.png",
//       "https://i.postimg.cc/yYkJcmb4/img84.png"
//     ],
//     "IsFeatured": false,
//     "Brand": {
//       "Id": "6",
//       "Name": "Skechers",
//       "IsFeatured": true,
//       "ProductsCount": 6,
//       "Image": "https://i.postimg.cc/KzmYpBcN/logo2.png"
//     }
//   },
//   {
//     "CategoryId": "6",
//     "SKU": "SketcherWomen03",
//     "Title": "Skechers D’Lites Women",
//     "Price": 6100,
//     "SalePrice": 5800,
//     "Stock": 10,
//     "ProductType": "ProductType.single",
//     "Description":
//         "Trendy and cushioned, perfect for street style and daily wear.",
//     "Thumbnail": "https://i.postimg.cc/dVGVj4RX/img85.png",
//     "Images": [
//       "https://i.postimg.cc/vB2YZjM1/img86.png",
//       "https://i.postimg.cc/qM3JpjFR/img87.png"
//     ],
//     "IsFeatured": false,
//     "Brand": {
//       "Id": "6",
//       "Name": "Skechers",
//       "IsFeatured": true,
//       "ProductsCount": 6,
//       "Image": "https://i.postimg.cc/KzmYpBcN/logo2.png"
//     }
//   },
//   {
//     "CategoryId": "6",
//     "SKU": "SketcherWomen04",
//     "Title": "Skechers Arch Fit",
//     "Price": 5700,
//     "SalePrice": 5400,
//     "Stock": 14,
//     "ProductType": "ProductType.single",
//     "Description":
//         "Engineered with Arch Fit support for long-term foot comfort.",
//     "Thumbnail": "https://i.postimg.cc/26yYMwvC/img88.png",
//     "Images": [
//       "https://i.postimg.cc/sXMX7yTP/img89.png",
//       "https://i.postimg.cc/sgKDL189/img90.png",
//       "https://i.postimg.cc/VvyYttr1/img91.png"
//     ],
//     "IsFeatured": false,
//     "Brand": {
//       "Id": "6",
//       "Name": "Skechers",
//       "IsFeatured": true,
//       "ProductsCount": 6,
//       "Image": "https://i.postimg.cc/KzmYpBcN/logo2.png"
//     }
//   },
//   {
//     "CategoryId": "6",
//     "SKU": "SketcherWomen05",
//     "Title": "Skechers Max Cushioning Elite",
//     "Price": 6300,
//     "SalePrice": 6000,
//     "Stock": 12,
//     "ProductType": "ProductType.single",
//     "Description": "High-performance cushioning for workouts and long walks.",
//     "Thumbnail": "https://i.postimg.cc/SsKnNc0K/img105.png",
//     "Images": [
//       "https://i.postimg.cc/76QfCbDn/img106.png",
//       "https://i.postimg.cc/GpKBCq5N/img107.png"
//     ],
//     "IsFeatured": true,
//     "Brand": {
//       "Id": "6",
//       "Name": "Skechers",
//       "IsFeatured": true,
//       "ProductsCount": 6,
//       "Image": "https://i.postimg.cc/KzmYpBcN/logo2.png"
//     }
//   },
//   {
//     "CategoryId": "6",
//     "SKU": "HushPupWomen01",
//     "Title": "Hush Puppies Elegant Pumps",
//     "Price": 5200,
//     "SalePrice": 4900,
//     "Stock": 15,
//     "ProductType": "ProductType.single",
//     "Description": "Elegant leather pumps designed for everyday office wear.",
//     "Thumbnail": "https://i.postimg.cc/13Y16F2T/img92.webp",
//     "Images": [
//       "https://i.postimg.cc/XqWR3kBZ/img93.webp",
//       "https://i.postimg.cc/yYVMbnzt/img94.webp",
//       "https://i.postimg.cc/D05MhkKD/img95.webp"
//     ],
//     "IsFeatured": true,
//     "Brand": {
//       "Id": "7",
//       "Name": "Hush Puppies",
//       "IsFeatured": true,
//       "ProductsCount": 8,
//       "Image": "https://i.postimg.cc/KcJ1VqMg/logo1.png"
//     }
//   },
//   {
//     "CategoryId": "6",
//     "SKU": "HushPupWomen02",
//     "Title": "Hush Puppies Ballerina Flats",
//     "Price": 4700,
//     "SalePrice": 4500,
//     "Stock": 20,
//     "ProductType": "ProductType.single",
//     "Description": "Lightweight ballerina flats with cushioned footbed.",
//     "Thumbnail": "https://i.postimg.cc/Gm4SW5g7/img96.webp",
//     "Images": [
//       "https://i.postimg.cc/JhJYnBLj/img97.webp",
//       "https://i.postimg.cc/NMkN8qLM/img98.webp"
//     ],
//     "IsFeatured": true,
//     "Brand": {
//       "Id": "7",
//       "Name": "Hush Puppies",
//       "IsFeatured": true,
//       "ProductsCount": 8,
//       "Image": "https://i.postimg.cc/KcJ1VqMg/logo1.png"
//     }
//   },
//   {
//     "CategoryId": "6",
//     "SKU": "HushPupWomen03",
//     "Title": "Hush Puppies Sporty Sandals",
//     "Price": 5000,
//     "SalePrice": 4700,
//     "Stock": 17,
//     "ProductType": "ProductType.single",
//     "Description": "Adjustable sporty sandals with arch support.",
//     "Thumbnail": "https://i.postimg.cc/jqkHpSVT/img99.webp",
//     "Images": [
//       "https://i.postimg.cc/zf16Tkpx/img100.webp",
//       "https://i.postimg.cc/59GPw328/img101.webp"
//     ],
//     "IsFeatured": false,
//     "Brand": {
//       "Id": "7",
//       "Name": "Hush Puppies",
//       "IsFeatured": true,
//       "ProductsCount": 8,
//       "Image": "https://i.postimg.cc/KcJ1VqMg/logo1.png"
//     }
//   },
//   {
//     "CategoryId": "6",
//     "SKU": "HushPupWomen04",
//     "Title": "Hush Puppies Soft Slip-Ons",
//     "Price": 4900,
//     "SalePrice": 4600,
//     "Stock": 21,
//     "ProductType": "ProductType.single",
//     "Description":
//         "Slip-on shoes with breathable fabric and lightweight design.",
//     "Thumbnail": "https://i.postimg.cc/MZhCWxVk/img102.webp",
//     "Images": [
//       "https://i.postimg.cc/0yvhwfVc/img103.webp",
//       "https://i.postimg.cc/sf9Y24ZV/img104.webp"
//     ],
//     "IsFeatured": true,
//     "Brand": {
//       "Id": "7",
//       "Name": "Hush Puppies",
//       "IsFeatured": true,
//       "ProductsCount": 8,
//       "Image": "https://i.postimg.cc/KcJ1VqMg/logo1.png"
//     }
//   },
// ];

// const categories = [
//   {
//     // "Id": "100",
//     "Name": "Apparel",
//     "Image": "https://i.postimg.cc/kgvmmqvv/524455-200.png",
//     "IsFeatured": true,
//     "ParentId": null
//   },
//   {
//     // "Id": "101",
//     "Name": "Footwear",
//     "Image":
//         "https://i.postimg.cc/ncZf6QLg/sneakers-shoe-computer-icons-clothing-others-removebg-preview.png",
//     "IsFeatured": true,
//     "ParentId": null
//   },
//   {
//     // "Id": "102",
//     "Name": "Accessories",
//     "Image":
//         "https://i.postimg.cc/vHzwMHgB/phones-and-accessories-glyph-icon-smartphone-and-headphones-electronic-devices-e-commerce-department.png",
//     "IsFeatured": true,
//     "ParentId": null
//   },
//   {
//     // "Id": "1",
//     "Name": "T-Shirts & Shirts",
//     "Image": "https://example.com/tshirt.jpg",
//     "IsFeatured": true,
//     "ParentId": "1"
//   },
//   {
//     // "Id": "2",
//     "Name": "Pants & Jeans",
//     "Image": "https://example.com/pants.jpg",
//     "IsFeatured": true,
//     "ParentId": "1"
//   },
//   {
//     // "Id": "3",
//     "Name": "Shoes",
//     "Image": "https://example.com/shoes.jpg",
//     "IsFeatured": true,
//     "ParentId": "2"
//   },
//   {
//     // "Id": "5",
//     "Name": "Bags",
//     "Image": "https://example.com/bags.jpg",
//     "IsFeatured": true,
//     "ParentId": "3"
//   },
//   {
//     // "Id": "8",
//     "Name": "Glasses",
//     "Image": "https://example.com/glasses.jpg",
//     "IsFeatured": true,
//     "ParentId": "3"
//   }
// ];

// const brands = [
//   {
//     "Id": "1",
//     "Name": "Outfitter",
//     "IsFeatured": true,
//     "ProductsCount": 15,
//     "Image": "https://i.postimg.cc/bJL1mzPZ/logo7.jpg"
//   },
//   {
//     "Id": "2",
//     "Name": "Enginee",
//     "IsFeatured": true,
//     "ProductsCount": 3,
//     "Image": "https://i.postimg.cc/zvj2Smt7/logo6.png"
//   },
//   {
//     "Id": "3",
//     "Name": "Puma",
//     "IsFeatured": true,
//     "ProductsCount": 4,
//     "Image":
//         "https://firebasestorage.googleapis.com/v0/b/codingwitht-c6d0f.appspot.com/o/Brands%2FPuma?alt=media&token=1853a8d6-b535-4521-ae7a-5dd7c2444ac8"
//   },
//   {
//     "Id": "4",
//     "Name": "Adidas",
//     "IsFeatured": true,
//     "ProductsCount": 4,
//     "Image":
//         "https://firebasestorage.googleapis.com/v0/b/codingwitht-c6d0f.appspot.com/o/Brands%2FAdidas?alt=media&token=08b948f0-062f-49a2-8285-83ce175e5098"
//   },
//   {
//     "Id": "5",
//     "Name": "Nike",
//     "IsFeatured": true,
//     "ProductsCount": 4,
//     "Image":
//         "https://firebasestorage.googleapis.com/v0/b/codingwitht-c6d0f.appspot.com/o/Brands%2FNike?alt=media&token=875e34d7-e2c8-47b4-83ff-e2bdf05f3013"
//   },
//   {
//     "Id": "6",
//     "Name": "Skechers",
//     "IsFeatured": true,
//     "ProductsCount": 6,
//     "Image": "https://i.postimg.cc/KzmYpBcN/logo2.png"
//   },
//   {
//     "Id": "7",
//     "Name": "Hush Puppies",
//     "IsFeatured": true,
//     "ProductsCount": 8,
//     "Image": "https://i.postimg.cc/KcJ1VqMg/logo1.png"
//   }
// ];

// // const categories = [
// //   {
// //     // "Id": "100",
// //     "Name": "Apparel",
// //     "Image": "https://example.com/apparel.jpg",
// //     "IsFeatured": true,
// //     "ParentId": null
// //   },
// //   {
// //     // "Id": "101",
// //     "Name": "Footwear",
// //     "Image": "https://example.com/footwear.jpg",
// //     "IsFeatured": true,
// //     "ParentId": null
// //   },
// //   {
// //     // "Id": "102",
// //     "Name": "Accessories",
// //     "Image": "https://example.com/accessories.jpg",
// //     "IsFeatured": true,
// //     "ParentId": null
// //   },
// //   {
// //     // "Id": "1",
// //     "Name": "T-Shirts & Shirts",
// //     "Image": "https://example.com/tshirt.jpg",
// //     "IsFeatured": true,
// //     "ParentId": "1"
// //   },
// //   {
// //     // "Id": "2",
// //     "Name": "Pants & Jeans",
// //     "Image": "https://example.com/pants.jpg",
// //     "IsFeatured": true,
// //     "ParentId": "1"
// //   },
// //   {
// //     // "Id": "3",
// //     "Name": "Shoes",
// //     "Image": "https://example.com/shoes.jpg",
// //     "IsFeatured": true,
// //     "ParentId": "2"
// //   },
// //   {
// //     // "Id": "5",
// //     "Name": "Bags",
// //     "Image": "https://example.com/bags.jpg",
// //     "IsFeatured": true,
// //     "ParentId": "3"
// //   },
// //   {
// //     // "Id": "8",
// //     "Name": "Glasses",
// //     "Image": "https://example.com/glasses.jpg",
// //     "IsFeatured": true,
// //     "ParentId": "3"
// //   }
// // ];

// // const brands = [
// //   {
// //     "Id": "1",
// //     "Name": "Outfitter",
// //     "IsFeatured": true,
// //     "ProductsCount": 15,
// //     "Image":
// //         "https://i.pinimg.com/474x/26/e9/9a/26e99ae8c56dd31650a20adbe3db141c.jpg"
// //   },
// //   {
// //     "Id": "2",
// //     "Name": "Enginee",
// //     "IsFeatured": true,
// //     "ProductsCount": 3,
// //     "Image":
// //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQd_cxqzyRBCWNIpA1ynqjUIklsGB93gsw-hQ&s"
// //   },
// //   {
// //     "Id": "3",
// //     "Name": "Puma",
// //     "IsFeatured": true,
// //     "ProductsCount": 4,
// //     "Image":
// //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNOhHZ-0c3De3DFuwuosHkDnJRDwhDb-tLdw&s"
// //   },
// //   {
// //     "Id": "4",
// //     "Name": "Adidas",
// //     "IsFeatured": true,
// //     "ProductsCount": 4,
// //     "Image":
// //         "https://cdn.logojoy.com/wp-content/uploads/20231013154327/Adidas-logo-1991-1-600x319.png"
// //   },
// //   {
// //     "Id": "5",
// //     "Name": "Nike",
// //     "IsFeatured": true,
// //     "ProductsCount": 4,
// //     "Image":
// //         "https://images.seeklogo.com/logo-png/9/1/nike-logo-png_seeklogo-99478.png"
// //   },
// //   {
// //     "Id": "6",
// //     "Name": "Skechers",
// //     "IsFeatured": true,
// //     "ProductsCount": 6,
// //     "Image":
// //         "https://images.seeklogo.com/logo-png/12/1/skechers-logo-png_seeklogo-127487.png"
// //   },
// //   {
// //     "Id": "7",
// //     "Name": "Hush Puppies",
// //     "IsFeatured": true,
// //     "ProductsCount": 8,
// //     "Image":
// //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCqoQZ1AmInl6yTEQ2vI5960Q6sMjITpvccQ&s"
// //   }
// // ];

// const productCategory = [
//   {"productId": "001", "categoryId": "4"},
//   {"productId": "002", "categoryId": "4"},
//   {"productId": "003", "categoryId": "5"},
//   {"productId": "004", "categoryId": "4"},
//   {"productId": "005", "categoryId": "4"},
//   {"productId": "006", "categoryId": "4"},
//   {"productId": "007", "categoryId": "5"},
//   {"productId": "008", "categoryId": "4"},
//   {"productId": "009", "categoryId": "4"},
//   {"productId": "010", "categoryId": "5"},
//   {"productId": "011", "categoryId": "4"},
//   {"productId": "012", "categoryId": "4"},
//   {"productId": "013", "categoryId": "5"},
//   {"productId": "014", "categoryId": "6"},
//   {"productId": "015", "categoryId": "6"},
//   {"productId": "016", "categoryId": "6"},
//   {"productId": "017", "categoryId": "5"},
//   {"productId": "018", "categoryId": "8"},
//   {"productId": "019", "categoryId": "7"},
//   {"productId": "020", "categoryId": "7"},
//   {"productId": "021", "categoryId": "6"},
//   {"productId": "022", "categoryId": "6"},
//   {"productId": "023", "categoryId": "6"},
//   {"productId": "024", "categoryId": "6"},
//   {"productId": "025", "categoryId": "6"},
//   {"productId": "026", "categoryId": "6"},
//   {"productId": "027", "categoryId": "6"},
//   {"productId": "028", "categoryId": "6"},
//   {"productId": "029", "categoryId": "6"},
// ];

// const brandCategory = [
//   {"brandId": "1", "categoryId": "1"},
//   {"brandId": "2", "categoryId": "1"},
//   {"branrdId": "3", "categoryId": "1"},
//   {"brandId": "3", "categoryId": "2"},
//   {"brandId": "3", "categoryId": "2"},
//   {"brandId": "4", "categoryId": "3"},
//   {"brandId": "4", "categoryId": "1"},
//   {"brandId": "4", "categoryId": "3"},
//   {"brandId": "5", "categoryId": "1"},
//   {"brandId": "5", "categoryId": "2"},
//   {"brandId": "5", "categoryId": "2"},
//   {"brandId": "6", "categoryId": "2"},
//   {"brandId": "7", "categoryId": "2"}
// ];

// // {
// //   "CategoryId": "4",
// //   "SKU": "DolceMenChair01",
// //   "Title": "Dolce Gabbana Men's Leather Recliner",
// //   "Price": 90500,
// //   "SalePrice": 80500,
// //   "Stock": 8,
// //   "ProductType": "ProductType.single",
// //   "Description":
// //       "Luxurious leather recliner tailored for men’s comfort and style.",
// //   "Thumbnail":
// //       "https://dolcevitahome.com.pk/media/catalog/product/cache/3866999c95fcda160fd77d054269330d/n/i/niccolo_2.jpg",
// //   "Images": [
// //     "https://dolcevitahome.com.pk/media/catalog/product/cache/3866999c95fcda160fd77d054269330d/p/o/posture_sanse_2.jpg",
// //     "https://dolcevitahome.com.pk/media/catalog/product/cache/3866999c95fcda160fd77d054269330d/c/a/casa_king_2.jpg"
// //   ],
// //   "IsFeatured": true,
// //   "Brand": {
// //     "Id": "9",
// //     "Name": "Dolce Gabbana",
// //     "IsFeatured": true,
// //     "ProductsCount": 2,
// //     "Image":
// //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNyx1ECQ3LsxxITlXkkZ78J7-MfIK4zpHUZg&s"
// //   }
// // },

// // {
// //   "CategoryId": "4",
// //   "SKU": "DGDecor02",
// //   "Title": "Dolce & Gabbana Carretto Mirror",
// //   "Price": 18000,
// //   "SalePrice": 17500,
// //   "Stock": 3,
// //   "ProductType": "ProductType.single",
// //   "Description": "A vibrant mirror featuring the Sicilian Carretto motif.",
// //   "Thumbnail":
// //       "https://luxurylivinggroup.com/cdn/shop/files/dolce-gabbana-casa-sol-mirror-leopardo-2.jpg?v=1708089590&width=1100",
// //   "Images": [
// //     "https://luxurylivinggroup.com/cdn/shop/files/dolce-gabbana-casa-sol-mirror-leopardo.jpg?v=1708089583&width=1100",
// //     "https://luxurylivinggroup.com/cdn/shop/files/dolce-gabbana-casa-sol-mirror-blu-mediterraneo.jpg?v=1708089573&width=1100",
// //     "https://luxurylivinggroup.com/cdn/shop/files/dolce-gabbana-casa-sol-mirror-carretto.jpg?v=1708089563&width=1100"
// //   ],
// //   "IsFeatured": true,
// //   "Brand": {
// //     "Id": "9",
// //     "Name": "Dolce Gabbana",
// //     "IsFeatured": true,
// //     "ProductsCount": 6,
// //     "Image":
// //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNyx1ECQ3LsxxITlXkkZ78J7-MfIK4zpHUZg&s"
// //   }
// // },
// // {
// //   "CategoryId": "4",
// //   "SKU": "DGDecor03",
// //   "Title": "Dolce & Gabbana Ceramic Vase",
// //   "Price": 22000,
// //   "SalePrice": 21000,
// //   "Stock": 5,
// //   "ProductType": "ProductType.single",
// //   "Description": "Hand-painted ceramic vase with floral accents.",
// //   "Thumbnail":
// //       "https://www.dolcegabbana.com/dw/image/v2/BKDB_PRD/on/demandware.static/-/Sites-15/default/dwef59edf6/images/zoom/TCC043TCACX_U0008_0.jpg",
// //   "Images": [
// //     "https://www.dolcegabbana.com/dw/image/v2/BKDB_PRD/on/demandware.static/-/Sites-15/default/dw6aa0b12c/images/zoom/TCC043TCACX_U0042_0.jpg"
// //   ],
// //   "IsFeatured": true,
// //   "Brand": {
// //     "Id": "9",
// //     "Name": "Dolce Gabbana",
// //     "IsFeatured": true,
// //     "ProductsCount": 6,
// //     "Image":
// //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNyx1ECQ3LsxxITlXkkZ78J7-MfIK4zpHUZg&s"
// //   }
// // },
// // {
// //   "CategoryId": "4",
// //   "SKU": "DGDecor04",
// //   "Title": "Dolce & Gabbana Table Lamp",
// //   "Price": 26000,
// //   "SalePrice": 25000,
// //   "Stock": 2,
// //   "ProductType": "ProductType.single",
// //   "Description": "Luxury table lamp with Mediterranean-inspired patterns.",
// //   "Thumbnail":
// //       "https://luxurylivinggroup.com/cdn/shop/files/dolce-gabbana-casa-flora-table-lamp-blu-mediterraneo.jpg?v=1707910703&width=1100",
// //   "Images": [
// //     "https://luxurylivinggroup.com/cdn/shop/files/dolce-gabbana-casa-flora-table-lamp-leopardo.jpg?v=1707910614&width=1100",
// //     "https://luxurylivinggroup.com/cdn/shop/files/dolce-gabbana-casa-flora-table-lamp-leopardo-black.jpg?v=1707910631&width=1100",
// //     "https://luxurylivinggroup.com/cdn/shop/files/dolce-gabbana-casa-flora-table-lamp-carretto.jpg?v=1707910660&width=1100",
// //   ],
// //   "IsFeatured": true,
// //   "Brand": {
// //     "Id": "9",
// //     "Name": "Dolce Gabbana",
// //     "IsFeatured": true,
// //     "ProductsCount": 6,
// //     "Image":
// //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNyx1ECQ3LsxxITlXkkZ78J7-MfIK4zpHUZg&s"
// //   }
// // },
// // {
// //   "CategoryId": "4",
// //   "SKU": "ZaraWomSofa01",
// //   "Title": "Zara Home Women’s Lounge Sofa",
// //   "Price": 55000,
// //   "SalePrice": 50500,
// //   "Stock": 12,
// //   "ProductType": "ProductType.single",
// //   "Description":
// //       "Elegant pink lounge sofa designed for women’s bedroom or vanity corner.",
// //   "Thumbnail":
// //       "https://static.zarahome.net/assets/public/7891/7156/fd5348c9b698/eb54cef609d9/49304073251-p1/49304073251-p1.jpg?ts=1747834034290&f=auto&w=614",
// //   "Images": [
// //     "https://static.zarahome.net/assets/public/40b2/cdab/6a2d4d3aa5f3/0582067c0363/49304073052-p1/49304073052-p1.jpg?ts=1747834037538&f=auto&w=614",
// //     "https://static.zarahome.net/assets/public/f409/21be/e8cd4c24b32b/fa98157b8036/49304073701-p1/49304073701-p1.jpg?ts=1747834031354&f=auto&w=614",
// //     "https://static.zarahome.net/assets/public/b6bb/8ffa/f8e84adb87df/c62c101a887b/49304073922-p1/49304073922-p1.jpg?ts=1747834031035&f=auto&w=614"
// //   ],
// //   "IsFeatured": true,
// //   "Brand": {
// //     "Id": "10",
// //     "Name": "Zara Home",
// //     "IsFeatured": true,
// //     "ProductsCount": 4,
// //     "Image":
// //         "https://play-lh.googleusercontent.com/wvEDsWfdSqdWYxsMC8sn4QsgArnlx4jg-y22XZBiUbsV5l65Ut4jUeeoKFGRcrHSB34"
// //   }
// // },
// // {
// //   "CategoryId": "4",
// //   "SKU": "ZaraDecor02",
// //   "Title": "Zara Home Linen Cushion Cover",
// //   "Price": 2200,
// //   "SalePrice": 1900,
// //   "Stock": 25,
// //   "ProductType": "ProductType.single",
// //   "Description": "Neutral-toned cushion cover for cozy home vibes.",
// //   "Thumbnail":
// //       "https://static.zarahome.net/assets/public/8098/bb8d/e3564c329062/c122bd39ae6b/44383008426-a7/44383008426-a7.jpg?ts=1745582619276&f=auto&w=614",
// //   "Images": [
// //     "https://static.zarahome.net/assets/public/8430/d152/de8a428bb3bf/45ac57dd97fe/44383008712-a7/44383008712-a7.jpg?ts=1745582619089&f=auto&w=614"
// //   ],
// //   "IsFeatured": true,
// //   "Brand": {
// //     "Id": "10",
// //     "Name": "Zara Home",
// //     "IsFeatured": true,
// //     "ProductsCount": 8,
// //     "Image":
// //         "https://play-lh.googleusercontent.com/wvEDsWfdSqdWYxsMC8sn4QsgArnlx4jg-y22XZBiUbsV5l65Ut4jUeeoKFGRcrHSB34"
// //   }
// // },
// // {
// //   "CategoryId": "4",
// //   "SKU": "ZaraDecor03",
// //   "Title": "Zara Home Ceramic Candle Holder",
// //   "Price": 1200,
// //   "SalePrice": 1100,
// //   "Stock": 18,
// //   "ProductType": "ProductType.single",
// //   "Description": "Elegant candle holder to set the perfect evening mood.",
// //   "Thumbnail":
// //       "https://static.zarahome.net/assets/public/d10e/0e0f/ef094a149319/16ce6344465c/41327468800-a7/41327468800-a7.jpg?ts=1739370934475&f=auto&w=1536",
// //   "Images": [
// //     "https://static.zarahome.net//assets/public/0b5b/629e/6ff04a0887a8/825d84fc2317/41327468800-p1/41327468800-p1.jpg?ts=1743765798751&f=auto&w=1536",
// //     "https://static.zarahome.net//assets/public/1a67/d5a1/1488408a906c/e456f8d06fa5/41327468800-a1/41327468800-a1.jpg?ts=1743765797947&f=auto&w=1536"
// //   ],
// //   "IsFeatured": true,
// //   "Brand": {
// //     "Id": "10",
// //     "Name": "Zara Home",
// //     "IsFeatured": true,
// //     "ProductsCount": 8,
// //     "Image":
// //         "https://play-lh.googleusercontent.com/wvEDsWfdSqdWYxsMC8sn4QsgArnlx4jg-y22XZBiUbsV5l65Ut4jUeeoKFGRcrHSB34"
// //   }
// // },
// // {
// //   "CategoryId": "4",
// //   "SKU": "ZaraDecor04",
// //   "Title": "Zara Home Wooden Photo Frame",
// //   "Price": 1700,
// //   "SalePrice": 1600,
// //   "Stock": 30,
// //   "ProductType": "ProductType.single",
// //   "Description": "Rustic wood frame perfect for cherished memories.",
// //   "Thumbnail":
// //       "https://static.zarahome.net//assets/public/0aa0/19e2/ae994c3e8da1/e6c3e166834f/46369043716-a5/46369043716-a5.jpg?ts=1743666249426&f=auto&w=614",
// //   "Images": [
// //     "https://static.zarahome.net//assets/public/4017/d29f/9621494fb802/43a0a3120e08/46369043716-p1/46369043716-p1.jpg?ts=1743666249982&f=auto&w=614",
// //     "https://static.zarahome.net//assets/public/32c2/3b14/e8e040fa8d9e/da611ff8d706/46369043716-a3/46369043716-a3.jpg?ts=1743666249341&f=auto&w=614",
// //     "https://static.zarahome.net/assets/public/8266/ed0e/f09b49edab42/f659335a54bd/46369043716-a7/46369043716-a7.jpg?ts=1743513112128&f=auto&w=614",
// //   ],
// //   "IsFeatured": true,
// //   "Brand": {
// //     "Id": "10",
// //     "Name": "Zara Home",
// //     "IsFeatured": true,
// //     "ProductsCount": 8,
// //     "Image":
// //         "https://play-lh.googleusercontent.com/wvEDsWfdSqdWYxsMC8sn4QsgArnlx4jg-y22XZBiUbsV5l65Ut4jUeeoKFGRcrHSB34"
// //   }
// // },
// // {
// //   "CategoryId": "4",
// //   "SKU": "WestElmMenDesk01",
// //   "Title": "West Elm Men’s Work Desk",
// //   "Price": 29800,
// //   "SalePrice": 24000,
// //   "Stock": 6,
// //   "ProductType": "ProductType.single",
// //   "Description":
// //       "Modern wood-finished desk ideal for men’s home office setups.",
// //   "Thumbnail":
// //       "https://assets.weimgs.com/weimgs/rk/images/wcm/products/202514/0001/mid-century-executive-desk-74-q.jpg",
// //   "Images": [
// //     "https://assets.weimgs.com/weimgs/ab/images/wcm/products/202512/0012/industrial-storage-desk-48-d.jpg",
// //     "https://assets.weimgs.com/weimgs/ab/images/wcm/products/202512/0012/anton-desk-54-o.jpg"
// //   ],
// //   "IsFeatured": true,
// //   "Brand": {
// //     "Id": "11",
// //     "Name": "West Elm",
// //     "IsFeatured": true,
// //     "ProductsCount": 3,
// //     "Image":
// //         "https://seeklogo.com/images/W/west-elm-logo-CFED10906A-seeklogo.com.png"
// //   }
// // },
// // {
// //   "CategoryId": "4",
// //   "SKU": "WE-Decor02",
// //   "Title": "West Elm Marble Wall Clock",
// //   "Price": 8500,
// //   "SalePrice": 8000,
// //   "Stock": 10,
// //   "ProductType": "ProductType.single",
// //   "Description":
// //       "Elegant wall clock with a white marble finish and brass accents.",
// //   "Thumbnail":
// //       "https://www.westelm.com.au/site/WE/Product%20Images/deco-clock-white-marble-d6922-hero-z.jpg?resizeid=54&resizeh=960&resizew=960",
// //   "Images": [
// //     "https://i.pinimg.com/736x/3c/04/e8/3c04e8d4b35c4fe76e1a05f952dede41.jpg",
// //     "https://i.pinimg.com/736x/9a/84/bb/9a84bb9ba714d6a99c61d51c08070a93.jpg"
// //   ],
// //   "IsFeatured": true,
// //   "Brand": {
// //     "Id": "11",
// //     "Name": "West Elm",
// //     "IsFeatured": true,
// //     "ProductsCount": 6,
// //     "Image":
// //         "https://seeklogo.com/images/W/west-elm-logo-CFED10906A-seeklogo.com.png"
// //   }
// // },
// // {
// //   "CategoryId": "4",
// //   "SKU": "WE-Decor03",
// //   "Title": "West Elm Brass Table Frame",
// //   "Price": 3600,
// //   "SalePrice": 3300,
// //   "Stock": 20,
// //   "ProductType": "ProductType.single",
// //   "Description":
// //       "Modern picture frame with a clean brass finish for your table decor.",
// //   "Thumbnail":
// //       "https://assets.weimgs.com/weimgs/rk/images/wcm/products/202508/0003/metal-tabletop-frames-brass-xl.jpg",
// //   "Images": [
// //     "https://assets.weimgs.com/weimgs/rk/images/wcm/products/202518/0004/metal-tabletop-frames-brass-xl.jpg"
// //   ],
// //   "IsFeatured": true,
// //   "Brand": {
// //     "Id": "11",
// //     "Name": "West Elm",
// //     "IsFeatured": true,
// //     "ProductsCount": 6,
// //     "Image":
// //         "https://seeklogo.com/images/W/west-elm-logo-CFED10906A-seeklogo.com.png"
// //   }
// // },
// // {
// //   "CategoryId": "4",
// //   "SKU": "WE-Decor04",
// //   "Title": "West Elm Geometric Metal Sculpture",
// //   "Price": 7400,
// //   "SalePrice": 7000,
// //   "Stock": 7,
// //   "ProductType": "ProductType.single",
// //   "Description":
// //       "Abstract geometric sculpture in matte black – perfect for shelves and tables.",
// //   "Thumbnail": "https://i.ebayimg.com/images/g/F-QAAOSwU4hl5rLE/s-l1600.webp",
// //   "Images": [
// //     "https://i.ebayimg.com/images/g/0MYAAOSwyttl5rLE/s-l1600.webp",
// //     "https://i.ebayimg.com/images/g/nr4AAOSwds9l5rLE/s-l1600.webp"
// //   ],
// //   "IsFeatured": true,
// //   "Brand": {
// //     "Id": "11",
// //     "Name": "West Elm",
// //     "IsFeatured": true,
// //     "ProductsCount": 6,
// //     "Image":
// //         "https://seeklogo.com/images/W/west-elm-logo-CFED10906A-seeklogo.com.png",
// //   }
// // },
// // {
// //   "CategoryId": "4",
// //   "SKU": "IkeaWomVanity01",
// //   "Title": "IKEA Women’s Vanity Table",
// //   "Price": 7200,
// //   "SalePrice": 6900,
// //   "Stock": 9,
// //   "ProductType": "ProductType.single",
// //   "Description":
// //       "Compact and stylish vanity table perfect for women’s grooming needs.",
// //   "Thumbnail":
// //       "https://www.ikea.com/gb/en/images/products/syvde-dressing-table-white__1119463_pe873518_s5.jpg?f=xl",
// //   "Images": [
// //     "https://www.ikea.com/gb/en/images/products/syvde-dressing-table-white__0813681_ph165922_s5.jpg?f=xlg",
// //     "https://www.ikea.com/gb/en/images/products/syvde-dressing-table-white__0747849_pe753575_s5.jpg?f=xl",
// //     "https://www.ikea.com/gb/en/images/products/syvde-dressing-table-white__0747847_pe753573_s5.jpg?f=xl",
// //     "https://www.ikea.com/gb/en/images/products/syvde-dressing-table-white__0813680_ph165917_s5.jpg?f=xl"
// //   ],
// //   "IsFeatured": true,
// //   "Brand": {
// //     "Id": "12",
// //     "Name": "IKEA",
// //     "IsFeatured": true,
// //     "ProductsCount": 4,
// //     "Image":
// //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKrtvnQiTLIYhDaF48OGgzvBknVTd1IEFdlg&s"
// //   }
// // },
// // {
// //   "CategoryId": "4",
// //   "SKU": "IKEA-Decor02",
// //   "Title": "IKEA SINNLIG Scented Candle",
// //   "Price": 600,
// //   "SalePrice": 550,
// //   "Stock": 50,
// //   "ProductType": "ProductType.single",
// //   "Description":
// //       "Sweet vanilla scented candle in glass jar – long lasting fragrance.",
// //   "Thumbnail":
// //       "https://www.ikea.com/au/en/images/products/jaemlik-scented-candle-in-ceramic-jar-vanilla-white__1357171_pe953477_s5.jpg?f=xl",
// //   "Images": [
// //     "https://www.ikea.com/au/en/images/products/jaemlik-scented-candle-in-ceramic-jar-vanilla-white__1079932_pe857782_s5.jpg?f=xl",
// //     "https://www.ikea.com/au/en/images/products/jaemlik-scented-candle-in-ceramic-jar-vanilla-white__1386515_pe963816_s5.jpg?f=xl",
// //     "https://www.ikea.com/au/en/images/products/jaemlik-scented-candle-in-ceramic-jar-vanilla-white__1386505_pe963813_s5.jpg?f=xl"
// //   ],
// //   "IsFeatured": true,
// //   "Brand": {
// //     "Id": "12",
// //     "Name": "IKEA",
// //     "IsFeatured": true,
// //     "ProductsCount": 6,
// //     "Image":
// //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKrtvnQiTLIYhDaF48OGgzvBknVTd1IEFdlg&s"
// //   }
// // },
// // {
// //   "CategoryId": "4",
// //   "SKU": "IKEA-Decor03",
// //   "Title": "IKEA FEJKA Artificial Potted Plant",
// //   "Price": 1400,
// //   "SalePrice": 1300,
// //   "Stock": 40,
// //   "ProductType": "ProductType.single",
// //   "Description":
// //       "Lifelike artificial plant with white pot, adds greenery to any space.",
// //   "Thumbnail":
// //       "https://www.ikea.com/us/en/images/products/fejka-artificial-potted-plant-indoor-outdoor-hanging__0748917_pe745318_s5.jpg?f=xl",
// //   "Images": [
// //     "https://www.ikea.com/us/en/images/products/fejka-artificial-potted-plant-indoor-outdoor-hanging__0748530_pe745055_s5.jpg?f=xl",
// //     "https://www.ikea.com/us/en/images/products/fejka-artificial-potted-plant-indoor-outdoor-hanging__0748531_pe745054_s5.jpg?f=xl",
// //     "https://www.ikea.com/us/en/images/products/fejka-artificial-potted-plant-indoor-outdoor-hanging__0748529_pe745052_s5.jpg?f=xl",
// //     "https://www.ikea.com/us/en/images/products/fejka-artificial-potted-plant-indoor-outdoor-hanging__0901291_pe643381_s5.jpg?f=xl",
// //     "https://www.ikea.com/us/en/images/products/fejka-artificial-potted-plant-indoor-outdoor-hanging__0945937_pe797831_s5.jpg?f=xl"
// //   ],
// //   "IsFeatured": true,
// //   "Brand": {
// //     "Id": "12",
// //     "Name": "IKEA",
// //     "IsFeatured": true,
// //     "ProductsCount": 6,
// //     "Image":
// //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKrtvnQiTLIYhDaF48OGgzvBknVTd1IEFdlg&s"
// //   }
// // },
// // {
// //   "CategoryId": "4",
// //   "SKU": "IKEA-Decor04",
// //   "Title": "IKEA KNOPPÄNG Wall Frame Set",
// //   "Price": 3800,
// //   "SalePrice": 3600,
// //   "Stock": 25,
// //   "ProductType": "ProductType.single",
// //   "Description":
// //       "Set of 8 black photo frames – great for a gallery wall setup.",
// //   "Thumbnail":
// //       "https://www.ikea.com/us/en/images/products/knoppaeng-frame-with-poster-set-of-8-little-things__0995551_pe821746_s5.jpg?f=xl",
// //   "Images": [
// //     "https://www.ikea.com/us/en/images/products/knoppaeng-frame-with-poster-set-of-8-little-things__1036062_pe838290_s5.jpg?f=xl",
// //     "https://www.ikea.com/us/en/images/products/knoppaeng-frame-with-poster-set-of-8-little-things__0902012_pe661072_s5.jpg?f=xl",
// //     "https://www.ikea.com/us/en/images/products/knoppaeng-frame-with-poster-set-of-8-little-things__1300983_pe937226_s5.jpg?f=xl"
// //   ],
// //   "IsFeatured": true,
// //   "Brand": {
// //     "Id": "12",
// //     "Name": "IKEA",
// //     "IsFeatured": true,
// //     "ProductsCount": 6,
// //     "Image":
// //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKrtvnQiTLIYhDaF48OGgzvBknVTd1IEFdlg&s"
// //   }
// // },
// // {
// //   "CategoryId": "1",
// //   "SKU": "UnderTShirt01",
// //   "Title": "Under Armour Sport T-Shirt",
// //   "Price": 2800,
// //   "SalePrice": 2500,
// //   "Stock": 20,
// //   "ProductType": "ProductType.single",
// //   "Description":
// //       "Performance t-shirt for active training with sweat-wicking fabric.",
// //   "Thumbnail":
// //       "https://underarmour.scene7.com/is/image/Underarmour/V5-6004096-001_FC?rp=standard-0pad%7CpdpMainDesktop&scl=1&fmt=jpg&qlt=85&resMode=sharp2&cache=on%2Con&bgc=F0F0F0&wid=566&hei=708&size=566%2C708",
// //   "Images": [
// //     "https://underarmour.scene7.com/is/image/Underarmour/V5-6004096-002_FC?rp=standard-0pad%7CpdpMainDesktop&scl=1&fmt=jpg&qlt=85&resMode=sharp2&cache=on%2Con&bgc=F0F0F0&wid=566&hei=708&size=566%2C708",
// //     "https://underarmour.scene7.com/is/image/Underarmour/V5-6004096-600_FC?rp=standard-0pad%7CpdpMainDesktop&scl=1&fmt=jpg&qlt=85&resMode=sharp2&cache=on%2Con&bgc=F0F0F0&wid=566&hei=708&size=566%2C708",
// //     "https://underarmour.scene7.com/is/image/Underarmour/V5-6004096-290_FC?rp=standard-0pad%7CpdpMainDesktop&scl=1&fmt=jpg&qlt=85&resMode=sharp2&cache=on%2Con&bgc=F0F0F0&wid=566&hei=708&size=566%2C708",
// //     "https://underarmour.scene7.com/is/image/Underarmour/V5-6004096-323_FC?rp=standard-0pad%7CpdpMainDesktop&scl=1&fmt=jpg&qlt=85&resMode=sharp2&cache=on%2Con&bgc=F0F0F0&wid=566&hei=708&size=566%2C708",
// //     "https://underarmour.scene7.com/is/image/Underarmour/V5-6004096-390_FC?rp=standard-0pad%7CpdpMainDesktop&scl=1&fmt=jpg&qlt=85&resMode=sharp2&cache=on%2Con&bgc=F0F0F0&wid=566&hei=708&size=566%2C708",
// //     "https://underarmour.scene7.com/is/image/Underarmour/V5-6004096-400_FC?rp=standard-0pad%7CpdpMainDesktop&scl=1&fmt=jpg&qlt=85&resMode=sharp2&cache=on%2Con&bgc=F0F0F0&wid=566&hei=708&size=566%2C708",
// //     "https://underarmour.scene7.com/is/image/Underarmour/V5-6004096-410_FC?rp=standard-0pad%7CpdpMainDesktop&scl=1&fmt=jpg&qlt=85&resMode=sharp2&cache=on%2Con&bgc=F0F0F0&wid=566&hei=708&size=566%2C708",
// //     "https://underarmour.scene7.com/is/image/Underarmour/V5-6004096-499_FC?rp=standard-0pad%7CpdpMainDesktop&scl=1&fmt=jpg&qlt=85&resMode=sharp2&cache=on%2Con&bgc=F0F0F0&wid=566&hei=708&size=566%2C708"
// //   ],
// //   "IsFeatured": true,
// //   "Brand": {
// //     "Id": "13",
// //     "Name": "Under Armour",
// //     "IsFeatured": true,
// //     "ProductsCount": 12,
// //     "Image":
// //         "https://cdn.dribbble.com/userupload/18384833/file/original-650ea6f90cdfd18d362c355f47b65dea.png?resize=400x300"
// //   }
// // },
// // {
// //   "CategoryId": "2",
// //   "SKU": "UnderPants01",
// //   "Title": "Under Armour Jogger Pants",
// //   "Price": 4200,
// //   "SalePrice": 3800,
// //   "Stock": 15,
// //   "ProductType": "ProductType.single",
// //   "Description":
// //       "Flexible joggers perfect for training and everyday comfort.",
// //   "Thumbnail":
// //       "https://underarmour.scene7.com/is/image/Underarmour/V5-1388823-110_FC?rp=standard-0pad%7CpdpMainDesktop&scl=1&fmt=jpg&qlt=85&resMode=sharp2&cache=on%2Con&bgc=F0F0F0&wid=566&hei=708&size=566%2C708",
// //   "Images": [
// //     "https://underarmour.scene7.com/is/image/Underarmour/V5-1388823-025_FC?rp=standard-0pad%7CpdpMainDesktop&scl=0.72&fmt=jpg&qlt=85&resMode=sharp2&cache=on%2Con&bgc=f0f0f0&wid=1836&hei=1950&size=1500%2C1500",
// //     "https://underarmour.scene7.com/is/image/Underarmour/V5-1388823-348_FC?rp=standard-0pad%7CpdpMainDesktop&scl=1&fmt=jpg&qlt=85&resMode=sharp2&cache=on%2Con&bgc=F0F0F0&wid=566&hei=708&size=566%2C708",
// //     "https://underarmour.scene7.com/is/image/Underarmour/V5-1388823-390_FC?rp=standard-0pad%7CpdpMainDesktop&scl=1&fmt=jpg&qlt=85&resMode=sharp2&cache=on%2Con&bgc=F0F0F0&wid=566&hei=708&size=566%2C708",
// //     "https://underarmour.scene7.com/is/image/Underarmour/6005747-713_SLF_SL?rp=standard-0pad%7CpdpMainDesktop&scl=1&fmt=jpg&qlt=85&resMode=sharp2&cache=on%2Con&bgc=F0F0F0&wid=566&hei=708&size=566%2C708"
// //   ],
// //   "IsFeatured": true,
// //   "Brand": {
// //     "Id": "13",
// //     "Name": "Under Armour",
// //     "IsFeatured": true,
// //     "ProductsCount": 8,
// //     "Image":
// //         "https://cdn.dribbble.com/userupload/18384833/file/original-650ea6f90cdfd18d362c355f47b65dea.png?resize=400x300"
// //   }
// // },
// // {
// //   "CategoryId": "3",
// //   "SKU": "UnderShoes01",
// //   "Title": "Under Armour Running Shoes",
// //   "Price": 8900,
// //   "SalePrice": 8500,
// //   "Stock": 12,
// //   "ProductType": "ProductType.single",
// //   "Description":
// //       "Lightweight, breathable shoes for running and gym training.",
// //   "Thumbnail":
// //       "https://underarmour.scene7.com/is/image/Underarmour/3028254-100_DEFAULT?rp=standard-30pad%7CpdpMainDesktop&scl=1&fmt=jpg&qlt=85&resMode=sharp2&cache=on%2Con&bgc=f0f0f0&wid=566&hei=708&size=536%2C688",
// //   "Images": [
// //     "https://underarmour.scene7.com/is/image/Underarmour/3028254-001_DEFAULT?rp=standard-30pad%7CpdpMainDesktop&scl=1&fmt=jpg&qlt=85&resMode=sharp2&cache=on%2Con&bgc=f0f0f0&wid=566&hei=708&size=536%2C688",
// //     "https://underarmour.scene7.com/is/image/Underarmour/3028254-016_DEFAULT?rp=standard-30pad%7CpdpMainDesktop&scl=1&fmt=jpg&qlt=85&resMode=sharp2&cache=on%2Con&bgc=f0f0f0&wid=566&hei=708&size=536%2C688",
// //     "https://underarmour.scene7.com/is/image/Underarmour/3028254-391_DEFAULT?rp=standard-30pad%7CpdpMainDesktop&scl=1&fmt=jpg&qlt=85&resMode=sharp2&cache=on%2Con&bgc=f0f0f0&wid=566&hei=708&size=536%2C688",
// //     "https://underarmour.scene7.com/is/image/Underarmour/3028254-600_DEFAULT?rp=standard-30pad%7CpdpMainDesktop&scl=1&fmt=jpg&qlt=85&resMode=sharp2&cache=on%2Con&bgc=f0f0f0&wid=566&hei=708&size=536%2C688"
// //   ],
// //   "IsFeatured": true,
// //   "Brand": {
// //     "Id": "13",
// //     "Name": "Under Armour",
// //     "IsFeatured": true,
// //     "ProductsCount": 4,
// //     "Image":
// //         "https://cdn.dribbble.com/userupload/18384833/file/original-650ea6f90cdfd18d362c355f47b65dea.png?resize=400x300"
// //   }
// // },
// // {
// //   "CategoryId": "5",
// //   "SKU": "UnderMenBag01",
// //   "Title": "Under Armour Men’s Gym Sack",
// //   "Price": 3400,
// //   "SalePrice": 3000,
// //   "Stock": 14,
// //   "ProductType": "ProductType.single",
// //   "Description":
// //       "Water-resistant gym sack with drawstring and bold branding.",
// //   "Thumbnail":
// //       "https://underarmour.scene7.com/is/image/Underarmour/6005747-001_SLF_SL",
// //   "Images": [
// //     "https://underarmour.scene7.com/is/image/Underarmour/6005747-100_SLF_SL?rp=standard-0pad%7CpdpMainDesktop&scl=1&fmt=jpg&qlt=85&resMode=sharp2&cache=on%2Con&bgc=F0F0F0&wid=566&hei=708&size=566%2C708",
// //     "https://underarmour.scene7.com/is/image/Underarmour/6005747-418_SLF_SL?rp=standard-0pad%7CpdpMainDesktop&scl=1&fmt=jpg&qlt=85&resMode=sharp2&cache=on%2Con&bgc=F0F0F0&wid=566&hei=708&size=566%2C708",
// //     "https://underarmour.scene7.com/is/image/Underarmour/6005747-587_SLF_SL?rp=standard-0pad%7CpdpMainDesktop&scl=1&fmt=jpg&qlt=85&resMode=sharp2&cache=on%2Con&bgc=F0F0F0&wid=566&hei=708&size=566%2C708",
// //     "https://underarmour.scene7.com/is/image/Underarmour/6005747-713_SLF_SL?rp=standard-0pad%7CpdpMainDesktop&scl=1&fmt=jpg&qlt=85&resMode=sharp2&cache=on%2Con&bgc=F0F0F0&wid=566&hei=708&size=566%2C708"
// //   ],
// //   "IsFeatured": true,
// //   "Brand": {
// //     "Id": "13",
// //     "Name": "Under Armour",
// //     "IsFeatured": true,
// //     "ProductsCount": 7,
// //     "Image":
// //         "https://cdn.dribbble.com/userupload/18384833/file/original-650ea6f90cdfd18d362c355f47b65dea.png?resize=400x300"
// //   }
// // },
// // {
// //   "CategoryId": "1",
// //   "SKU": "ZaraTShirt01",
// //   "Title": "Zara Casual Cotton Tee",
// //   "Price": 2600,
// //   "SalePrice": 2400,
// //   "Stock": 25,
// //   "ProductType": "ProductType.single",
// //   "Description": "Simple and soft cotton t-shirt for daily wear.",
// //   "Thumbnail":
// //       "https://static.zara.net/assets/public/81c5/3615/1cdd45f28e99/01d93d7d9dee/04853415251-p/04853415251-p.jpg?ts=1747229354089&w=1024",
// //   "Images": [
// //     "https://static.zara.net/assets/public/fc13/08b0/91754b77bf6b/cf2234ae1ec4/04853415508-p/04853415508-p.jpg?ts=1747229356635&w=1024",
// //     "https://static.zara.net/assets/public/60f8/0c38/16f4460582a3/8d202a61f23c/09598407691-p/09598407691-p.jpg?ts=1747990214529&w=1024",
// //   ],
// //   "IsFeatured": true,
// //   "Brand": {
// //     "Id": "14",
// //     "Name": "Zara",
// //     "IsFeatured": true,
// //     "ProductsCount": 5,
// //     "Image":
// //         "https://firebasestorage.googleapis.com/v0/b/codingwitht-c6d0f.appspot.com/o/Brands%2FZARA?alt=media&token=98471b33-c09d-4ec6-9fc2-fb53cfc639c3"
// //   }
// // },
// // {
// //   "CategoryId": "4",
// //   "SKU": "ZaraChair01",
// //   "Title": "Zara Modern Wooden Chair",
// //   "Price": 6800,
// //   "SalePrice": 6400,
// //   "Stock": 6,
// //   "ProductType": "ProductType.single",
// //   "Description": "Stylish wooden chair for your living space.",
// //   "Thumbnail":
// //       "https://static.zarahome.net/assets/public/6088/6b37/cde64d7ea242/2b8d904a120b/48391073716-a7/48391073716-a7.jpg?ts=1740037808841&f=auto&w=614",
// //   "Images": [
// //     "https://static.zarahome.net/assets/public/6461/ab97/fca147678439/f5a726d128bb/48391073716-p1/48391073716-p1.jpg?ts=1730307947087&f=auto&w=614",
// //     "https://static.zarahome.net/assets/public/3bf3/351e/94244b568649/aae331712e5d/48391073716-a1/48391073716-a1.jpg?ts=1730307948050&f=auto&w=614",
// //   ],
// //   "IsFeatured": true,
// //   "Brand": {
// //     "Id": "14",
// //     "Name": "Zara",
// //     "IsFeatured": true,
// //     "ProductsCount": 3,
// //     "Image":
// //         "https://firebasestorage.googleapis.com/v0/b/codingwitht-c6d0f.appspot.com/o/Brands%2FZARA?alt=media&token=98471b33-c09d-4ec6-9fc2-fb53cfc639c3"
// //   }
// // },
// // {
// //   "CategoryId": "5",
// //   "SKU": "ZaraWomBag01",
// //   "Title": "Zara Women’s Handbag",
// //   "Price": 4600,
// //   "SalePrice": 4300,
// //   "Stock": 10,
// //   "ProductType": "ProductType.single",
// //   "Description":
// //       "Stylish handbag with dual compartments and premium leather.",
// //   "Thumbnail":
// //       "https://static.zara.net/assets/public/a614/381c/dbd94e15b68f/6334038a42d0/16206510709-e8/16206510709-e8.jpg?ts=1748589848416&w=1126",
// //   "Images": [
// //     "https://static.zara.net/assets/public/8431/4a81/18e64b8089b9/71901f5a05ff/16206510709-e5/16206510709-e5.jpg?ts=1736326032725&w=750",
// //     "https://static.zara.net/assets/public/b5f3/0edc/287d425792c0/fa510c09136c/16206510709-e7/16206510709-e7.jpg?ts=1736326034221&w=750",
// //     "https://static.zara.net/assets/public/491a/2847/42d24b93b2a9/eb25168dbb42/16206510709-e1/16206510709-e1.jpg?ts=1736326032626&w=750"
// //   ],
// //   "IsFeatured": true,
// //   "Brand": {
// //     "Id": "14",
// //     "Name": "Zara",
// //     "IsFeatured": true,
// //     "ProductsCount": 3,
// //     "Image":
// //         "https://firebasestorage.googleapis.com/v0/b/codingwitht-c6d0f.appspot.com/o/Brands%2FZARA?alt=media&token=98471b33-c09d-4ec6-9fc2-fb53cfc639c3"
// //   }
// // },
// // {
// //   "CategoryId": "6",
// //   "SKU": "ZaraWallet01",
// //   "Title": "Zara Men’s Leather Wallet",
// //   "Price": 1900,
// //   "SalePrice": 1700,
// //   "Stock": 18,
// //   "ProductType": "ProductType.single",
// //   "Description": "Compact leather wallet for everyday use.",
// //   "Thumbnail":
// //       "https://static.zara.net/assets/public/e8e0/875f/dbdd4563af56/fee90c3ab529/13800620032-e2/13800620032-e2.jpg?ts=1746518207748&w=1126",
// //   "Images": [
// //     "https://static.zara.net/assets/public/b915/b836/14bd4d698def/e12de4c9f000/13800620032-e3/13800620032-e3.jpg?ts=1746518208859&w=750",
// //     "https://static.zara.net/assets/public/24dc/b5b5/1a02407a9f11/5966c4d7004e/13800620032-e4/13800620032-e4.jpg?ts=1746518208855&w=750",
// //     "https://static.zara.net/assets/public/01a2/e992/de8742a9b126/d7282c8a3d8c/13800620800-e2/13800620800-e2.jpg?ts=1746518210107&w=1126",
// //     "https://static.zara.net/assets/public/783f/e427/c4e04d6789b9/1df42671319e/13800620800-e3/13800620800-e3.jpg?ts=1746518209839&w=750",
// //     "https://static.zara.net/assets/public/52de/d8b9/ceae40a3a4e7/e2f374cd3003/13800620800-e4/13800620800-e4.jpg?ts=1746518210877&w=750"
// //   ],
// //   "IsFeatured": true,
// //   "Brand": {
// //     "Id": "14",
// //     "Name": "Zara",
// //     "IsFeatured": true,
// //     "ProductsCount": 6,
// //     "Image":
// //         "https://firebasestorage.googleapis.com/v0/b/codingwitht-c6d0f.appspot.com/o/Brands%2FZARA?alt=media&token=98471b33-c09d-4ec6-9fc2-fb53cfc639c3"
// //   }
// // },
// // {
// //   "CategoryId": "3",
// //   "SKU": "ReebokMenShoe01",
// //   "Title": "Reebok Classic Sneakers",
// //   "Price": 5500,
// //   "SalePrice": 5000,
// //   "Stock": 17,
// //   "ProductType": "ProductType.single",
// //   "Description": "Comfortable sneakers with timeless design.",
// //   "Thumbnail":
// //       "https://cdn.shopify.com/s/files/1/0862/7834/0912/files/100209552_FLT_eCom-tif.png?v=1734098191&width=800",
// //   "Images": [
// //     "https://cdn.shopify.com/s/files/1/0862/7834/0912/files/100009274_FLT_eCom-tif.png?v=1734089324&width=800",
// //     "https://cdn.shopify.com/s/files/1/0862/7834/0912/files/100009275_FLT_eCom-tif.png?v=1734089325&width=800",
// //     "https://cdn.shopify.com/s/files/1/0862/7834/0912/files/100033377_FLT_eCom-tif.png?v=1734089780&width=800",
// //     "https://cdn.shopify.com/s/files/1/0862/7834/0912/files/100009274_FLT_eCom-tif.png?v=1734089324"
// //   ],
// //   "IsFeatured": true,
// //   "Brand": {
// //     "Id": "15",
// //     "Name": "Reebok",
// //     "IsFeatured": true,
// //     "ProductsCount": 3,
// //     "Image":
// //         "https://mir-s3-cdn-cf.behance.net/project_modules/1400/d56c1698226919.5ed781fc9d1ce.jpg"
// //   }
// // },
// // {
// //   "CategoryId": "2",
// //   "SKU": "ReebokTrackPant01",
// //   "Title": "Reebok Track Pants",
// //   "Price": 3400,
// //   "SalePrice": 3100,
// //   "Stock": 10,
// //   "ProductType": "ProductType.single",
// //   "Description": "High-performance track pants for workouts.",
// //   "Thumbnail":
// //       "https://cdn.shopify.com/s/files/1/0862/7834/0912/files/100038336_F_Model_eCom-tif.png?v=1734090457&width=800",
// //   "Images": [
// //     "https://cdn.shopify.com/s/files/1/0862/7834/0912/files/100038336_D1_Model_eCom-tif.png?v=1734090458&width=800",
// //     "https://cdn.shopify.com/s/files/1/0862/7834/0912/files/100042384_F_Model_eCom-tif.png?v=1734090601&width=800",
// //     "https://cdn.shopify.com/s/files/1/0862/7834/0912/files/100042384_D1_Model_eCom-tif.png?v=1734090603&width=800"
// //   ],
// //   "IsFeatured": true,
// //   "Brand": {
// //     "Id": "15",
// //     "Name": "Reebok",
// //     "IsFeatured": true,
// //     "ProductsCount": 4,
// //     "Image":
// //         "https://mir-s3-cdn-cf.behance.net/project_modules/1400/d56c1698226919.5ed781fc9d1ce.jpg"
// //   }
// // },
// // {
// //   "CategoryId": "5",
// //   "SKU": "ReebokMenBag01",
// //   "Title": "Reebok Men's Sports Backpack",
// //   "Price": 4900,
// //   "SalePrice": 4500,
// //   "Stock": 12,
// //   "ProductType": "ProductType.single",
// //   "Description": "A Versatile Backpack with a Laptop Sleeve",
// //   "Thumbnail":
// //       "https://cdn.shopify.com/s/files/1/0862/7834/0912/files/100245899_FR_eCom-tif.png?v=1736268441&width=800",
// //   "Images": [
// //     "https://cdn.shopify.com/s/files/1/0862/7834/0912/files/100245900_FR_eCom-tif.png?v=1736268442",
// //     "https://cdn.shopify.com/s/files/1/0862/7834/0912/files/100245901_FR_eCom-tif.png?v=1736268445&width=800",
// //   ],
// //   "IsFeatured": true,
// //   "Brand": {
// //     "Id": "15",
// //     "Name": "Reebok",
// //     "IsFeatured": true,
// //     "ProductsCount": 8,
// //     "Image":
// //         "https://mir-s3-cdn-cf.behance.net/project_modules/1400/d56c1698226919.5ed781fc9d1ce.jpg"
// //   }
// // },
// // {
// //   "CategoryId": "7",
// //   "SKU": "ReebokWatch01",
// //   "Title": "Reebok Sports Watch",
// //   "Price": 6100,
// //   "SalePrice": 5800,
// //   "Stock": 8,
// //   "ProductType": "ProductType.single",
// //   "Description": "Digital watch with stopwatch and waterproof features.",
// //   "Thumbnail":
// //       "https://www.mymarcostore.com/image/cache/catalog/Campaign/Fathers%20day%202023/82XKfjSg1658204914-1200x1200-1100x1100fit_75c8f6d4.jpg",
// //   "Images": [
// //     "https://www.mymarcostore.com/image/cache/catalog/RELAY/BLK/Slide6-1100x1100fit_75c8f6d4.JPG",
// //     "https://www.mymarcostore.com/image/cache/catalog/RELAY/BLK/Slide1-1100x1100fit_75c8f6d4.JPG",
// //     "https://www.mymarcostore.com/image/cache/catalog/2114//Reebok%20Watch%20Box-1100x1100fit_75c8f6d4.jpg"
// //   ],
// //   "IsFeatured": true,
// //   "Brand": {
// //     "Id": "15",
// //     "Name": "Reebok",
// //     "IsFeatured": true,
// //     "ProductsCount": 12,
// //     "Image":
// //         "https://mir-s3-cdn-cf.behance.net/project_modules/1400/d56c1698226919.5ed781fc9d1ce.jpg"
// //   }
// // },
// // {
// //   "CategoryId": "5",
// //   "SKU": "ReebokMenBag01",
// //   "Title": "Reebok Men's Sports Backpack",
// //   "Price": 3900,
// //   "SalePrice": 3600,
// //   "Stock": 12,
// //   "ProductType": "ProductType.single",
// //   "Description": "Ergonomic backpack designed for sportsmen and travelers.",
// //   "Thumbnail":
// //       "https://cdn.shopify.com/s/files/1/0862/7834/0912/files/100245912_FR_eCom-tif.png?v=1736268450&width=800",
// //   "Images": [
// //     "https://cdn.shopify.com/s/files/1/0862/7834/0912/files/100245912_B_eCom-tif.png?v=1736268450&width=800",
// //     "https://cdn.shopify.com/s/files/1/0862/7834/0912/files/100245913_FR_eCom-tif.png?v=1736268451&width=800",
// //     "https://cdn.shopify.com/s/files/1/0862/7834/0912/files/100245913_B_eCom-tif.png?v=1736268451&width=800"
// //   ],
// //   "IsFeatured": true,
// //   "Brand": {
// //     "Id": "15",
// //     "Name": "Reebok",
// //     "IsFeatured": true,
// //     "ProductsCount": 6,
// //     "Image":
// //         "https://mir-s3-cdn-cf.behance.net/project_modules/1400/d56c1698226919.5ed781fc9d1ce.jpg"
// //   }
// // },
// // {
// //   "CategoryId": "5",
// //   "SKU": "MichaelKorsWomBag01",
// //   "Title": "Michael Kors Women's Tote",
// //   "Price": 39000,
// //   "SalePrice": 34000,
// //   "Stock": 7,
// //   "ProductType": "ProductType.single",
// //   "Description":
// //       "Elegant tote bag for women, ideal for formal and casual outings.",
// //   "Thumbnail":
// //       "https://i.postimg.cc/7Lmyw8g9/30-F4-STBT7-L-0674-1-removebg-preview.png",
// //   "Images": [
// //     "https://i.postimg.cc/GtS837V0/30-F4-STBT7-L-2198-1-removebg-preview.png",
// //     "https://i.postimg.cc/wvgswsLr/30-F4-STBT7-L-0001-1-removebg-preview.png",
// //     "https://i.postimg.cc/TYBxbbyh/30-F4-STBT7-L-0001-3-removebg-preview.png"
// //   ],
// //   "IsFeatured": true,
// //   "Brand": {
// //     "Id": "16",
// //     "Name": "Michael Kors",
// //     "IsFeatured": true,
// //     "ProductsCount": 5,
// //     "Image":
// //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWYXRuY0oW6eQUqwAYuIoP5NnEdZUrG5xMXw&s"
// //   }
// // },
// // {
// //   "CategoryId": "8",
// //   "SKU": "MichaelGlasses01",
// //   "Title": "Michael Kors Designer Glasses",
// //   "Price": 4700,
// //   "SalePrice": 4400,
// //   "Stock": 6,
// //   "ProductType": "ProductType.single",
// //   "Description": "Sleek glasses with premium lens and frame.",
// //   "Thumbnail": "https://i.postimg.cc/0yjTxqVw/MK-2197-U-0001-1.jpg",
// //   "Images": [
// //     "https://i.postimg.cc/QdFywJMg/MK-2197-U-0255-1.jpg",
// //     "https://i.postimg.cc/C1sPkvv0/MK-2197-U-0303-1.jpg",
// //     "https://i.postimg.cc/MTqt67zF/MK-2197-U-0303-2.jpg"
// //   ],
// //   "IsFeatured": true,
// //   "Brand": {
// //     "Id": "16",
// //     "Name": "Michael Kors",
// //     "IsFeatured": true,
// //     "ProductsCount": 9,
// //     "Image":
// //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWYXRuY0oW6eQUqwAYuIoP5NnEdZUrG5xMXw&s"
// //   }
// // },
// // {
// //   "CategoryId": "6",
// //   "SKU": "MichaelWallet01",
// //   "Title": "Michael Kors Leather Wallet",
// //   "Price": 82000,
// //   "SalePrice": 77000,
// //   "Stock": 9,
// //   "ProductType": "ProductType.single",
// //   "Description": "Elegant leather wallet for women.",
// //   "Thumbnail": "https://i.postimg.cc/jSSsGgMC/32-F4-GY5-E8-L-0410-1.jpg",
// //   "Images": [
// //     "https://i.postimg.cc/2Sv1Lr5R/32-F4-GY5-E8-L-6786-1.jpg",
// //     "https://i.postimg.cc/vBfMWpZ2/32-F4-GY5-E8-L-0230-1.jpg",
// //     "https://i.postimg.cc/KjFNwJs4/32-F4-GY5-E8-L-3300-1.jpg"
// //   ],
// //   "IsFeatured": true,
// //   "Brand": {
// //     "Id": "16",
// //     "Name": "Michael Kors",
// //     "IsFeatured": true,
// //     "ProductsCount": 3,
// //     "Image":
// //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWYXRuY0oW6eQUqwAYuIoP5NnEdZUrG5xMXw&s"
// //   }
// // },
// // {
// //   "CategoryId": "7",
// //   "SKU": "MichaelWatch01",
// //   "Title": "Michael Kors Gold Watch",
// //   "Price": 164000,
// //   "SalePrice": 150000,
// //   "Stock": 5,
// //   "ProductType": "ProductType.single",
// //   "Description": "Luxury gold-tone watch with crystal accents.",
// //   "Thumbnail": "https://i.postimg.cc/4xHLgjqg/MK9153-0710-1.jpg",
// //   "Images": [
// //     "https://i.postimg.cc/prdC1Sz3/MK9153-0710-2.jpg",
// //     "https://i.postimg.cc/d1sjLfHD/MK9153-0710-3.jpg",
// //     "https://i.postimg.cc/3J4C4mBj/MK9153-0710-5.jpg"
// //   ],
// //   "IsFeatured": true,
// //   "Brand": {
// //     "Id": "16",
// //     "Name": "Michael Kors",
// //     "IsFeatured": true,
// //     "ProductsCount": 2,
// //     "Image":
// //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWYXRuY0oW6eQUqwAYuIoP5NnEdZUrG5xMXw&s"
// //   }
// // },
// // {
// //   "CategoryId": "8",
// //   "SKU": "FossilGlasses01",
// //   "Title": "Fossil Unisex Designer Glasses",
// //   "Price": 7999,
// //   "SalePrice": 7499,
// //   "Stock": 25,
// //   "ProductType": "ProductType.single",
// //   "Description": "Trendy unisex glasses with anti-glare coating.",
// //   "Thumbnail": "https://i.postimg.cc/jdY2VBXM/FOS3171-R80-IR-1.webp",
// //   "Images": [
// //     "https://i.postimg.cc/m2Z7SZ4W/FOS3171-R80-IR-main.webp",
// //     "https://i.postimg.cc/52Tv1wCf/FOS3136-GS3-YG-1.webp",
// //     "https://i.postimg.cc/gjzL4sfH/FOS3136-GS3-YG-main.webp"
// //   ],
// //   "IsFeatured": true,
// //   "Brand": {
// //     "Id": "17",
// //     "Name": "Fossil",
// //     "ProductsCount": 11,
// //     "Image":
// //         "https://1000logos.net/wp-content/uploads/2020/09/Fossil-Logo.jpg"
// //   }
// // },
// // {
// //   "CategoryId": "2",
// //   "SKU": "FossilPants01",
// //   "Title": "Fossil Casual Men’s Jeans",
// //   "Price": 4999,
// //   "SalePrice": 4599,
// //   "Stock": 30,
// //   "ProductType": "ProductType.single",
// //   "Description": "Slim-fit denim jeans with stretchable fabric.",
// //   "Thumbnail": "https://i.ebayimg.com/images/g/g08AAOSweYRm44Lm/s-l1600.webp",
// //   "Images": [
// //     "https://i.ebayimg.com/images/g/qKsAAOSwjJlm44MK/s-l1600.webp",
// //     "https://i.ebayimg.com/images/g/5P4AAOSwxXdm44Mp/s-l1600.webp"
// //   ],
// //   "IsFeatured": false,
// //   "Brand": {
// //     "Id": "17",
// //     "Name": "Fossil",
// //     "ProductsCount": 8,
// //     "Image":
// //         "https://1000logos.net/wp-content/uploads/2020/09/Fossil-Logo.jpg"
// //   }
// // },
// // {
// //   "CategoryId": "1",
// //   "SKU": "FossilShirt01",
// //   "Title": "Fossil Men’s Printed T-Shirt",
// //   "Price": 2999,
// //   "SalePrice": 2599,
// //   "Stock": 35,
// //   "ProductType": "ProductType.single",
// //   "Description": "Cotton printed T-shirt for men.",
// //   "Thumbnail":
// //       "https://www.dunhill.com/product_image/12250650am/f/w1125_be4e4e4.jpg",
// //   "Images": [
// //     "https://www.dunhill.com/product_image/12250650am/r/w1125_be4e4e4.jpg",
// //     "https://www.dunhill.com/product_image/12250650am/e/w1125_be4e4e4.jpg"
// //   ],
// //   "IsFeatured": false,
// //   "Brand": {
// //     "Id": "17",
// //     "Name": "Fossil",
// //     "ProductsCount": 11,
// //     "Image":
// //         "https://1000logos.net/wp-content/uploads/2020/09/Fossil-Logo.jpg"
// //   }
// // },
// // {
// //   "CategoryId": "6",
// //   "SKU": "FossilWallet01",
// //   "Title": "Fossil Leather Men's Wallet",
// //   "Price": 9999,
// //   "SalePrice": 9499,
// //   "Stock": 20,
// //   "ProductType": "ProductType.single",
// //   "Description": "Classic brown leather wallet with multiple compartments.",
// //   "Thumbnail":
// //       "https://png.pngtree.com/png-clipart/20220124/ourmid/pngtree-black-leather-wallet-pattern-png-image_4256742.png",
// //   "Images": [
// //     "https://png.pngtree.com/png-vector/20210424/ourmid/pngtree-leather-wallet-portable-fashion-png-image_3238803.jpg",
// //     "https://w7.pngwing.com/pngs/291/534/png-transparent-wallet-jd-com-leather-bag-online-shopping-men-s-wallet-brand-zipper-png-material-mens.png",
// //     "https://www.pngplay.com/wp-content/uploads/9/Leather-Wallet-No-Background.png",
// //     "https://m.media-amazon.com/images/I/61p5DAqwW7L._AC_UY300_.jpg",
// //     "https://graficsea.com/wp-content/uploads/2022/02/Men-Leather-Purse.jpg",
// //     "https://png.pngtree.com/png-clipart/20220124/ourmid/pngtree-black-leather-wallet-pattern-png-image_4256742.png",
// //     "https://images.meesho.com/images/products/515534553/cthwf_512.jpg"
// //   ],
// //   "IsFeatured": true,
// //   "Brand": {
// //     "Id": "17",
// //     "Name": "Fossil",
// //     "ProductsCount": 7,
// //     "Image":
// //         "https://1000logos.net/wp-content/uploads/2020/09/Fossil-Logo.jpg"
// //   }
// // },
// // {
// //   "CategoryId": "8",
// //   "SKU": "DWGlasses01",
// //   "Title": "Daniel Wellington Stylish Glasses",
// //   "Price": 10500,
// //   "SalePrice": 9799,
// //   "Stock": 10,
// //   "ProductType": "ProductType.single",
// //   "Description": "Elegant glasses with slim metal frame.",
// //   "Thumbnail":
// //       "https://www.danielwellington.com/cdn/shop/files/c545531e554a20f9c9518a25d432296353238450.png?v=1692343182&width=1500",
// //   "Images": [
// //     "https://www.danielwellington.com/cdn/shop/products/013c3d03c8884e4ce514967bf2882eb653434a53.png?v=1692343182&width=1500",
// //     "https://www.danielwellington.com/cdn/shop/products/bhe4frois4zwcoreav26.png?v=1681157240",
// //     "https://www.danielwellington.com/cdn/shop/products/vceswzg4uf80nth7nzpr.png?v=1681157240"
// //   ],
// //   "IsFeatured": false,
// //   "Brand": {
// //     "Id": "18",
// //     "Name": "Daniel Wellington",
// //     "ProductsCount": 4,
// //     "Image":
// //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxHRN3Jxz6fp4TBQ5dytafKWatsPHQBZLyKA&s"
// //   }
// // },
// // {
// //   "CategoryId": "6",
// //   "SKU": "DWWallet01",
// //   "Title": "DW Leather Wallet",
// //   "Price": 8999,
// //   "SalePrice": 8499,
// //   "Stock": 14,
// //   "ProductType": "ProductType.single",
// //   "Description": "Minimalist black wallet with card slots.",
// //   "Thumbnail":
// //       "https://www.danielwellington.com/cdn/shop/files/ko3ohyhq4ldmgtt7hjo8.png?v=1693229228",
// //   "Images": [
// //     "https://www.danielwellington.com/cdn/shop/files/kmonifevgkzrt3imse4z.png?v=1695036068",
// //     "https://www.danielwellington.com/cdn/shop/files/drelyw3xnllwy0m4wt9v.png?v=1693229180",
// //     "https://www.danielwellington.com/cdn/shop/files/l3hu3flcy75f380dvtvz.png?v=1693229204",
// //     "https://www.danielwellington.com/cdn/shop/files/qydcbqcqzqbhje89eob0.png?v=1695036080"
// //   ],
// //   "IsFeatured": true,
// //   "Brand": {
// //     "Id": "18",
// //     "Name": "Daniel Wellington",
// //     "ProductsCount": 3,
// //     "Image":
// //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxHRN3Jxz6fp4TBQ5dytafKWatsPHQBZLyKA&s"
// //   }
// // },
// // {
// //   "CategoryId": "3",
// //   "SKU": "DWShoes01",
// //   "Title": "Daniel Wellington Casual Shoes",
// //   "Price": 15499,
// //   "SalePrice": 14499,
// //   "Stock": 12,
// //   "ProductType": "ProductType.single",
// //   "Description": "Comfortable shoes for everyday wear.",
// //   "Thumbnail":
// //       "https://i.pinimg.com/736x/4e/5d/b6/4e5db672b083e160a4e9af4c6ce795a5.jpg",
// //   "Images": [
// //     "https://i.pinimg.com/736x/02/9f/53/029f5311cffc308a9812cec2b8e6963e.jpg",
// //     "https://i.pinimg.com/736x/e6/c3/2b/e6c32ba4b4d45ec272c048f8459aceaf.jpg"
// //   ],
// //   "IsFeatured": false,
// //   "Brand": {
// //     "Id": "18",
// //     "Name": "Daniel Wellington",
// //     "ProductsCount": 6,
// //     "Image":
// //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxHRN3Jxz6fp4TBQ5dytafKWatsPHQBZLyKA&s"
// //   }
// // },
// // {
// //   "CategoryId": "7",
// //   "SKU": "DWWatch01",
// //   "Title": "Daniel Wellington Women’s Watch",
// //   "Price": 61999,
// //   "SalePrice": 53999,
// //   "Stock": 15,
// //   "ProductType": "ProductType.single",
// //   "Description":
// //       "Elegant minimalist watch for women with a rose gold finish.",
// //   "Thumbnail":
// //       "https://www.lifestyle-collection.com.pk/wp-content/uploads/2022/09/DW00100464-1.jpg",
// //   "Images": [
// //     "https://www.lifestyle-collection.com.pk/wp-content/uploads/2022/09/DW00100464-2.jpg",
// //     "https://www.lifestyle-collection.com.pk/wp-content/uploads/2022/09/DW00100464-3.jpg",
// //     "https://www.lifestyle-collection.com.pk/wp-content/uploads/2022/01/DW00100161-1.jpg"
// //   ],
// //   "IsFeatured": true,
// //   "Brand": {
// //     "Id": "18",
// //     "Name": "Daniel Wellington",
// //     "ProductsCount": 4,
// //     "Image":
// //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxHRN3Jxz6fp4TBQ5dytafKWatsPHQBZLyKA&s"
// //   }
// // },
// // {
// //   "CategoryId": "8",
// //   "SKU": "CasioGlasses01",
// //   "Title": "Casio Blue Light Glasses",
// //   "Price": 5499,
// //   "SalePrice": 4999,
// //   "Stock": 18,
// //   "ProductType": "ProductType.single",
// //   "Description": "Blue light blocking glasses for screen time.",
// //   "Thumbnail":
// //       "https://img01.ztat.net/article/spp-media-p1/6d5db874cd304b56abe46d142deb60e9/47ed86e144b24276b9f22b0e303683bb.jpg?imwidth=762&filter=packshot",
// //   "Images": [
// //     "https://img01.ztat.net/article/spp-media-p1/08ce9c649dc2426e9e3dd42c8350e7b7/86c0a811990b48a2ac2c8351a4dd19f8.jpg?imwidth=400",
// //     "https://img01.ztat.net/article/spp-media-p1/2c39f10b273f44a29ab9e86fc6588c47/7f6de0e1ea924aee9f52d2bf1f0db566.jpg?imwidth=400"
// //   ],
// //   "IsFeatured": true,
// //   "Brand": {
// //     "Id": "19",
// //     "Name": "Casio",
// //     "ProductsCount": 5,
// //     "Image":
// //         "https://i.pinimg.com/736x/46/84/29/468429100be13d7e6390685ae9d0c446.jpg"
// //   }
// // },
// // {
// //   "CategoryId": "6",
// //   "SKU": "CasioWallet01",
// //   "Title": "Casio Men's Fold Wallet",
// //   "Price": 5999,
// //   "SalePrice": 5699,
// //   "Stock": 15,
// //   "ProductType": "ProductType.single",
// //   "Description": "Durable synthetic wallet with multiple compartments.",
// //   "Thumbnail":
// //       "https://img01.ztat.net/article/spp-media-p1/bcde073b48664446bdfc4465d2402290/5897099bc97b4eb68960f5727734c947.jpg?imwidth=762&filter=packshot",
// //   "Images": [
// //     "https://img01.ztat.net/article/spp-media-p1/b6b50a1cb2af4241868d89da7230cbd1/1bed9c1bec2c4fa8afb34efd69289737.jpg?imwidth=400",
// //     "https://img01.ztat.net/article/spp-media-p1/fca18f0744e3440ebb918d2b276c81c6/4322b94f560344a883139764de6309c3.jpg?imwidth=762&filter=packshot",
// //     "https://img01.ztat.net/article/spp-media-p1/8408047656474e67a0710386b70d3934/b39db6fe9e5c453b873a67b3a7c63645.jpg?imwidth=400"
// //   ],
// //   "IsFeatured": false,
// //   "Brand": {
// //     "Id": "19",
// //     "Name": "Casio",
// //     "ProductsCount": 3,
// //     "Image":
// //         "https://i.pinimg.com/736x/46/84/29/468429100be13d7e6390685ae9d0c446.jpg"
// //   }
// // },
// // {
// //   "CategoryId": "1",
// //   "SKU": "CasioShirt01",
// //   "Title": "Casio Graphic Tee",
// //   "Price": 3499,
// //   "SalePrice": 3199,
// //   "Stock": 25,
// //   "ProductType": "ProductType.single",
// //   "Description": "Casual cotton tee with retro Casio graphic print.",
// //   "Thumbnail":
// //       "https://www.casio.com/content/dam/casio/product-info/locales/sg/en/timepiece/product/other/t/tu/tup/tup-bc25121-whm/assets/TUP-BC25121-WHM_7.jpg.transform/main-visual-pc/image.jpg",
// //   "Images": [
// //     "https://www.casio.com/content/dam/casio/product-info/locales/sg/en/timepiece/product/other/t/tu/tup/tup-bc25121-whm/assets/TUP-BC25121-WHM_4.png.transform/main-visual-pc/image.png",
// //     "https://www.casio.com/content/dam/casio/product-info/locales/sg/en/timepiece/product/other/t/tu/tup/tup-bc25121-bkm/assets/TUP-BC25121-BKM_7.jpg.transform/main-visual-pc/image.jpg",
// //     "https://www.casio.com/content/dam/casio/product-info/locales/sg/en/timepiece/product/other/t/tu/tup/tup-bc25121-bkm/assets/TUP-BC25121-BKM_4.png.transform/main-visual-pc/image.png"
// //   ],
// //   "IsFeatured": false,
// //   "Brand": {
// //     "Id": "19",
// //     "Name": "Casio",
// //     "ProductsCount": 2,
// //     "Image":
// //         "https://i.pinimg.com/736x/46/84/29/468429100be13d7e6390685ae9d0c446.jpg"
// //   }
// // },
// // {
// //   "CategoryId": "7",
// //   "SKU": "CasioWatch01",
// //   "Title": "Casio G-Shock Sports Watch",
// //   "Price": 29000,
// //   "SalePrice": 26000,
// //   "Stock": 18,
// //   "ProductType": "ProductType.single",
// //   "Description": "Rugged waterproof watch for men with digital display.",
// //   "Thumbnail":
// //       "https://www.casio.com/content/dam/casio/product-info/locales/us/en/timepiece/product/watch/D/DW/dwh/dw-h5600mb-8a9/assets/DW-H5600MB-8A9_front.jpg.transform/main-visual-pc/image.jpg",
// //   "Images": [
// //     "https://www.casio.com/content/dam/casio/product-info/locales/us/en/timepiece/product/watch/D/DW/dwh/dw-h5600mb-1a4/assets/DW-H5600MB-1A4.png.transform/main-visual-pc/image.png",
// //     "https://www.casio.com/content/dam/casio/product-info/locales/us/en/timepiece/product/watch/D/DW/dwh/dw-h5600-7/assets/DW-H5600-7.png.transform/main-visual-pc/image.png",
// //     "https://www.casio.com/content/dam/casio/product-info/locales/us/en/timepiece/product/watch/D/DW/dwh/dw-h5600mb-2/assets/DW-H5600MB-2.png.transform/main-visual-pc/image.png"
// //   ],
// //   "IsFeatured": true,
// //   "Brand": {
// //     "Id": "19",
// //     "Name": "Casio",
// //     "ProductsCount": 5,
// //     "Image":
// //         "https://i.pinimg.com/736x/46/84/29/468429100be13d7e6390685ae9d0c446.jpg"
// //   }
// // },
// // {
// //   "CategoryId": "8",
// //   "SKU": "GuessGlasses01",
// //   "Title": "Guess Women’s Sunglasses",
// //   "Price": 4200,
// //   "SalePrice": 3900,
// //   "Stock": 22,
// //   "ProductType": "ProductType.single",
// //   "Description": "Stylish oversized sunglasses with UV protection.",
// //   "Thumbnail":
// //       "https://img.guess.com/image/upload/f_auto,q_auto,fl_strip_profile,w_800,c_scale/v1/NA/Style/ECOMM/GU00193-28F-ALT2",
// //   "Images": [
// //     "https://img.guess.com/image/upload/f_auto,q_auto,fl_strip_profile,w_800,c_scale/v1/NA/Style/ECOMM/GU00148-97P-ALT1",
// //     "https://img.guess.com/image/upload/f_auto,q_auto,fl_strip_profile,w_800,c_scale/v1/NA/Style/ECOMM/GU00148-97P-ALT1"
// //   ],
// //   "IsFeatured": true,
// //   "Brand": {
// //     "Id": "20",
// //     "Name": "Guess",
// //     "ProductsCount": 7,
// //     "Image":
// //         "https://youandeyemag.com/wp-content/uploads/2020/07/guess-logo.jpg"
// //   }
// // },
// // {
// //   "CategoryId": "6",
// //   "SKU": "GuessWallet01",
// //   "Title": "Guess Women’s Wallet",
// //   "Price": 6500,
// //   "SalePrice": 5999,
// //   "Stock": 20,
// //   "ProductType": "ProductType.single",
// //   "Description": "Designer wallet with glossy finish.",
// //   "Thumbnail":
// //       "https://img.guess.com/image/upload/f_auto,q_auto,fl_strip_profile,w_800,c_scale/v1/NA/Style/ECOMM/ZG9657140-SAG",
// //   "Images": [
// //     "https://img.guess.com/image/upload/b_rgb:FFFFFF,c_limit,dpr_1.5,f_auto,h_733,q_auto,w_800/c_limit,h_733,w_800/v1/NA/Style/ECOMM/ZG9657140-BLA?pgw=1",
// //     "https://img.guess.com/image/upload/b_rgb:FFFFFF,c_limit,dpr_1.5,f_auto,h_733,q_auto,w_800/c_limit,h_733,w_800/v1/NA/Style/ECOMM/ZG9657140-ROS?pgw=1"
// //   ],
// //   "IsFeatured": true,
// //   "Brand": {
// //     "Id": "20",
// //     "Name": "Guess",
// //     "ProductsCount": 3,
// //     "Image":
// //         "https://youandeyemag.com/wp-content/uploads/2020/07/guess-logo.jpg"
// //   }
// // },
// // {
// //   "CategoryId": "1",
// //   "SKU": "GuessTShirt01",
// //   "Title": "Guess Logo Tee",
// //   "Price": 2999,
// //   "SalePrice": 2799,
// //   "Stock": 30,
// //   "ProductType": "ProductType.single",
// //   "Description": "White cotton T-shirt with Guess logo.",
// //   "Thumbnail":
// //       "https://img.guess.com/image/upload/f_auto,q_auto,fl_strip_profile,w_800,c_scale/v1/NA/Style/ECOMM/M5GI16K8FQ4-G011",
// //   "Images": [
// //     "https://img.guess.com/image/upload/b_rgb:FFFFFF,c_limit,dpr_1.5,f_auto,h_733,q_auto,w_800/c_limit,h_733,w_800/v1/NA/Style/ECOMM/M5GI16K8FQ4-G7V2?pgw=1",
// //     "https://img.guess.com/image/upload/b_rgb:FFFFFF,c_limit,dpr_1.5,f_auto,h_733,q_auto,w_800/c_limit,h_733,w_800/v1/NA/Style/ECOMM/M5GI16K8FQ4-JBLK?pgw=1"
// //   ],
// //   "IsFeatured": false,
// //   "Brand": {
// //     "Id": "20",
// //     "Name": "Guess",
// //     "ProductsCount": 4,
// //     "Image":
// //         "https://youandeyemag.com/wp-content/uploads/2020/07/guess-logo.jpg"
// //   }
// // },
// // {
// //   "CategoryId": "3",
// //   "SKU": "GuessShoes01",
// //   "Title": "Guess White Sneakers",
// //   "Price": 8999,
// //   "SalePrice": 8499,
// //   "Stock": 15,
// //   "ProductType": "ProductType.single",
// //   "Description": "Trendy white sneakers for women.",
// //   "Thumbnail":
// //       "https://img.guess.com/image/upload/f_auto,q_auto,fl_strip_profile,w_800,c_scale/v1/NA/Style/ECOMM/GWBISUN-IVO01",
// //   "Images": [
// //     "https://img.guess.com/image/upload/b_rgb:FFFFFF,c_limit,dpr_1.5,f_auto,h_733,q_auto,w_800/c_limit,h_733,w_800/v1/NA/Style/ECOMM/GWBISUN-BLK01?pgw=1",
// //     "https://img.guess.com/image/upload/b_rgb:FFFFFF,c_limit,dpr_1.5,f_auto,h_733,q_auto,w_800/c_limit,h_733,w_800/v1/NA/Style/ECOMM/GWBISUN-LNA01?pgw=1"
// //   ],
// //   "IsFeatured": true,
// //   "Brand": {
// //     "Id": "20",
// //     "Name": "Guess",
// //     "ProductsCount": 5,
// //     "Image":
// //         "https://youandeyemag.com/wp-content/uploads/2020/07/guess-logo.jpg"
// //   }
// // }

// // const brands = [
// //   {
// //     "Id": "1",
// //     "IsFeatured": true,
// //     "Name": "Outfitter",
// //     "ProductsCount": 15,
// //     "Image":
// //         "https://i.pinimg.com/474x/26/e9/9a/26e99ae8c56dd31650a20adbe3db141c.jpg"
// //   },
// //   {
// //     "Id": "2",
// //     "Name": "Enginee",
// //     "IsFeatured": true,
// //     "ProductsCount": 3,
// //     "Image":
// //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQd_cxqzyRBCWNIpA1ynqjUIklsGB93gsw-hQ&s"
// //   },
// //   {
// //     "Id": "3",
// //     "Name": "Puma",
// //     "IsFeatured": true,
// //     "ProductsCount": 10,
// //     "Image":
// //         "https://firebasestorage.googleapis.com/v0/b/codingwitht-c6d0f.appspot.com/o/Brands%2FPuma?alt=media&token=646a1ed9-0960-477a-8dbd-247985a91c60"
// //   },
// //   {
// //     "Id": "4",
// //     "Name": "Levi’s",
// //     "IsFeatured": true,
// //     "ProductsCount": 12,
// //     "Image":
// //         "https://media.designrush.com/inspirations/758970/conversions/1-preview.jpg"
// //   },
// //   {
// //     "Id": "5",
// //     "Name": "Adidas",
// //     "IsFeatured": true,
// //     "ProductsCount": 15,
// //     "Image":
// //         "https://cdn.logojoy.com/wp-content/uploads/20231013154327/Adidas-logo-1991-1-600x319.png"
// //   },
// //   {
// //     "Id": "6",
// //     "Name": "Nike",
// //     "IsFeatured": true,
// //     "ProductsCount": 10,
// //     "Image":
// //         "https://firebasestorage.googleapis.com/v0/b/codingwitht-c6d0f.appspot.com/o/Brands%2FNike?alt=media&token=2d7b4083-f164-4233-ad43-3b2c9aa3201c"
// //   },
// //   {
// //     "Id": "7",
// //     "Name": "Skechers",
// //     "IsFeatured": true,
// //     "ProductsCount": 6,
// //     "Image":
// //         "https://images.seeklogo.com/logo-png/12/1/skechers-logo-png_seeklogo-127487.png"
// //   },
// //   {
// //     "Id": "8",
// //     "Name": "Hush Puppies",
// //     "IsFeatured": true,
// //     "ProductsCount": 8,
// //     "Image":
// //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCqoQZ1AmInl6yTEQ2vI5960Q6sMjITpvccQ&s"
// //   },
// //   {
// //     "Id": "9",
// //     "Name": "Dolce Gabbana",
// //     "IsFeatured": true,
// //     "ProductsCount": 2,
// //     "Image":
// //         "https://media.licdn.com/dms/image/v2/C4D0BAQFKXNt7LSoswA/company-logo_200_200/company-logo_200_200/0/1630553229660?e=2147483647&v=beta&t=S2zdo9UhMcfaXSX8MVzdHeN70SohAUVdf3SynqIJJnA"
// //   },
// //   {
// //     "Id": "10",
// //     "Name": "Zara Home",
// //     "IsFeatured": true,
// //     "ProductsCount": 4,
// //     "Image":
// //         "https://play-lh.googleusercontent.com/wvEDsWfdSqdWYxsMC8sn4QsgArnlx4jg-y22XZBiUbsV5l65Ut4jUeeoKFGRcrHSB34"
// //   },
// //   {
// //     "Id": "11",
// //     "Name": "West Elm",
// //     "IsFeatured": true,
// //     "ProductsCount": 3,
// //     "Image":
// //         "https://cdn.clicflyer.com/appimages/retailers/retailer_1516_2021061913111152774_490x280.png"
// //   },
// //   {
// //     "Id": "12",
// //     "Name": "IKEA",
// //     "IsFeatured": true,
// //     "ProductsCount": 4,
// //     "Image":
// //         "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c5/Ikea_logo.svg/800px-Ikea_logo.svg.png"
// //   },
// //   {
// //     "Id": "13",
// //     "Name": "Under Armour",
// //     "IsFeatured": true,
// //     "ProductsCount": 2,
// //     "Image":
// //         "https://cdn.dribbble.com/userupload/18384833/file/original-650ea6f90cdfd18d362c355f47b65dea.png?resize=400x300"
// //   },
// //   {
// //     "Id": "14",
// //     "Name": "Zara",
// //     "IsFeatured": true,
// //     "ProductsCount": 3,
// //     "Image":
// //         "https://firebasestorage.googleapis.com/v0/b/codingwitht-c6d0f.appspot.com/o/Brands%2FZARA?alt=media&token=98471b33-c09d-4ec6-9fc2-fb53cfc639c3"
// //   },
// //   {
// //     "Id": "15",
// //     "Name": "Reebok",
// //     "IsFeatured": true,
// //     "ProductsCount": 3,
// //     "Image":
// //         "https://mir-s3-cdn-cf.behance.net/project_modules/1400/d56c1698226919.5ed781fc9d1ce.jpg"
// //   },
// //   {
// //     "Id": "16",
// //     "Name": "Michael Kors",
// //     "IsFeatured": true,
// //     "ProductsCount": 4,
// //     "Image":
// //         "https://1000logos.net/wp-content/uploads/2017/08/Michael-Kors-Logo-1981.jpg"
// //   },
// //   {
// //     "Id": "17",
// //     "Name": "Fossil",
// //     "ProductsCount": 11,
// //     "Image": "https://1000logos.net/wp-content/uploads/2020/09/Fossil-Logo.jpg"
// //   },
// //   {
// //     "Id": "18",
// //     "Name": "Daniel Wellington",
// //     "ProductsCount": 4,
// //     "Image":
// //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxHRN3Jxz6fp4TBQ5dytafKWatsPHQBZLyKA&s"
// //   },
// //   {
// //     "Id": "19",
// //     "Name": "Casio",
// //     "ProductsCount": 5,
// //     "Image":
// //         "https://i.pinimg.com/736x/46/84/29/468429100be13d7e6390685ae9d0c446.jpg"
// //   },
// //   {
// //     "Id": "20",
// //     "Name": "Guess",
// //     "ProductsCount": 4,
// //     "Image":
// //         "https://youandeyemag.com/wp-content/uploads/2020/07/guess-logo.jpg"
// //   },
// // ];

// // const categories = [
// //   // --- Main Categories ---
// //   {
// //     "ParentId": null,
// //     "Name": "Apparel",
// //     "IsFeatured": true,
// //     "Image":
// //         "https://images.unsplash.com/photo-1574712465431-29177114b7e8?fit=crop&w=800&q=80"
// //   },
// //   {
// //     "ParentId": null,
// //     "Name": "Footwear",
// //     "IsFeatured": true,
// //     "Image":
// //         "https://images.unsplash.com/photo-1542291026-79ed9479d7ed?fit=crop&w=800&q=80"
// //   },
// //   {
// //     "ParentId": null,
// //     "Name": "Accessories",
// //     "IsFeatured": true,
// //     "Image":
// //         "https://images.unsplash.com/photo-1560946285-d86b5103c683?fit=crop&w=800&q=80"
// //   },
// //   {
// //     "ParentId": null,
// //     "Name": "Home Goods",
// //     "IsFeatured": true,
// //     "Image":
// //         "https://images.unsplash.com/photo-1618220252343-a61f2f01f4c3?fit=crop&w=800&q=80"
// //   },

// //   // --- Subcategories for Apparel (ParentId: 1) ---
// //   {
// //     "ParentId": "1",
// //     "Name": "T-Shirts",
// //     "IsFeatured": true,
// //     "Image":
// //         "https://images.unsplash.com/photo-1583743814966-8936f5b7edca?fit=crop&w=800&q=80"
// //   },
// //   {
// //     "ParentId": "1",
// //     "Name": "Pants & Jeans",
// //     "IsFeatured": true,
// //     "Image":
// //         "https://images.unsplash.com/photo-1541099645167-ccaf57b3d1b1?fit=crop&w=800&q=80"
// //   },

// //   // --- Subcategories for Footwear (ParentId: 2) ---
// //   {
// //     "ParentId": "2",
// //     "Name": "Athletic & Casual Shoes",
// //     "IsFeatured": true,
// //     "Image":
// //         "https://images.unsplash.com/photo-1595950653106-6c9ebd6040cd?fit=crop&w=800&q=80"
// //   },
// //   {
// //     "ParentId": "2",
// //     "Name": "Pumps & Flats",
// //     "IsFeatured": true,
// //     "Image":
// //         "https://images.unsplash.com/photo-1515797693437-010b10629a73?fit=crop&w=800&q=80"
// //   },
// //   {
// //     "ParentId": "2",
// //     "Name": "Sandals & Slip-Ons",
// //     "IsFeatured": true,
// //     "Image":
// //         "https://images.unsplash.com/photo-1621217594951-eb57d1902264?fit=crop&w=800&q=80"
// //   },

// //   // --- Subcategories for Accessories (ParentId: 3) ---
// //   {
// //     "ParentId": "3",
// //     "Name": "Bags & Backpacks",
// //     "IsFeatured": true,
// //     "Image":
// //         "https://images.unsplash.com/photo-1550009158-9ebf69f3e49e?fit=crop&w=800&q=80"
// //   },
// //   {
// //     "ParentId": "3",
// //     "Name": "Glasses",
// //     "IsFeatured": true,
// //     "Image":
// //         "https://images.unsplash.com/photo-1511499767150-a48a237d7004?fit=crop&w=800&q=80"
// //   },
// //   {
// //     "ParentId": "3",
// //     "Name": "Wallets & Small Leather Goods",
// //     "IsFeatured": true,
// //     "Image":
// //         "https://images.unsplash.com/photo-1512403754711-b85651c6c543?fit=crop&w=800&q=80"
// //   },
// //   {
// //     "ParentId": "3",
// //     "Name": "Watches & Jewelry",
// //     "IsFeatured": true,
// //     "Image":
// //         "https://images.unsplash.com/photo-1523275335684-37898b6baf30?fit=crop&w=800&q=80"
// //   },

// //   // --- Subcategories for Home Goods (ParentId: 4) ---
// //   {
// //     "ParentId": "4",
// //     "Name": "Furniture",
// //     "IsFeatured": true,
// //     "Image":
// //         "https://images.unsplash.com/photo-1555041469-a586c61ea9bc?fit=crop&w=800&q=80"
// //   },
// //   {
// //     "ParentId": "4",
// //     "Name": "Decorative Accents",
// //     "IsFeatured": true,
// //     "Image":
// //         "https://images.unsplash.com/photo-1563229712-42c23a54d5d9?fit=crop&w=800&q=80"
// //   },
// //   {
// //     "ParentId": "4",
// //     "Name": "Lighting",
// //     "IsFeatured": true,
// //     "Image":
// //         "https://images.unsplash.com/photo-1606423011409-543e4f3a7f2f?fit=crop&w=800&q=80"
// //   }
// // ];

// // const productCategory = [
// //   {"productId": "001", "categoryId": "11"},
// //   {"productId": "002", "categoryId": "12"},
// //   {"productId": "003", "categoryId": "11"},
// //   {"productId": "004", "categoryId": "21"},
// //   {"productId": "005", "categoryId": "12"},
// //   {"productId": "006", "categoryId": "11"},
// //   {"productId": "007", "categoryId": "11"},
// //   {"productId": "008", "categoryId": "12"},
// //   {"productId": "009", "categoryId": "21"},
// //   {"productId": "010", "categoryId": "11"},
// //   {"productId": "011", "categoryId": "12"},
// //   {"productId": "012", "categoryId": "11"},
// //   {"productId": "013", "categoryId": "12"},
// //   {"productId": "014", "categoryId": "12"},
// //   {"productId": "015", "categoryId": "21"},
// //   {"productId": "016", "categoryId": "11"},
// //   {"productId": "017", "categoryId": "12"},
// //   {"productId": "018", "categoryId": "21"},
// //   {"productId": "019", "categoryId": "11"},
// //   {"productId": "020", "categoryId": "11"},
// //   {"productId": "021", "categoryId": "21"},
// //   {"productId": "022", "categoryId": "21"},
// //   {"productId": "023", "categoryId": "22"},
// //   {"productId": "024", "categoryId": "23"},
// //   {"productId": "025", "categoryId": "22"},
// //   {"productId": "026", "categoryId": "11"},
// //   {"productId": "027", "categoryId": "41"},
// //   {"productId": "028", "categoryId": "42"},
// //   {"productId": "029", "categoryId": "41"},
// //   {"productId": "030", "categoryId": "43"},
// //   {"productId": "031", "categoryId": "41"},
// //   {"productId": "032", "categoryId": "41"},
// //   {"productId": "033", "categoryId": "5"},
// //   {"productId": "034", "categoryId": "21"},
// //   {"productId": "035", "categoryId": "5"},
// //   {"productId": "036", "categoryId": "6"},
// //   {"productId": "037", "categoryId": "21"},
// //   {"productId": "038", "categoryId": "5"},
// //   {"productId": "039", "categoryId": "7"},
// //   {"productId": "040", "categoryId": "12"},
// //   {"productId": "041", "categoryId": "5"},
// //   {"productId": "042", "categoryId": "8"},
// //   {"productId": "043", "categoryId": "6"},
// //   {"productId": "044", "categoryId": "7"},
// //   {"productId": "045", "categoryId": "8"},
// //   {"productId": "046", "categoryId": "12"},
// //   {"productId": "047", "categoryId": "11"},
// //   {"productId": "048", "categoryId": "6"},
// //   {"productId": "049", "categoryId": "8"},
// //   {"productId": "050", "categoryId": "6"},
// //   {"productId": "051", "categoryId": "21"},
// //   {"productId": "052", "categoryId": "7"},
// //   {"productId": "053", "categoryId": "8"},
// //   {"productId": "054", "categoryId": "6"},
// //   {"productId": "055", "categoryId": "11"},
// //   {"productId": "056", "categoryId": "7"},
// //   {"productId": "057", "categoryId": "8"},
// //   {"productId": "058", "categoryId": "6"},
// //   {"productId": "059", "categoryId": "11"},
// //   {"productId": "060", "categoryId": "21"}
// // ];

// // const brandCategory = [
// //   {"brandId": "1", "categoryId": "1"},
// //   {"brandId": "1", "categoryId": "2"},
// //   {"brandId": "2", "categoryId": "1"},
// //   {"brandId": "3", "categoryId": "1"},
// //   {"brandId": "3", "categoryId": "2"},
// //   {"brandId": "4", "categoryId": "1"},
// //   {"brandId": "5", "categoryId": "1"},
// //   {"brandId": "5", "categoryId": "2"},
// //   {"brandId": "6", "categoryId": "1"},
// //   {"brandId": "6", "categoryId": "2"},
// //   {"brandId": "7", "categoryId": "2"},
// //   {"brandId": "8", "categoryId": "2"},
// //   {"brandId": "9", "categoryId": "1"},
// //   {"brandId": "9", "categoryId": "2"},
// //   {"brandId": "10", "categoryId": "4"},
// //   {"brandId": "11", "categoryId": "4"},
// //   {"brandId": "12", "categoryId": "4"},
// //   {"brandId": "13", "categoryId": "2"},
// //   {"brandId": "13", "categoryId": "3"},
// //   {"brandId": "14", "categoryId": "3"},
// //   {"brandId": "15", "categoryId": "1"},
// //   {"brandId": "15", "categoryId": "2"},
// //   {"brandId": "15", "categoryId": "3"},
// //   {"brandId": "16", "categoryId": "3"},
// //   {"brandId": "17", "categoryId": "1"},
// //   {"brandId": "17", "categoryId": "3"},
// //   {"brandId": "18", "categoryId": "2"},
// //   {"brandId": "18", "categoryId": "3"},
// //   {"brandId": "19", "categoryId": "1"},
// //   {"brandId": "19", "categoryId": "3"},
// //   {"brandId": "20", "categoryId": "1"},
// //   {"brandId": "20", "categoryId": "2"},
// //   {"brandId": "20", "categoryId": "3"}
// // ];

// class FirestoreUploader {
//   static Future<void> uploadProductsToFirebase(
//       List<Map<String, dynamic>> products) async {
//     final db = FirebaseFirestore.instance;

//     for (var i = 0; i < products.length; i++) {
//       final product = products[i];
//       final documentId =
//           (i + 1).toString().padLeft(3, '0'); // IDs like 001, 002
//       try {
//         await db.collection('products').doc(documentId).set(product);
//       } catch (error) {
//         print('Error adding product with ID $documentId: $error');
//       }
//     }
//   }

//   static Future<void> uploadBrandsToFirebase(
//       List<Map<String, dynamic>> brands) async {
//     final db = FirebaseFirestore.instance;

//     for (var i = 0; i < brands.length; i++) {
//       final brand = brands[i];
//       final documentId = (i + 1).toString(); // IDs like "1", "2", "3"...

//       try {
//         await db.collection('brands').doc(documentId).set(brand);
//         print('Brand added with ID: $documentId');
//       } catch (error) {
//         print('Error adding brand with ID $documentId: $error');
//       }
//     }
//   }

//   // Method to upload BrandCategory data to Firebase
//   static Future<void> uploadBrandCategoriesToFirebase(
//       List<Map<String, dynamic>> brandCategories) async {
//     final db = FirebaseFirestore.instance;

//     for (var i = 0; i < brandCategories.length; i++) {
//       final brandCategory = brandCategories[i];
//       try {
//         // Use .add() to let Firestore generate a random document ID
//         await db.collection('BrandCategory').add(brandCategory);
//         print(
//             'BrandCategory document added successfully for: ${brandCategory['brandId']} - ${brandCategory['categoryId']}');
//       } catch (error) {
//         print('Error adding BrandCategory document: $error');
//       }
//     }
//   }

//   // Method to upload ProductCategory data to Firebase
//   static Future<void> uploadProductCategoriesToFirebase(
//       List<Map<String, dynamic>> productCategories) async {
//     final db = FirebaseFirestore.instance;

//     for (var i = 0; i < productCategories.length; i++) {
//       final productCategory = productCategories[i];
//       try {
//         // Use .add() to let Firestore generate a random document ID
//         await db.collection('ProductCategory').add(productCategory);
//         print(
//             'ProductCategory document added successfully for: ${productCategory['productId']} - ${productCategory['categoryId']}');
//       } catch (error) {
//         print('Error adding ProductCategory document: $error');
//       }
//     }
//   }

//   // Method to upload categories with specific document IDs to Firebase Firestore
//   static Future<void> uploadCategoriesToFirebase(
//       List<Map<String, dynamic>> categories) async {
//     final db = FirebaseFirestore.instance;

//     for (var i = 0; i < categories.length; i++) {
//       final category = categories[i];
//       final docId =
//           (i + 1).toString(); // Generate sequential document IDs (1, 2, 3, ...)
//       try {
//         // Add the category to the 'Categories' collection with the specific document ID
//         await db.collection('Categories').doc(docId).set({
//           "ParentId": category["ParentId"],
//           "Name": category["Name"],
//           "IsFeatured": category["IsFeatured"],
//           "Image": category["Image"]
//         });
//         print(
//             'Category added successfully with ID $docId: ${category["Name"]}');
//       } catch (error) {
//         print(
//             'Error uploading category with ID $docId (${category["Name"]}): $error');
//       }
//     }
//   }
// }
