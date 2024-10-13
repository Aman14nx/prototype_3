import 'package:flutter/material.dart';
import 'package:prototype_3/Screens/Dashboard/const_dash/constant.dart'; // Ensure selectionColor is defined here.
import 'package:prototype_3/Screens/Dashboard/data/side_menu_data.dart'; // Ensure correct path.

class SideMenuWidget extends StatefulWidget {
  const SideMenuWidget({Key? key}) : super(key: key); // Added null safety.

  @override
  State<SideMenuWidget> createState() => _SideMenuWidgetState();
}

class _SideMenuWidgetState extends State<SideMenuWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final data = SideMenuData(); // Ensure SideMenuData is defined properly.

    if (data.menu.isEmpty) {
      // Handle case where the menu is empty.
      return const Center(child: Text('No menu items available.'));
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      color: const Color(0xFF171821),
      child: ListView.builder(
        itemCount: data.menu.length,
        itemBuilder: (context, index) => buildMenuEntry(data, index),
      ),
    );
  }

  Widget buildMenuEntry(SideMenuData data, int index) {
    final isSelected = selectedIndex == index;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        color: isSelected ? selectionColor : Colors.transparent,
      ),
      child: InkWell(
        onTap: () => _onMenuTap(data, index), // Extracted logic to a function.
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
              child: Icon(
                data.menu[index].icon,
                color: isSelected ? Colors.black : Colors.grey,
              ),
            ),
            Text(
              data.menu[index].title,
              style: TextStyle(
                fontSize: 16,
                color: isSelected ? Colors.black : Colors.grey,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onMenuTap(SideMenuData data, int index) {
    setState(() {
      selectedIndex = index;
    });

    if (data.menu[index].title == "Sign Out") {
      // Ensure the '/login' route is defined in your main.dart file.
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/login',
        (route) => false, // Clear the entire route stack.
      );
    }
  }
}
