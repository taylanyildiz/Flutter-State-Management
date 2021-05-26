import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management/models/counter_bloc.dart';

class BlocExam extends StatefulWidget {
  @override
  _BlocExamState createState() => _BlocExamState();
}

class _BlocExamState extends State<BlocExam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Exam'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: () =>
              Navigator.popUntil(context, (route) => route.isFirst),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, int>(
              builder: (context, value) => Text(
                '${value}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            MaterialButton(
              child: Text('Increment'),
              color: Colors.red,
              textColor: Colors.white,
              onPressed: () => context.read<CounterBloc>().increment(),
            ),
            MaterialButton(
              child: Text('Decrease'),
              color: Colors.blueAccent,
              textColor: Colors.white,
              onPressed: () => context.read<CounterBloc>().decrease(),
            )
          ],
        ),
      ),
    );
  }
}
