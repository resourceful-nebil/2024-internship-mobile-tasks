import "dart:io";


class Product {
  String name;
  String description;
  double price;

  Product(this.name, this.description, this.price);

  @override
  String toString() {
    return 'Product{name: $name, description: $description, price: $price}';
  }
}



//
class ProductManager {
  List<Product> _products = [];

  void addProduct(Product product) {
    _products.add(product);
    print('Product added: ${product.name}');
  }

  void viewAllProducts() {
    if (_products.isEmpty) {
      print('No products available.');
    } else {
      for (var product in _products) {
        print(product);
      }
    }
  }

  void viewProduct(String name) {
    var product = _products.firstWhere((prod) => prod.name == name, orElse: () => Product('Not Found', 'N/A', 0.0));
    if (product != null) {
      print(product);
    } else {
      print('Product not found.');
    }
  }

  void editProduct(String name, String newName, String newDescription, double newPrice) {
    var product = _products.firstWhere((prod) => prod.name == name, orElse: () => Product('Not Found', 'N/A', 0.0));
    if (product != null) {
      product.name = newName;
      product.description = newDescription;
      product.price = newPrice;
      print('Product updated: $product');
    } else {
      print('Product not found.');
    }
  }

  void deleteProduct(String name) {
    var product = _products.firstWhere((prod) => prod.name == name, orElse: () => Product('Not Found', 'N/A', 0.0));
    if (product != null) {
      _products.remove(product);
      print('Product deleted: ${product.name}');
    } else {
      print('Product not found.');
    }
  }
}


// 


void main() {
  var productManager = ProductManager();

  while (true) {
    print('+---------------------------+');
    print('| Welcome to E-commerce App |');
    print('+---------------------------+');
    print('Please select an option:');
    print('1. Add a new product');
    print('2. View all products');
    print('3. View a single product');
    print('4. Edit a product');
    print('5. Delete a product');
    print('6. Exit');
    print('Enter your choice (1-6):');
    
    var choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        print('Enter product name: ');
        var name = stdin.readLineSync() ?? '';
        stdout.write('Enter product description: ');
        var description = stdin.readLineSync() ?? '';
        stdout.write('Enter product price: ');
        var price = double.tryParse(stdin.readLineSync() ?? '') ?? 0.0;
        var product = Product(name, description, price);
        productManager.addProduct(product);
        break;
      case '2':
        productManager.viewAllProducts();
        break;
      case '3':
        stdout.write('Enter product name to view: ');
        var name = stdin.readLineSync() ?? '';
        productManager.viewProduct(name);
        break;
      case '4':
        stdout.write('Enter product name to edit: ');
        var name = stdin.readLineSync() ?? '';
        stdout.write('Enter new product name: ');
        var newName = stdin.readLineSync() ?? '';
        stdout.write('Enter new product description: ');
        var newDescription = stdin.readLineSync() ?? '';
        stdout.write('Enter new product price: ');
        var newPrice = double.tryParse(stdin.readLineSync() ?? '') ?? 0.0;
        productManager.editProduct(name, newName, newDescription, newPrice);
        break;
      case '5':
        stdout.write('Enter product name to delete: ');
        var name = stdin.readLineSync() ?? '';
        productManager.deleteProduct(name);
        break;
      case '6':
        print('Goodbye!');
        exit(0);
      default:
        print('Invalid option. Please try again.');
    }
  }
}
