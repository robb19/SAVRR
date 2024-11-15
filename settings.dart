import 'package:flutter/material.dart';
import 'package:home/aboutus.dart';
import 'package:home/feedback.dart';
import 'package:home/main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SettingsScreen(),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                      },
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Settings",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 48),
                ],
              ),
              SizedBox(height: 70),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "General",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(height: 12),
              buildMenuItem(
                context,
                Icons.feedback_outlined,
                "Feedback",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>FeedbackScreen()));
                  print("Feedback tapped");
                },
                boxHeight: 70.0,
              ),
              buildMenuItem(
                context,
                Icons.info_outline,
                "About us",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutUsScreen()));
                  print("About us tapped");
                },
                boxHeight: 70.0,
              ),
              Divider(thickness: 1, color: Colors.grey[400]),
              SizedBox(height: 24),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Preferences",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 12),
              buildMenuItem(
                context,
                Icons.notifications_outlined,
                "Notifications",
                isSwitch: true,
                boxHeight: 70.0,
              ),
              Divider(thickness: 2, color: Colors.grey[400]),
              Spacer(),
              Container(
                width: 320,
                height: 50,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF61B7F6), Color(0xFF8D3DF4), Color(0xFFF4CD83)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.logout, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        "SIGN OUT",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenuItem(
      BuildContext context,
      IconData icon,
      String title, {
        bool isSwitch = false,
        double boxHeight = 60.0,
        VoidCallback? onTap, // Add onTap callback
      }) {
    return InkWell(
      onTap: onTap, // Handle tap event
      child: Container(
        height: boxHeight,
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 2),
              blurRadius: 6,
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.purple),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
            if (isSwitch)
              Switch(
                value: false,
                onChanged: (value) {},
                activeColor: Colors.purple,
              )
            else
              Icon(Icons.arrow_forward_ios_outlined, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
