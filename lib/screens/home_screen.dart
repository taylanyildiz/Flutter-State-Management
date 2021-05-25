import 'package:flutter/material.dart';
import '../screens/screen.dart';

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
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width * .7,
              child: MaterialButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProviderExam())),
                child: Text('Provider Exam'),
                color: Colors.red,
                textColor: Colors.white,
              ),
            ),
            SizedBox(
              width: size.width * .7,
              child: MaterialButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MobXExam())),
                child: Text('MobX Exam'),
                color: Colors.orange,
                textColor: Colors.white,
              ),
            ),
            SizedBox(
              width: size.width * .7,
              child: MaterialButton(
                onPressed: () => print(''),
                child: Text('Bloc Exam'),
                color: Colors.blue,
                textColor: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
