import 'package:flutter/material.dart';
import 'package:sepatu_admin/controller/home_controller.dart';
import 'package:sepatu_admin/pages/add_product_page.dart';
import 'package:get/route_manager.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> _onRefresh(HomeController ctrl) async {
    await ctrl.refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Sepatu Unesa Admin',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.indigoAccent,
        ),
        body: RefreshIndicator(
          onRefresh: () => _onRefresh(ctrl),
          child: ctrl.products.isEmpty
              ? Center(
            child: Text(
              'Tidak ada produk tersedia',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          )
              : ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            physics: AlwaysScrollableScrollPhysics(),
            itemCount: ctrl.products.length,
            itemBuilder: (context, index) {
              final product = ctrl.products[index];
              return Card(
                margin: EdgeInsets.only(bottom: 10),
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.all(16),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      product.image ?? 'https://via.placeholder.com/150',
                    ),
                    radius: 30,
                  ),
                  title: Text(
                    product.name ?? 'Produk Tidak Diketahui',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Rp ${product.price?.toString() ?? '0'}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.green,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.redAccent),
                    onPressed: () {
                      ctrl.deleteProduct(product.id ?? '');
                    },
                  ),
                ),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(AddProductPage());
          },
          backgroundColor: Colors.indigoAccent,
          child: Icon(Icons.add, color: Colors.white),
        ),
      );
    });
  }
}
