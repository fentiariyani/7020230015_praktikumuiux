import 'package:flutter/material.dart';
import '../models/product_model.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Container(
                  height: 350,
                  width: double.infinity,
                  color: Colors.blue[50],
                  child: const Icon(
                    Icons.image,
                    size: 150,
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        product.price,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.blueAccent,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Deskripsi Produk",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        product.description,
                        style: const TextStyle(
                          color: Colors.grey,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
          SafeArea(
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () =>
                  Navigator.pop(context),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding:
                  const EdgeInsets.all(15),
              color: Colors.white,
              child: ElevatedButton(
                onPressed: () {},
                child:
                    const Text("Tambah ke Keranjang"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
