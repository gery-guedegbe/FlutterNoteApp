import 'package:flutter/material.dart';
import 'package:myapp/Screens/Add List/add_todo.dart';
import 'package:myapp/model/list_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Product> _products = products;

  void _addNewProduct(Product product) {
    setState(() {
      _products.add(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.2),
              spreadRadius: 2.0,
              blurRadius: 8.0,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.space_dashboard_rounded),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person_outline_rounded),
            ),
            InkWell(
              onTap: () async {
                final newProduct = await Navigator.push<Product>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Addtodo(),
                  ),
                );
                if (newProduct != null) {
                  _addNewProduct(newProduct);
                }
              },
              child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.blue[400],
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
              child: Container(
                height: 55,
                decoration: BoxDecoration(color: Colors.grey[200]),
                child: TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.black),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ListButton(
                  isActive: true,
                  press: () {},
                  title: 'Notes',
                ),
                ListButton(
                  press: () {},
                  title: 'To do',
                ),
                ListButton(
                  press: () {},
                  title: 'Blog',
                ),
              ],
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: _products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.80,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemBuilder: (context, index) => ListCard(
                  product: _products[index],
                  press: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListButton extends StatelessWidget {
  const ListButton({
    super.key,
    required this.title,
    required this.press,
    this.isActive = false,
  });

  final String title;
  final VoidCallback press;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: press,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 19,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          color: isActive ? Colors.blue[400] : Colors.black54,
        ),
      ),
    );
  }
}

class ListCard extends StatelessWidget {
  const ListCard({
    super.key,
    required this.product,
    required this.press,
  });
  final Product product;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: product.color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 19,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              product.desc,
              maxLines: 5,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
