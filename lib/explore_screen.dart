
import 'package:flutter/material.dart';

class Product {
  final String name;
  final String category;
  final String region;
  final double price;

  Product({required this.name, required this.category, required this.region, required this.price});
}

class ExploreProductsScreen extends StatefulWidget {
  @override
  _ExploreProductsScreenState createState() => _ExploreProductsScreenState();
}

class _ExploreProductsScreenState extends State<ExploreProductsScreen> {
  List<Product> products = [
    Product(name: 'Tomato', category: 'Vegetable', region: 'Ashanti', price: 20),
    Product(name: 'Maize', category: 'Grain', region: 'Northern', price: 15),
    Product(name: 'Cassava', category: 'Root', region: 'Volta', price: 10),
  ];

  String selectedCategory = 'All';

  List<String> categories = ['All', 'Vegetable', 'Grain', 'Root'];

  @override
  Widget build(BuildContext context) {
    List<Product> filtered = selectedCategory == 'All'
        ? products
        : products.where((p) => p.category == selectedCategory).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Explore Products'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: DropdownButton<String>(
              value: selectedCategory,
              onChanged: (value) => setState(() => selectedCategory = value!),
              items: categories.map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(10),
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 3 / 2),
              itemCount: filtered.length,
              itemBuilder: (context, index) {
                final product = filtered[index];
                return Card(
                  elevation: 3,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(product.name, style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('${product.region}'),
                        Text('GHS ${product.price}'),
                        SizedBox(height: 5),
                        ElevatedButton(
                          onPressed: () {
                            // TODO: Navigate to details
                          },
                          child: Text('View'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
