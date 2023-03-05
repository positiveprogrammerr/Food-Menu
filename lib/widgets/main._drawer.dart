import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget _buildMenuItem(IconData icon,String title,Function() handle){
      return ListTile(
        onTap: handle,
        leading:  Icon(icon),
        title:  Text(title),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: const Text('Menu'),
          ),
          _buildMenuItem(Icons.home,'Main Page',(){
            Navigator.pushReplacementNamed(context,'/');
          }),
          const Divider(height: 0),
          _buildMenuItem(Icons.category,'Products',(){
            Navigator.pushReplacementNamed(context,'/products');
          }),
        ],
      ),
    );
  }
}