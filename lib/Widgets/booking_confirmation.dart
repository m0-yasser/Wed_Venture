import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BookingConfirmation extends StatelessWidget {
  final String bookingId;

  BookingConfirmation({required this.bookingId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance.collection('Bookings').doc(bookingId).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData && snapshot.data != null) {
            var data = snapshot.data!.data() as Map<String, dynamic>;
            return Scaffold(
              appBar: AppBar(
                title: Text("Booking Confirmation"),
              ),
              body: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name: ${data['Full_name']}"),
                    Text("Email: ${data['Email']}"),
                    Text("Phone Number: ${data['Phone_number']}"),
                    Text("Deposit: ${data['Deposit']}"),
                    Text("Booking Date: ${data['Booking_date'].toDate()}"),
                    Text("Booked: ${data['Booked']}"),
                  ],
                ),
              ),
            );
          } else {
            return Scaffold(
              body: Center(
                child: Text("No data found"),
              ),
            );
          }
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}