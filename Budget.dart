import 'package:flutter/material.dart';
import 'package:home/main.dart';
import 'package:home/settings.dart';

void main() {

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BudgetScreen(),
    );
  }
}

class BudgetScreen extends StatefulWidget {
  @override
  _BudgetScreenState createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {
  bool isBudgetSelected = true; // Track which tab is selected

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // AppBar Row with Back and Settings Icons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back Button with White Box
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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                      },
                    ),
                  ),
                  Text(
                    "Budget",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Settings Button with White Box
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
                      icon: Icon(Icons.settings),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsScreen()));
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Tab bar with "Budget" and "Expenses" options
              Container(
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // Budget Tab with Gradient Background
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isBudgetSelected = true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: isBudgetSelected
                                ? LinearGradient(
                              colors: [
                                Color(0xFF61B7F6),
                                Color(0xFF8D3DF4),
                                Color(0xFFF4CD83),
                              ],
                            )
                                : null,
                            color: isBudgetSelected ? null : Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Center(
                            child: Text(
                              "Budget",
                              style: TextStyle(
                                color: isBudgetSelected ? Colors.white : Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Expenses Tab
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isBudgetSelected = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: !isBudgetSelected
                                ? LinearGradient(
                              colors: [
                                Color(0xFF61B7F6),
                                Color(0xFF8D3DF4),
                                Color(0xFFF4CD83),
                              ],
                            )
                                : null,
                            color: !isBudgetSelected ? null : Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Center(
                            child: Text(
                              "Expenses",
                              style: TextStyle(
                                color: !isBudgetSelected ? Colors.white : Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),

              // History Label
              Text(
                "History",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),

            ],
          ),
        ),
      ),
    );
  }

  Widget buildTransactionItem({required IconData icon, required String amount, required String date}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, size: 32, color: Colors.grey[700]),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              amount,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            date,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
