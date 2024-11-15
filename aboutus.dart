
import 'package:flutter/material.dart';
import 'package:home/settings.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AboutUsScreen(),
    );
  }
}

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor:
        Colors.grey[200], // Keep app bar background color separate
        elevation: 0,
        titleSpacing:
        0, // Removes the default spacing between leading and title
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 10.0),
          child: Container(
            width: 40, // Fixed width for the container
            height: 40, // Fixed height for the container
            decoration: BoxDecoration(
              color: Colors.white, // Background color for back icon container
              borderRadius: BorderRadius.circular(8.0), // Rounded corners
            ),
            child: Center(
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black, size: 25),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsScreen()));
                },
              ),
            ),
          ),
        ),
        title: SizedBox.shrink(), // No title in AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // About Us Title in the Body
            Text(
              'About Us',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),
            // About Us Card Section
            SizedBox(
              width: MediaQuery.of(context).size.width *
                  0.9, // 70% of screen width
              height:
              MediaQuery.of(context).size.height * 0.4, // Adjust the height
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'SAVR: Expense Tracker Application',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Welcome to SAVR, the ultimate expense tracker designed to simplify the way you manage your finances. Our mission is to empower individuals to take control of their spending habits, track their transactions, and plan their budgets effectively. We understand the challenges of managing money, which is why we’ve created an intuitive platform that not only helps you log your expenses but also provides insights to improve your financial health. With features like budget planning, expense summaries, and real-time tracking, we make it easier for you to stay on top of your finances and make informed decisions.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.justify, // Justify text alignment
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
            // Divider moved to the top of Contact Us
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 30.0), // Adjust padding as needed
              child: Divider(
                color: Colors.black54,
                thickness: 1.5,
                indent: 20, // Increase the indent to widen the divider
                endIndent: 20, // Increase the endIndent to widen the divider
              ),
            ),
            // Contact Us Section
            Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: MediaQuery.of(context).size.width *
                  0.7, // Adjust width to 60% of screen width
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
                child: ListTile(
                  leading: Icon(Icons.phone, color: Colors.purple),
                  title: Text(
                    '+63 91234567890',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: MediaQuery.of(context).size.width *
                  0.7, // Adjust width to 60% of screen width
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 3,
                child: ListTile(
                  leading: Icon(Icons.email, color: Colors.purple),
                  title: Text(
                    'expensetracker@gmail.com',
                    style: TextStyle(color: Colors.black,fontSize: 15),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
