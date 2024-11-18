import 'package:flutter/material.dart';
import 'package:untitled/screens/setting_screen.dart';
import '../widgets/add_button.dart';
import '../widgets/todo_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List toDoLists = [];
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    toDoLists.add("1111");
    toDoLists.add("2222");
    toDoLists.add("3333");
  }
  @override
  void dispose(){
    _textController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFA4C639).withOpacity(0.1),
          title: Text('EOS ToDoList'),
          leading: Container(
              padding: EdgeInsets.all(5),
              child: Image.asset(
                'assets/images/eos_logo.png',
                fit: BoxFit.contain,
              )
          ),
          actions: [
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SettingScreen()));
            }, icon: Icon(Icons.settings_rounded))
          ],
        ),
        body: Column(
          children: [
            Container(
                height: 200,
                padding: EdgeInsets.all(25),
                child: Row(children: [
                  Container(
                    width: 140,
                    height: 140,
                    // decoration: BoxDecoration(
                    // color: Colors.white,
                    //  border: Border.all(width: 10, color: Colors.grey),
                    //  borderRadius: BorderRadius.circular(250),
                    // ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(80),
                        child: Image.asset('assets/images/kijae.png', fit: BoxFit.cover,
                        )),
                  ),
                  SizedBox(
                    width: 35,
                  ),
                  Expanded(
                    child: Column (
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '정서준',
                            style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text('공부 열심히 하기 !')
                        ]
                    ),
                  )
                ])),


            Stack(
              children: [
                Padding(padding: EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 300,
                  decoration: BoxDecoration(
                    color: Color(0xFFA4C639).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: MediaQuery.of(context).size.width/2 -75,
                  child: Container(
                    width: 150,
                    height: 38,
                    decoration: BoxDecoration(
                      color: Color(0xFFA4C639).withOpacity(0.3),
                        borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        "To do list",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w600,
                        )
                      ),
                    ),

                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 80, left: 40, right: 25),
                child: Container(
                  height: MediaQuery.of(context).size.height -400,
                  child: ListView.builder(
                    itemCount: toDoLists.length,
                      itemBuilder: (BuildContext context, int index){
                              return ToDoItem(
                                title: toDoLists[index],
                                onDelete: (){
                                  setState(() {
                                    toDoLists.removeAt(index);
                                  });
                                },
                              );
                          },
                        ),

                  ),
                ),

                Positioned(
                    bottom: 30,
                    right: 50,
                    child:AddButton(
                      onPressed: _showAddToDoDialog

                  ))
              ]
            )
          ],
        ));
  }

  void _showAddToDoDialog() {
    showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
          title: Text('할 일 추가'),
          content: TextField(
            controller: _textController,
            decoration: InputDecoration(
              labelText: '할 일을 입력하세요.',
              labelStyle: TextStyle(color: Colors.black),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              counterText: '0/20',
            ),
            maxLength: 20,
          ),
          actions: [
            TextButton(onPressed: () {
                setState(() {
                  _textController.clear();
                });
                Navigator.of(context).pop();
            }, child: Text('취소', style: TextStyle(color: Colors.black),)),
            TextButton(onPressed: () {
              if (_textController.text.isNotEmpty) {
                setState(() {
                  toDoLists.add(_textController.text);
                  _textController.clear();
                });
                Navigator.of(context).pop();
              }
            }, child: Text('추가',
              style: TextStyle(color: Colors.black),)
            ),
          ],
      );
    });
  }
}
