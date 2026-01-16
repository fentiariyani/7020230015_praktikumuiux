class Product {
  final String id;
  final String name;
  final String price;
  final String description;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.imageUrl,
  });
}

List<Product> dummyProducts = [
  Product(
    id: '1',
    name: 'MacBook Pro M2',
    price: 'Rp 25.000.000',
    description: 'Performa tingkat pro untuk alur kerja paling menuntut dengan chip M2.',
    imageUrl: 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=800&q=80',
  ),
  Product(
    id: '2',
    name: 'iPhone 14 Pro',
    price: 'Rp 18.000.000',
    description: 'Sistem kamera Pro yang jauh lebih andal dengan sensor quad-pixel.',
    imageUrl: 'https://images.unsplash.com/photo-1663499482523-1c0c1bae4ce1?w=800&q=80',
  ),
  Product(
    id: '3',
    name: 'Sony WH-1000XM4',
    price: 'Rp 3.500.000',
    description: 'Headphone noise cancelling terbaik dengan kualitas suara premium.',
    imageUrl: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=800&q=80',
  ),
  Product(
    id: '4',
    name: 'Keychron K2',
    price: 'Rp 1.200.000',
    description: 'Keyboard mechanical wireless yang ringkas dan sangat responsif.',
    imageUrl: 'https://images.unsplash.com/photo-1511467687858-23d96c32e4ae?w=800&q=80',
  ),
];

