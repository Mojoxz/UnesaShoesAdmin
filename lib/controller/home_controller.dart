import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sepatu_admin/model/product/product.dart';

class HomeController extends GetxController {

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference productCollection;

  TextEditingController productNameCtrl = TextEditingController();
  TextEditingController productDescriptionCtrl = TextEditingController();
  TextEditingController productImgCtrl = TextEditingController();
  TextEditingController productPriceCtrl = TextEditingController();

  String category = 'Kategori';
  String brand = 'Brand';
  bool offer = false;

  List<Product> products =[];

  @override
  void onInit() async{
    productCollection = firestore.collection('products');
    await fetchProduct();
    super.onInit();
  }


  addProduct(){
    try {
      DocumentReference doc = productCollection.doc();
      Product product = Product(
            id:doc.id,
            name: productNameCtrl.text,
            category: category,
            description: productDescriptionCtrl.text,
            price: double.tryParse(productPriceCtrl.text) ,
            brand: brand,
            image: productImgCtrl.text,
            offer: offer,

          );

      final productJson = product.toJson();
      doc.set(productJson);
      Get.snackbar('Succes', 'Product berhasil ditambahkan', colorText: Colors.green);
      setValuesDefault();
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.green);
      print(e);
    }


  }

  fetchProduct() async{
   try {
     QuerySnapshot  productSnapshot = await productCollection.get();
     final List<Product> retrievedProducts = productSnapshot.docs.map((doc) =>
            Product.fromJson(doc.data() as Map<String,dynamic>)).toList();
     products.clear();
     products.assignAll(retrievedProducts);
     Get.snackbar('Succes', 'Produk Berhasil Ditambahkan', colorText: Colors.green);
   } catch (e) {
     Get.snackbar('Error', e.toString(), colorText: Colors.red);
     print(e);
   }finally{
     update();
   }

  }

  deleteProduct(String id) async{
    try {
      await productCollection.doc(id).delete();
      fetchProduct();

    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      print(e);
    }
  }

  setValuesDefault(){
    productNameCtrl.clear();
    productImgCtrl.clear();
    productPriceCtrl.clear();
    productDescriptionCtrl.clear();

     category = 'General';
     brand = 'on Branded';
     offer = false;

     update();
  }

  Future<void> refreshData() async {
    // Fungsi ini akan dipanggil saat pengguna melakukan pull-to-refresh
    await fetchProduct();
  }
}