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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      resizeToAvoidBottomInset: false, 
      appBar: _selectedIndex == 0 ? _buildAppBar() : null,
      body: _pages[_selectedIndex],
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      toolbarHeight: 70,
      title: Row(
        children: [
          Expanded(
            child: Container(
              height: 45,
              decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(15)),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Cari produk impian...",
                  prefixIcon: Icon(Icons.search_rounded, color: Colors.blueAccent),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          _buildCircleAction(Icons.notifications_none_rounded),
        ],
      ),
    );
  }

  Widget _buildCircleAction(IconData icon) {
    return Container(
      decoration: BoxDecoration(color: Colors.blueAccent.withOpacity(0.1), shape: BoxShape.circle),
      child: IconButton(icon: Icon(icon, color: Colors.blueAccent, size: 22), onPressed: () {}),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 20)]),
      child: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        selectedItemColor: Colors.blueAccent,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.grid_view_rounded), label: 'Produk'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: 'Keranjang'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline_rounded), label: 'Profil'),
        ],
      ),
    );
  }
}

class ProductGridScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Halo, Budi!", style: TextStyle(fontSize: 14, color: Colors.grey)),
                  Text("Ayo Berbelanja Sekarang", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            _buildPromoBanner(),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Produk Terbaru", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: dummyProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 15, childAspectRatio: 0.72,
                ),
                itemBuilder: (context, index) => ProductCard(product: dummyProducts[index]),
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildPromoBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: const LinearGradient(colors: [Color(0xFF1A73E8), Color(0xFF6FB1FC)]),
        boxShadow: [BoxShadow(color: Colors.blueAccent.withOpacity(0.2), blurRadius: 15, offset: const Offset(0, 8))],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Stack(
          children: [
            Positioned(right: -20, top: -20, child: CircleAvatar(radius: 60, backgroundColor: Colors.white.withOpacity(0.1))),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Diskon!", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                  const Text("Hemat hingga 70% hari ini", style: TextStyle(color: Colors.white70)),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.blueAccent),
                    onPressed: () {},
                    child: const Text("Cek Sekarang"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
