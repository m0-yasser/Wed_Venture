import 'package:flutter/material.dart';

class navigate extends StatefulWidget{
  const navigate({super.key});

  @override
  State<navigate> createState() => _navigateState();
}

class _navigateState extends State<navigate>{
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(201, 165, 165, 1),
        borderRadius: BorderRadius.circular(50), // Border radius of 50
        border: Border.all(width: 1.6, color: Colors.white), // Pink border
      ),
      child: ClipRRect( // Clip the rounded corners
        borderRadius: BorderRadius.circular(50), // Border radius of 50
        child: BottomNavigationBar(
          backgroundColor: const Color.fromRGBO(201, 165, 165, 1), // Background color
          selectedItemColor: Colors.black, // Color of selected item
          unselectedItemColor: Colors.black, // Color of unselected items
          selectedLabelStyle: const TextStyle(color: Colors.white),
          unselectedLabelStyle: const TextStyle(color: Colors.white),
          items: [
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.all(2), // Padding around the icon
                decoration: const BoxDecoration(
                  shape: BoxShape.circle, // Circular shape
                  color: Colors.white, // White background color
                ),
                child: IconButton(onPressed: (){Navigator.pushNamed(context, 'Home');}, icon: const Icon(Icons.home,size: 24,)),

                // Icon for the "Home" page
              ),
              label: 'Home',
            ),

            BottomNavigationBarItem(
              icon: Container( // Container for the icon with pink border
                padding: const EdgeInsets.all(2), // Padding around the icon
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,// Circular shape
                ),
                child: IconButton(onPressed: (){Navigator.pushNamed(context, 'booking');}, icon: const Icon(Icons.shopping_cart,size: 24,)), // Icon for the "Booking" page
              ),
              label: 'Bookings',
            ),
            BottomNavigationBarItem(
              icon: Container( // Container for the icon with pink border
                padding: const EdgeInsets.all(2), // Padding around the icon
                decoration: const BoxDecoration(
                  shape: BoxShape.circle, // Circular shape
                  color: Colors.white,
                ),
                child: IconButton(onPressed: (){Navigator.pushNamed(context, 'chat');}, icon: const Icon(Icons.chat,size: 24,)), // Icon for the "Inbox" page
              ),
              label: 'Inbox',
            ),
            BottomNavigationBarItem(
              icon: Container( // Container for the icon with pink border
                padding: const EdgeInsets.all(2), // Padding around the icon
                decoration: const BoxDecoration(
                  shape: BoxShape.circle, // Circular shape
                  color: Colors.white,
                ),
                child: IconButton(onPressed: (){Navigator.pushNamed(context, 'profile');}, icon: const Icon(Icons.person,size: 24,)), // Icon for the "Profile" page
              ),
              label: 'Profile',
            ),
          ],
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }


}