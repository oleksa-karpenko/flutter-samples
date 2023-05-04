class Product {
  String category;
  String name;
  int qty;

  Product(this.category, this.name, this.qty);

  static List<Product> products = [
    Product('Food', 'Milk', 10),
    Product('Food', 'Rice', 5),
    Product('Food', 'Pasta', 20),
    Product('Food', 'Steak', 15),
    Product('Clothes', 'T-Shirt', 2),
    Product('Clothes', 'Jeans', 5),
    Product('Clothes', 'Skirt', 10),
    Product('Clothes', 'Socks', 20),
  ];
}
