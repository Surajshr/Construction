import 'dart:convert';


// import 'package:checkbox/widget/switchButton.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  List users = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  fetchUser() async {
    var url = "https://randomuser.me/api/?results=10";
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var items = jsonDecode(response.body)['results'];
      setState(() {
        users = items;
      });
    } else {
      setState(() {
        users = [];
      });
    }
    // print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Worker list"),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    List items = [
      "1",
      "2",
    ];
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return getCard(users[index]);
        });
  }

  Widget getCard(item) {
    var fullname =item['name']['title'] +" "+item['name']['first'];
    var username =item['login']['username'];
    var pictureURL =item['picture']['large'];
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListTile(
          title: Row(
            children: <Widget>[
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    // color: primary,
                    borderRadius: BorderRadius.circular(60 / 2),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            pictureURL.toString()))),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(fullname.toString(), style: TextStyle(fontSize: 18.0)),
                  Text(username.toString(),
                      style: TextStyle(color: Colors.grey)),

                  SizedBox(
                    height: 10,
                  ),
                  Text("Staff",
                      style: TextStyle(color: Colors.grey)),
                ],
              )
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  margin: EdgeInsets.only(right: 0.0),
                  // width: MediaQuery.of(context).size.width,
                  // height: MediaQuery.of(context).size.height,
                  // color:Colors.amber,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                          padding: EdgeInsets.all(1.00),
                          child: Transform.scale(
                            scale: 0.6,
                            child: LiteRollingSwitch(
                              value: false,
                              textOn: 'Present',
                              textOff: "Absent",
                              colorOff: Colors.red,
                              colorOn: Colors.green,
                              iconOn: Icons.done,
                              //Alphabet P
                              iconOff: Icons.assistant_photo,
                              //alphabet A

                              textSize: 20.0,
                              onTap: () {
                                print("button has benn pressed");
                              },
                              onChanged: (bool position) {
                                print("The Button is $position");
                              },
                            ),
                          ))
                    ],
                  )),

              // IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
              // toogleButton(),
            ],
          ),
        ),
      ),
    );
  }
}
