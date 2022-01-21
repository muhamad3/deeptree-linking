import 'package:cloud_firestore/cloud_firestore.dart';

final String bio = "this is a bio";

final String name = "muhamad";
final String title = "the title";
final String location = "halabja";
final String looking = "looking for a job";



set() async {
  DocumentSnapshot variable = await FirebaseFirestore.instance
      .collection('links')
      .doc('xPsgCpGNiPV4g84k6c4A')
      .get();

  
}

class links {
  String image;
  String? type;
  String? link;
  links(this.image,this.type, this.link);
}

List<links> link = [
  links(
    'https://akm-img-a-in.tosshub.com/indiatoday/images/story/202001/linked-in-2668692_1280__1_.png?iLytbaNXkyfhWUpdjW8tVCXWTf82TTDz&size=770:433',
    'linkedin',
    'https://www.linkedin.com/in/muhamad-tahsin-29b80a1a9',
  ),
  links(
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLkVuxzk1cUDg0a2o-z98SWGHdGMjKs1jA4AKT7dXo2NrasSdGSiewn_lu8mh2bxp_dS4&usqp=CAU',
    'stackowerflow',
      'https://stackoverflow.com/users/14649300/muhamad-tahsin'),
  links(
   'https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png',
   'github',
     'https://github.com/muhamad3'),
];
