import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigationBar extends StatelessWidget {

  final int currentIndex; 

  const CustomBottomNavigationBar({super.key, required this.currentIndex});

  void onItemTapped(BuildContext context, int index){
    context.go('/home/$index');
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (value) => onItemTapped(context, value),
      elevation: 0,
      items: const [
        BottomNavigationBarItem(
          icon: Icon( Icons.home_max ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon( Icons.label_outline ),
          label: 'Categories',
        ),
        BottomNavigationBarItem(
          icon: Icon( Icons.favorite_outline ),
          label: 'Favorites',
        ),
      ],
    );
  }
}