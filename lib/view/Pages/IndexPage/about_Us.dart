import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("About Us"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Color(0xfac8b8b),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "About",
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "Construction” is the application which is helpful"
                        " for those who are planning to construct a house or"
                        " a building. If there is any concern about the "
                        "application or want to talk about this app with "
                        "developers you can contact us anytime ",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                "Our Team",
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Container(
                  child: Wrap(
                    children: [
                      Container(
                        child: Column(children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(
                              'lib/assets/images/bigyan.jpg',
                            ),
                            minRadius: 45,
                            maxRadius: 45,
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            "Bigyan Prajapati",
                            style: TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text("Designer")
                        ]),
                      ),
                      SizedBox(width: 20.0),
                      Container(
                        child: Column(children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(
                              'lib/assets/images/suraj.jpg',
                            ),
                            minRadius: 45,
                            maxRadius: 45,
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            "Suraj Shrestha",
                            style: TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("Developer")
                        ]),
                      ),
                      SizedBox(height: 35.0),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          child: Column(children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                'lib/assets/images/suresh.jpg',
                              ),
                              minRadius: 45,
                              maxRadius: 45,
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              "Suresh Shrestha",
                              style: TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text("Developer")
                          ]),
                        ),
                      ),
                      SizedBox(height: 35.0,width: 35.0,),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(
                                  'lib/assets/images/ujjwal.jpg',
                                ),
                                minRadius: 45,
                                maxRadius: 45,
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                "Ujjwal Khadka",
                                style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text("Designer")
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
