import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          title: const Text('EOS ToDoList'),
          leading: Icon(Icons.check_box_outlined),
        ),

        body: Container(
          height: 200,
          color: Colors.lightGreen.withOpacity(0.3),
          padding: EdgeInsets.all(25),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 10, color: Colors.grey),
                  color: Colors.white, // color 속성을 여기에 포함
                ),
                width: 150,
                height: 150,
                child: Center(
                  child: Icon(
                    Icons.person,
                    size: 100,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(width: 10),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('EOS'),
                  Text(
                    '정서준',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  Text('안녕하세요~'),
                ]

              )

            ],
          ),
        ),
      ),
    );
  }
}

