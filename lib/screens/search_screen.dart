import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';

class SearchScreen extends StatelessWidget {
  final List<String> sampleResults = [
    "Fresh Tomato",
    "Organic Cucumber",
    "Red Chili",
    "Green Beans",
    "Pumpkin",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search Products")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Search...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: sampleResults.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(sampleResults[index]),
                    trailing: Icon(Icons.shopping_cart_outlined),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 1),
    );
  }
}
