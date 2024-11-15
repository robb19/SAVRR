import 'package:flutter/material.dart';
import 'package:home/Budget.dart';
import 'package:home/settings.dart';

void main() {
  runApp(ExpenseTrackerApp());
}

class ExpenseTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Tracker',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Container(
              width: 40, // Adjust size as needed
              height: 40, // Adjust size as needed
              decoration: BoxDecoration(
                color: Colors.white, // White background for the box
                borderRadius: BorderRadius.circular(8), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1), // Subtle shadow
                    spreadRadius: 2,
                    blurRadius: 4,
                  ),
                ],
              ),
              child: IconButton(
                icon: Icon(Icons.settings, color: Colors.grey),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsScreen()));
                  // Add functionality here
                },
              ),
            ),
          ),
        ],

        flexibleSpace: Stack(
          children: [
            // Profile image (yellow CircleAvatar) in the top-left corner
            Positioned(
              left: 16,
              top: 55,
              child: CircleAvatar(
                radius: 23,
                backgroundImage: NetworkImage(
                  'https://scontent.xx.fbcdn.net/v/t1.15752-9/462581757_1070409021211120_8049508272807746881_n.jpg?stp=dst-jpg_s2048x2048&_nc_cat=104&ccb=1-7&_nc_sid=0024fc&_nc_eui2=AeEDusPlJNd7fOh_3GCtJsbZE2vzw76S5eYTa_PDvpLl5pW_-CkWGGOYYnMQ2tF4VOtCMEQizntUbMU2NiLDyxPp&_nc_ohc=IXORYDqer-AQ7kNvgHp1-I3&_nc_ad=z-m&_nc_cid=0&_nc_zt=23&_nc_ht=scontent.xx&oh=03_Q7cD1QEceCJ-uH4cBVBeTgPIIZ19D_brxeEJiyi_RO27YUIoUQ&oe=675CCE7B', // Replace with the URL of your image
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Balance Card
            Container(
              padding: EdgeInsets.all(40.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  colors: [Color(0xFF61B7F6), Color(0xFF8D3DF4), Color(0xFFF4CD83)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Total Balance',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '₱000.00',
                    style: TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('\u20B1', style: TextStyle(color: Colors.white70, fontSize: 18)), // Peso symbol
                              SizedBox(width: 4),
                              Text('Budget', style: TextStyle(color: Colors.white70)),
                            ],
                          ),
                          Text('₱2,500,000', style: TextStyle(color: Colors.white70, fontSize: 18, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('Expenses', style: TextStyle(color: Colors.white70)),
                          Text('₱800.00', style: TextStyle(color: Colors.white70, fontSize: 18, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            // Transactions Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Transactions', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                TextButton(
                  onPressed: () {},
                  child: Text('View All', style: TextStyle(color: Colors.deepPurple)),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(icon: Icon(Icons.home, color: Colors.deepPurple), onPressed: () {}),
            IconButton(icon: Icon(Icons.bar_chart, color: Colors.deepPurple), onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>BudgetScreen()));
            }),
          ],
        ),
      ),
      floatingActionButton: Stack(
        alignment: Alignment.center,
        children: [
          // Gradient Background for Floating Action Button
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Color(0xFF61B7F6), Color(0xFF8D3DF4), Color(0xFFF4CD83)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Floating Action Button with Transparent Background
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.transparent, // Make the button itself transparent
            elevation: 0,
            child: Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildTransactionItem(String title, String amount, String date, IconData icon, Color iconColor) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: iconColor,
          child: Icon(icon, color: Colors.black),
        ),
        title: Text(title),
        subtitle: Text(date),
        trailing: Text(amount, style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}

