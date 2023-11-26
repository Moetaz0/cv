import 'package:cv/pages/expeduction.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Portfolio.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
  void _launchPhone() async {
    const url = 'tel:+21692282590';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }



  _launchEmail() async {
    const email = 'metzab15@gmail.com';
    final Uri params = Uri(scheme: 'mailto', path: email);
    final url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }



  void _launchFacebook() async {
    final urlScheme = 'fb://facewebmodal/f?href=https://www.facebook.com/MrGus.shocked?mibextid=ZbWKwL';

    try {

      await launch(urlScheme, forceSafariVC: false);

      // If the app is not installed, open the browser

    } catch (e) {
      // If an error occurs, print it to the console
      print('Error launching Facebook: $e');
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
            padding: EdgeInsets.only(right: 10.0),
            child: IconButton(
              color: isDarkMode ? Colors.white : Colors.black,
              icon: isDarkMode
                  ? Icon(Icons.sunny, size: 40)
                  : Icon(Icons.dark_mode_outlined, size: 40),
              onPressed: toggleDarkMode,
            ),
          )
        ],
        title: Text(
          'Moetaz Abdallah',
          style: isDarkMode
              ? TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          )
              : TextStyle(
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
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: isDarkMode? Border.all(color: Colors.white, width: 2):Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 120,
                    height: 200,
                    // Replace the placeholder with your actual photo
                    child: Image.asset(
                      'images/profile.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Moetaz Abdallah',
                        style: TextStyle(
                          fontSize: 24,
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Student',
                        style: TextStyle(
                          fontSize: 16,
                          color: isDarkMode ? Colors.white : Colors.grey,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.greenAccent.shade100,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: IconButton(
                              onPressed: _launchPhone,
                              icon: Icon(
                                Icons.phone,
                                size: 30,
                                color: Colors.green,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: IconButton(
                              onPressed: _launchEmail,
                              icon: Icon(
                                Icons.email,
                                size: 30,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.lightBlue.shade100,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: IconButton(
                              onPressed: _launchFacebook,
                              icon: Icon(
                                Icons.facebook,
                                size: 30,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'I am a skilled and talented IT student at ISET Sfax, 21 years old. I have a passion for technology and a strong desire to learn and grow. My expertise includes various programming languages and technologies. I am a quick learner and a dedicated team player. I am enthusiastic about taking on new challenges and contributing to the world of technology',
                style: TextStyle(
                  fontSize: 16,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Address:',
                    style: TextStyle(
                      fontSize: 18,
                      color: isDarkMode ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 30, color: isDarkMode ? Colors.white : Colors.black,),
                      SizedBox(width: 10),
                      Text(
                        'Rte Mahdia 3.5km, Sfax, Tunisia',
                        style: TextStyle(
                          fontSize: 18,
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      border: isDarkMode? Border.all(color: Colors.white, width: 2):Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 300,
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: LatLng(34.7573643, 10.7724747),
                        zoom: 15,
                      ),
                      markers: {
                        Marker(
                          markerId: MarkerId('marker_id'),
                          position: LatLng(34.7573643, 10.7724747),
                          infoWindow: InfoWindow(title: 'Marker Title', snippet: 'Marker Snippet'),
                        ),
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
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
              offset: Offset(0, 2),
            )
          ]
              : [
            BoxShadow(
              color: Colors.black,
              blurRadius: 10.0,
              spreadRadius: 1.0,
              offset: Offset(0, 2),
            )
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Personnel information',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.file_copy),
              label: 'exp and education',
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
