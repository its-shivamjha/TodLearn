import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  double _rating = 0.0;
  String _name = '';

  Future<void> submitFeedback() async {
    try {
      // Initialize Firestore
      await Firebase.initializeApp();
      final firestore = FirebaseFirestore.instance;

      // Collection reference for 'feedback'
      final feedbackCollection = firestore.collection('feedback');

      // Create a new document with provided data
      await feedbackCollection.add({
        'name': _name,
        'rating': _rating,
      });

      // Display success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Feedback submitted successfully!'),
        ),
      );
    } catch (e) {
      // Display error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to submit feedback. Please try again.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Provide your feedback',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Your Name',
                ),
                onChanged: (value) {
                  setState(() {
                    _name = value;
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            Slider(
              value: _rating,
              min: 0,
              max: 5,
              divisions: 5,
              onChanged: (value) {
                setState(() {
                  _rating = value;
                });
              },
              label: _rating.toString(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: submitFeedback,
              child: Text('Submit Feedback'),
            ),
          ],
        ),
      ),
    );
  }
}
