import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/babysitauth.dart';
import 'package:flutter_application_1/screens/feedback_screen.dart';
import 'math_module_screen.dart';
import 'english_module_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kids Learning App'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Hi!!!'),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: const Text('Register For Baby Sitting'),
              onTap: () {
                Navigator.push(context,
                MaterialPageRoute(builder: (context)=> BabysitterRegistrationPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: const Text('Feedback'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FeedbackScreen()),
                );
                // Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Todlearn.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MathModuleScreen()),
                  );
                },
                child: Text('Learn Maths'),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EnglishModuleScreen()),
                  );
                },
                child: Text('Learn English'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
