import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../config/GlobalParams.dart';
import 'expeduction.dart';
import 'home.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({Key? key}) : super(key: key);

  @override
  _PortfolioState createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  bool isDarkMode = false;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => expeduction()),
        );

        break;
      case 2:
        // Navigate to the Portfolio page if index is 2
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Portfolio()),
        );
        break;
    }
  }

  void toggleDarkMode() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceWebView: true,
        forceSafariVC: false, // Set to true if using iOS
      );
    } else {
      // If the URL can't be launched, open it in a web browser
      await launch(url, forceWebView: false);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
        shadowColor: isDarkMode ? Colors.white : Colors.black,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              color: isDarkMode ? Colors.white : Colors.black,
              icon: isDarkMode
                  ? const Icon(Icons.sunny, size: 40)
                  : const Icon(Icons.dark_mode_outlined, size: 40),
              onPressed: toggleDarkMode,
            ),
          )
        ],
        title: Text(
          'Portfolio',
          style: isDarkMode
              ? const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                )
              : const TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'My Work:',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              GridView.builder(
                itemCount: GlobalParams.works.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.8,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  Map<String, dynamic> item = GlobalParams.works[index];
                  return GestureDetector(
                    onTap: () {
                      // Add your onTap logic here
                       _launchURL(item['urls']);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: isDarkMode ? Colors.grey[800] : Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network(
                            item['img'], // Use the image URL from the data
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  item['title'], // Use the title from the data
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: isDarkMode ? Colors.white : Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                   item['Description'], // You can add a description field in your data
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: isDarkMode ? Colors.white : Colors.black,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.black : Colors.white,
          boxShadow: isDarkMode
              ? [
                  BoxShadow(
                      color: Colors.white,
                      blurRadius: 10.0,
                      spreadRadius: 1.0,
                      offset: const Offset(0, 2)),
                ]
              : [
                  BoxShadow(
                      color: Colors.black,
                      blurRadius: 10.0,
                      spreadRadius: 1.0,
                      offset: const Offset(0, 2)),
                ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Personal Information',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.file_copy),
              label: 'Experience and Education',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.work),
              label: 'Portfolio',
            ),
          ],
          selectedItemColor: isDarkMode ? Colors.white : Colors.black,
          unselectedItemColor: isDarkMode ? Colors.white : Colors.black,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
