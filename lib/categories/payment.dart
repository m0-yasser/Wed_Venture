import 'package:flutter/material.dart';
import 'package:wedventure_3/Widgets/paymobManager.dart';
import 'package:url_launcher/url_launcher.dart';


class payment extends StatefulWidget{
  const payment({super.key});

  @override
  _paymentState createState() => _paymentState();
}
class _paymentState extends State<payment>{
  String? paymethod ;


  Future<void> _pay() async{
    PaymobManager().getPaymentKey(
        10,"EGP"
    ).then((String paymentKey) {
      launchUrl(
        Uri.parse('https://accept.paymob.com/api/acceptance/iframes/846257?payment_token=$paymentKey'),
      );
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.white,
                  width: 2,
                ),
              ),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Colors.black, // Set icon color
                  ),
                ),
                // Add other widgets here if needed
              ],
            ),
          ),
          Container(
            width: 250,
            height: 80,// Set the width of the container
            color: const Color.fromRGBO(201, 165, 165, 1), // background color
            padding: const EdgeInsets.only(top: 10), // Add left padding
            child: const Center(
              child: Text(
                'Payment',
                style: TextStyle(
                  fontSize: 36,
                  fontFamily: 'worksans',//  font size
                  fontWeight: FontWeight.bold, // Make text bold
                  color: Colors.white, //  text color
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white, // Set border color
                width: 2, // Set border width
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                'Choose your payment method',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'worksans',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          RadioListTile(
            title: Text(
              "Cash",
              style: TextStyle(
                fontSize: 24, // Set text size
                color: Colors.white, // Set text color
              ),
            ),
            value: "Cash",
            groupValue: paymethod,
            activeColor: Colors.white,
            onChanged: (val) {
              setState(() {
                paymethod = val;
              });
            },
          ),

          RadioListTile(
            title: Text(
              "Visa",
              style: TextStyle(
                fontSize: 24, // Set text size
                color: Colors.white, // Set text color
              ),
            ),
            value: "Visa",
            groupValue: paymethod,
            activeColor: Colors.white,
            onChanged: (val) {
              setState(() {
                paymethod = val;
              });
            },
          ),

          RadioListTile(
            title: Text(
              "PayPal",
              style: TextStyle(
                fontSize: 24, // Set text size
                color: Colors.white, // Set text color
              ),
            ),
            value: "PayPal",
            groupValue: paymethod,
            activeColor: Colors.white,
            onChanged: (val) {
              setState(() {
                paymethod = val;
              });
            },
          ),
          SizedBox(height: 20,),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 200,
              child: TextButton(
                onPressed: ()async=> _pay (),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(const Color(0xE5C8A4A4)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: const BorderSide(color: Colors.white, width: 5),
                    ),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(left: 15, top: 6),
                  child: Text(
                    'Book',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontFamily: 'WendyOne',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}