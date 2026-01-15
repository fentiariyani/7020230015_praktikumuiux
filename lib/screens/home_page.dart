import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../widgets/product_card.dart';
import 'profile_screen.dart';
import 'cart_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    ProductGridScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 0
          ? AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: SizedBox(
                height: 45,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Cari produk impian...",
                    prefixIcon: Icon(Icons.search,
                        color: Colors.grey),
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            )
          : null,
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), 
              activeIcon: Icon(Icons.home),
              label: 'Produk'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              activeIcon: Icon(Icons.shopping_cart),
              label: 'Keranjang'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), 
              activeIcon: Icon(Icons.person),
              label: 'Profil'),
        ],
      ),
    );
  }
}

class ProductGridScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          const Text(
            "Produk Terbaru",
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: GridView.builder(
              itemCount: dummyProducts.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {
                return ProductCard(
                  product: dummyProducts[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
