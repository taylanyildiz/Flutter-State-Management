import 'package:flutter/material.dart';

class MobXExam extends StatefulWidget {
  @override
  _MobXExamState createState() => _MobXExamState();
}

class _MobXExamState extends State<MobXExam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MobX Exam'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () =>
              Navigator.popUntil(context, (route) => route.isFirst),
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
    );
  }
}
