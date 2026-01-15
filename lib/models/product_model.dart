class Product {
  final String name;
  final String price;
  final String description; 

  Product({
    required this.name,
    required this.price,
    required this.description,
  });
}
List<Product> dummyProducts = [
  Product(
    name: 'MacBook Pro',
    price: 'Rp 25.000.000',
    description:
        'MacBook Pro dengan performa tinggi yang dirancang untuk profesional.',
  ),
  Product(
    name: 'iPhone 14',
    price: 'Rp 18.000.000',
    description:
        'iPhone 14 dengan kamera canggih dan performa cepat.',
  ),
  Product(
    name: 'Headphone',
    price: 'Rp 1.500.000',
    description:
        'Headphone berkualitas dengan suara jernih dan nyaman digunakan.',
  ),
  Product(
    name: 'Keyboard Mechanical',
    price: 'Rp 900.000',
    description:
        'Keyboard mechanical dengan respons cepat dan desain ergonomis.',
  ),
];

