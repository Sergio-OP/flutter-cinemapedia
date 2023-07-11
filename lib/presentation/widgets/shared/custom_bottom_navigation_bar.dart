import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavgationBar extends StatelessWidget {
  const CustomBottomNavgationBar({super.key});

  int _getCurrentIndex(BuildContext context){
    final String location = GoRouterState.of(context).location;
    switch (location) {
      case '/':
        return 0;
      case '/categories':
        return 1;
      case '/favorites':
        return 2;
      default:
        return 0;
    }
  }


  void _onItemTapped(BuildContext context, int index){
    switch (index) {
      case 0:
        context.go('/');
        break;
      case 1:
        context.go('/');
        break;
      case 2:
        context.go('/favorites');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) => _onItemTapped(context, index),
      currentIndex: _getCurrentIndex(context),
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