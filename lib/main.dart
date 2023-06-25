import 'package:flutter/material.dart';

void main() {
  runApp(TrainSearchApp());
}

class TrainSearchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Train Search',
      home: TrainSearchPage(),
    );
  }
}

class TrainSearchPage extends StatefulWidget {
  @override
  _TrainSearchPageState createState() => _TrainSearchPageState();
}

class _TrainSearchPageState extends State<TrainSearchPage> {
  String sourceStation = '';
  String destinationStation = '';
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Train Search',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/New.png', // Replace with your image file name
              width: 200,
              height: 200,
            ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Source Station',
                hintText: 'Enter source station',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.train),
              ),
              onChanged: (value) {
                setState(() {
                  sourceStation = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Destination Station',
                hintText: 'Enter destination station',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.train),
              ),
              onChanged: (value) {
                setState(() {
                  destinationStation = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _selectDate,
              child: Text(
                selectedDate != null ? 'Selected Date: ${selectedDate!.toString().substring(0, 10)}' : 'Select Date',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _searchTrains,
              child: Text(
                'Search Trains',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Developed by Abhishek Ranjan',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.grey,
                fontSize: 12.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  void _searchTrains() {
    if (sourceStation.isEmpty || destinationStation.isEmpty || selectedDate == null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Please fill in all the fields.'),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Train Search'),
          content: Text('Searching trains for $sourceStation to $destinationStation on ${selectedDate!.toString().substring(0, 10)}.'),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}

