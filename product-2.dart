import "dart:io";

// void main() {
//   final cart = Cart();
//   printMenu(cart);
// }

// class Product {
//   String _name;
//   String _description;
//   double _price;

//   Product(this._name, this._description, this._price);

//   String get name => _name;
//   String get description => _description;
//   double get price => _price;

//   set name(String name) => _name = name;
//   set description(String description) => _description = description;
//   set price(double price) => _price = price;

//   @override
//   String toString() {
//     return 'Product{name: $_name, description: $_description, price: $_price}';
//   }
// }

// class Cart {
//   List<Product> _products = [];

//   void addProduct(Product product) {
//     _products.add(product);
//     print('Product added successfully.');
//   }

//   void viewAllProducts() {
//     if (_products.isEmpty) {
//       print('No products available.');
//     } else {
//       for (var product in _products) {
//         print(product);
//       }
//     }
//   }

//   void viewSingleProduct(String name) {
//     var product = _products.firstWhere((product) => product.name == name, orElse: () => null);
//     if (product != null) {
//       print(product);
//     } else {
//       print('Product not found.');
//     }
//   }

//   void editProduct(String name, String newName, String newDescription, double newPrice) {
//     var product = _products.firstWhere((product) => product.name == name, orElse: () => null);
//     if (product != null) {
//       product.name = newName;
//       product.description = newDescription;
//       product.price = newPrice;
//       print('Product updated successfully.');
//     } else {
//       print('Product not found.');
//     }
//   }

//   void deleteProduct(String name) {
//     var product = _products.firstWhere((product) => product.name == name, orElse: () => null);
//     if (product != null) {
//       _products.remove(product);
//       print('Product deleted successfully.');
//     } else {
//       print('Product not found.');
//     }
//   }
// }

// void printMenu(Cart cart) {
//   while (true) {
//     print('+---------------------------+');
//     print('| Welcome to E-commerce App |');
//     print('+---------------------------+');
//     print('Please select an option:');
//     print('1. Add a new product');
//     print('2. View all products');
//     print('3. View a single product');
//     print('4. Edit a product');
//     print('5. Delete a product');
//     print('6. Exit');
//     print('Enter your choice (1-6):');

//     int choice = int.parse(stdin.readLineSync()!);

//     switch (choice) {
//       case 1:
//         print("Enter the product name:");
//         String? productName = stdin.readLineSync();
//         print("Enter the product description:");
//         String? productDescription = stdin.readLineSync();
//         print("Enter the product price:");
//         double productPrice = double.parse(stdin.readLineSync()!);

//         final newProduct = Product(productName!, productDescription!, productPrice);
//         cart.addProduct(newProduct);
//         break;
//       case 2:
//         cart.viewAllProducts();
//         break;
//       case 3:
//         print("Enter the product name to view:");
//         String? name = stdin.readLineSync();
//         cart.viewSingleProduct(name!);
//         break;
//       case 4:
//         print("Enter the product name to edit:");
//         String? name = stdin.readLineSync();
//         print("Enter the new product name:");
//         String? newName = stdin.readLineSync();
//         print("Enter the new product description:");
//         String? newDescription = stdin.readLineSync();
//         print("Enter the new product price:");
//         double newPrice = double.parse(stdin.readLineSync()!);
//         cart.editProduct(name!, newName!, newDescription!, newPrice);
//         break;
//       case 5:
//         print("Enter the product name to delete:");
//         String? name = stdin.readLineSync();
//         cart.deleteProduct(name!);
//         break;
//       case 6:
//         print('Goodbye!');
//         return;
//       default:
//         print('Invalid choice. Please try again.');
//     }
//   }
// }


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
        stdout.write('Enter product name: ');
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
