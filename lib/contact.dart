import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactezNous extends StatefulWidget {
  const ContactezNous({Key? key}) : super(key: key);

  @override
  _ContactezNousState createState() => _ContactezNousState();
}

class _ContactezNousState extends State<ContactezNous> {
  List data=[
    {
      "name":"Facebook",
      "url":"https://www.facebook.com",
      "icon": FontAwesomeIcons.facebook,
      "color":Colors.blueAccent
    },

    {
      "name":"Instagram",
      "url":"https://www.instagram.com",
      "icon": FontAwesomeIcons.instagram,
      "color":Colors.red
    },

    {
      "name":"Twitter",
      "url":"https://www.twitter.com",
      "icon": FontAwesomeIcons.twitter,
      "color":Colors.lightBlueAccent
    },

    {
      "name":"Email",
      "url":"https://www.twitter.com",
      "icon": Icons.mail,
      "color":Colors.deepOrange
    },
    {
      "name":"Telephone",
      "url":"+22650903112",
      "icon": FontAwesomeIcons.phone,
      "color":Colors.deepPurple
    }

  ];


  void _launchURL(String _url) async {

if(!await launch(_url)) throw 'Ne peut pas trouver $_url';

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white.withOpacity(0),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      body: ListView(
        children: data.map((item)
      {
        return Card(

          child: ListTile(
            onTap: () => _launchURL(item['url']),
            leading: CircleAvatar(
              backgroundColor: Colors.grey.shade100,
              child: FaIcon(
                item ['icon'],
                color: item['color'],
                size: 25,
              ),
            ),

            title: Text(
              item['name'],
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            subtitle: Text(item['url']),
            trailing: IconButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: () => _launchURL(item['url']),
            ),
          ),

        );
  }
  ).toList(),
      ),
    );
  }
}
