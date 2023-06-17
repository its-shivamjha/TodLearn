import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home_screen.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/mickss.jpg'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
            ),
            Container(
              padding: EdgeInsets.only(left: 100, top: 130),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                         
                          SizedBox(
                            height: 30,
                          ),
                         
                          SizedBox(
                            height: 70,
                          ),
                          Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                             
                              Padding(
                                padding: const EdgeInsets.all(130.0),
                              
                              child: Center(
                              child: CircleAvatar(
                                radius: 40,
                                backgroundColor: Color(0xff4c505b),
                                child: IconButton(
                                    color: Colors.white,
                                    onPressed: () {
                                      Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => HomeScreen(),
                                    ));
                                    },
                                    icon: Icon(
                                      Icons.arrow_forward,
                                    )),
                              ),),)
                            ],
                          ),),
                          SizedBox(
                            height: 30,
                          ),
                          
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}