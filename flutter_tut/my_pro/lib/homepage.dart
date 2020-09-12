import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var api = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail";
  var res;
  var drinks;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    res = await http.get(api);
    drinks = jsonDecode(res.body)["drinks"];
    print(drinks.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: Text("Cocktail App"),
        elevation: 0.0,
      ),
      body: Center(
        child: res != null
            ? ListView.builder(
                itemCount: drinks.length,
                itemBuilder: (context, index) {
                  var drink = drinks[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(drink["strDrinkThumb"]),
                    ),
                    title: Text(
                      "${drink["strDrink"]}",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      "${drink["idDrink"]}",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              )
            : CircularProgressIndicator(backgroundColor: Colors.white),
      ),
    );
  }
}

// class indiawidget extends StatelessWidget {
//   const indiawidget({
//     Key key,
//     @required this.myText,
//   }) : super(key: key);

//   final String myText;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         Image.network(
//           "https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1200px-Flag_of_India.svg.png",
//           fit: BoxFit.contain,
//           height: 200.0,
//           width: 200.0,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               myText,
//               textScaleFactor: 2.0,
//             ),
//             SizedBox(
//               width: 50.0,
//             ),
//             FlatButton(
//               color: Colors.white,
//               onPressed: () {
//                 // myText = "Hindustani";
//                 // print(myText);
//                 // setState(() {});
//               },
//               child: Text("press me!"),
//             )
//           ],
//         )
//       ],
//     );
//   }
// }
