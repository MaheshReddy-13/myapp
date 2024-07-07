import 'package:flutter/material.dart';
import '../models/product.dart';

class CartPage extends StatefulWidget {
  final List<Product> cartItems;
  final Function(Product) onRemove;

  const CartPage({Key? key, required this.cartItems, required this.onRemove}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void _showProductDetails(Product product) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(product.title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Price: \$${product.price.toStringAsFixed(2)}'),
            const SizedBox(height: 10),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                widget.onRemove(product);
                Navigator.of(ctx).pop();
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Center(
        child: widget.cartItems.isEmpty
            ? const Text('Your cart is empty.')
            : ListView.builder(
                itemCount: widget.cartItems.length,
                itemBuilder: (ctx, index) => Card(
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(widget.cartItems[index].imageUrl),
                      radius: 30,
                    ),
                    title: Text(widget.cartItems[index].title),
                    subtitle: Text('\$${widget.cartItems[index].price.toStringAsFixed(2)}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        widget.onRemove(widget.cartItems[index]);
                        setState(() {
                          widget.cartItems.removeAt(index);
                        });
                      },
                    ),
                    onTap: () => _showProductDetails(widget.cartItems[index]),
                  ),
                ),
              ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ElevatedButton(
            onPressed: () {
              // Implement checkout functionality here
            },
            child: const Text('Checkout'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 15),
              textStyle: const TextStyle(fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
