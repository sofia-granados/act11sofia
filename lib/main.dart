import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const ChefPage(),
    );
  }
}

class ChefPage extends StatelessWidget {
  const ChefPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.menu, color: Colors.deepPurple),
        title: const Align(
          alignment: Alignment.centerRight,
          child: Text(
            "Chofy'S",
            style: TextStyle(
              color: Colors.teal,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Sección de Búsqueda ---
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.deepPurple, width: 2),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.shopping_basket_outlined, color: Colors.deepPurple),
                    hintText: 'Búsqueda',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),

            // --- Sección de Perfil ---
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text("Perfil", style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold)),
            ),
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  const CircleAvatar(
                    radius: 45,
                    backgroundColor: Colors.grey,
                    backgroundImage: NetworkImage(
                      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Sofia Granados",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),

            const Divider(height: 40),

            // --- Sección de Favoritos Actualizada ---
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text("Favoritos", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 10),
            
            SizedBox(
              height: 190,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildProductCard(
                    "Sobre whiskas", 
                    "\$12.00", 
                    "https://m.media-amazon.com/images/I/71PWYl5r2gL._AC_UF1000,1000_QL80_.jpg"
                  ),
                  _buildProductCard(
                    "Lata de premio", 
                    "\$13.00", 
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9A9qDJ40Aniz7OYM0jlUUA8C94d7QLVC95g&s"
                  ),
                  _buildProductCard(
                    "Croquetas", 
                    "\$200.00", 
                    "https://i5.walmartimages.com/asr/03035f7d-cc5d-4734-b94a-5fce76985fa0.5692cfeba0347fccf5e2ae6e0bf40142.jpeg?odnHeight=612&odnWidth=612&odnBg=FFFFFF"
                  ),
                ],
              ),
            ),

            const Divider(height: 40),

            // --- Sección de Compras ---
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text("Compras", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 40),
            const Center(
              child: Text(
                "No hay compras por el momento",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(String name, String price, String imageUrl) {
    return Container(
      width: 130,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 1.5),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          Expanded(
            child: Image.network(
              imageUrl,
              fit: BoxFit.contain,
              loadingBuilder: (context, child, progress) {
                if (progress == null) return child;
                return const Center(child: CircularProgressIndicator(strokeWidth: 2));
              },
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image, size: 40),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            name, 
            textAlign: TextAlign.center, 
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            price, 
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ],
      ),
    );
  }
}