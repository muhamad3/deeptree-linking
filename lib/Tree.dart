import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'config.dart';

class Tree extends StatefulWidget {
  const Tree({Key? key}) : super(key: key);

  @override
  _TreeState createState() => _TreeState();
}

class _TreeState extends State<Tree> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(
          child: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Image.network(
            'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
            width: 100,
            height: 100,
            alignment: Alignment.center,
          ),
          Text(looking),
          SizedBox(
            height: 50,
          ),
          Container(
            child: Text(
                'name:$name      title:$title          location:$location'),
          ),
          Container(
            child: Divider(
              color: Colors.black,
            ),
            height: 10,
          ),
          Container(
            child: Text(bio),
            margin: EdgeInsets.only(top: 5),
          ),
          Container(
              child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return _link(index);
            },
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  iconSize: 40,
                  padding: EdgeInsets.all(20),
                  onPressed: () => launch("tel://07508567486"),
                  icon: FaIcon(FontAwesomeIcons.phone,color: Colors.blueAccent,)
                  ),
                    IconButton(
                  iconSize: 40,
                  padding: EdgeInsets.all(20),
                  onPressed: openwhatsapp,
                  icon:  FaIcon(FontAwesomeIcons.whatsappSquare,color: Colors.green,))
            ],
          )
        ],
      )),
    ));
  }

//   Widget _links(int index) {
//     return Container(
//       padding: EdgeInsets.all(8),
//       margin: EdgeInsets.only(top: 10, right: 10, left: 10),
//       // ignore: prefer_const_constructors
//       decoration: BoxDecoration(
//           color: Colors.redAccent,
//           borderRadius: const BorderRadius.all(
//             Radius.circular(8),
//           )),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           Image.network(link[index].image, height: 50, width: 50),
//           TextButton(
//               onPressed: () =>
//                   _launchURL(link[index].link ?? 'no link available'),
//               child: Text(link[index].type ?? 'dont have one'))
//         ],
//       ),
//     );
//   }
// }

  openwhatsapp() async {
    var whatsapp = "+919144040888";
    var whatsappURl_android =
        "whatsapp://send?phone=" + whatsapp + "&text=hello";
    var whatappURL_ios = "https://wa.me/$whatsapp?text=${Uri.parse("hello")}";

    // android , web
    if (await canLaunch(whatsappURl_android)) {
      await launch(whatsappURl_android);
    }
  }

  void _launchURL(String url) async {
    if (!await launch(url)) throw 'Could not launch';
  }

  Widget _link(int index) {
    return Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(top: 10, right: 10, left: 10),
        // ignore: prefer_const_constructors
        decoration: BoxDecoration(
            color: Colors.redAccent,
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            )),
        child: TextButton(
            onPressed: () => index == 0
                ? lauchlikein()
                : index == 1
                    ? lauchstack()
                    : lauchgithub(),
            child: Text(index == 0
                ? 'linkedin'
                : index == 1
                    ? 'stackoverflow'
                    : 'github')));
  }

  lauchlikein() async {
    DocumentSnapshot variable = await FirebaseFirestore.instance
        .collection('links')
        .doc('xPsgCpGNiPV4g84k6c4A')
        .get();
    final String look = variable['linkedin'];
    _launchURL(look);
  }

  lauchstack() async {
    DocumentSnapshot variable = await FirebaseFirestore.instance
        .collection('links')
        .doc('xPsgCpGNiPV4g84k6c4A')
        .get();
    final String look = variable['stackoverflow'];
    _launchURL(look);
  }

  lauchgithub() async {
    DocumentSnapshot variable = await FirebaseFirestore.instance
        .collection('links')
        .doc('xPsgCpGNiPV4g84k6c4A')
        .get();
    final String look = variable['github'];
    _launchURL(look);
  }
}
