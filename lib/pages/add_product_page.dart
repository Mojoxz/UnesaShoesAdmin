import 'package:flutter/material.dart';
import 'package:sepatu_admin/controller/home_controller.dart';
import 'package:sepatu_admin/widgets/DropDown_btn.dart';
import 'package:get/get.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Tambahkan Sepatu',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.indigoAccent,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 10,
                ),
              ],
            ),
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Tambahkan Produk Baru',
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.indigoAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: ctrl.productNameCtrl,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.drive_file_rename_outline, color: Colors.indigoAccent),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    labelText: 'Nama Produk',
                    hintText: 'Masukkan Nama Sepatu',
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: ctrl.productDescriptionCtrl,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.description, color: Colors.indigoAccent),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    labelText: 'Deskripsi Produk',
                    hintText: 'Masukkan Deskripsi Produk',
                  ),
                  maxLines: 4,
                ),
                SizedBox(height: 15),
                TextField(
                  controller: ctrl.productImgCtrl,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.image, color: Colors.indigoAccent),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    labelText: 'Link Gambar',
                    hintText: 'Masukkan Link Gambar',
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: ctrl.productPriceCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.attach_money, color: Colors.indigoAccent),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    labelText: 'Harga Produk',
                    hintText: 'Masukkan Harga Produk',
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: DropDownBTN(
                        items: ['Casuals', 'Boots', 'Oldschools', 'SportsFootwear'],
                        selectedItemText: ctrl.category,
                        onSelected: (selectedValue) {
                          ctrl.category = selectedValue ?? 'Kategori';
                          ctrl.update();
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: DropDownBTN(
                        items: ['Adidas', 'Puma', 'Nike', 'Clarks', 'Onitsuka', 'Reebok', 'Timberland'],
                        selectedItemText: ctrl.brand,
                        onSelected: (selectedValue) {
                          ctrl.brand = selectedValue ?? 'Brand';
                          ctrl.update();
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Text(
                  'Tawarkan Produk',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.indigoAccent),
                ),
                DropDownBTN(
                  items: ['true', 'false'],
                  selectedItemText: ctrl.offer.toString(),
                  onSelected: (selectedValue) {
                    ctrl.offer = bool.tryParse(selectedValue ?? 'false') ?? false;
                    ctrl.update();
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigoAccent,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    ctrl.addProduct();
                  },
                  child: Text(
                    'Tambah Produk',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
