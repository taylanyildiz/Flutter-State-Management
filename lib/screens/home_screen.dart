import 'package:flutter/material.dart';
import 'package:flutter_state_management/screens/provider_exam.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    Key? key,
    this.title,
  }) : super(key: key);
  final String? title;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width * .7,
              child: MaterialButton(
                child: Text('Provider Exam'),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProviderExam())),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
