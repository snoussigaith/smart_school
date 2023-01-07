import 'package:flutter/material.dart';
import 'package:smart_school/contact.dart';
import 'package:smart_school/login_form.dart';
import 'package:smart_school/td.dart';
import 'favourites_page.dart';
import 'devoir.dart';
import 'module.dart';
import 'people_page.dart';
import 'user_page.dart';

class NavigationDrawerWidget extends StatelessWidget {
   final String name ;
   final String prenom;
   final String email;

  const NavigationDrawerWidget({
    Key? key, required this.name, required this.prenom, required this.email,

  }) : super(key: key);

  final padding = const EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {


    const urlImage =
        'https://cdn-icons-png.flaticon.com/512/219/219986.png';

    return Drawer(
      child: Material(
        color: Colors.black87,
        child: ListView(
          children: <Widget>[
            buildHeader(
              urlImage: urlImage,
              name: "SNOUSSI" " " "GEITH",
              email: "snoussi@gmail.com",
              onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const UserPage(
                  name: "DUC" " " "ADEM",
                  urlImage: urlImage,
                ),
              )),
            ),
            Container(
              padding: padding,
              child: Column(
                children: [
               //   const SizedBox(height: 12),
                 // buildSearchField(),
                 // const SizedBox(height: 24),
                  buildMenuItem(
                    text: 'Acceuil',
                    icon: Icons.home_work,
                    onClicked: () => selectedItem(context, 0),
                  ),
                  const SizedBox(height: 16),

                  buildMenuItem(
                    text: 'Mon profil',
                    icon: Icons.person_outline_sharp,
                    onClicked: () => selectedItem(context, 1),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Notifications',
                    icon: Icons.phone_android_rounded,
                    onClicked: () => selectedItem(context, 2),
                  ),

                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Modules',
                    icon: Icons.wallet_membership_rounded,
                    onClicked: () => selectedItem(context, 3),
                  ),

                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Devoirs',
                    icon: Icons.star,
                    onClicked: () => selectedItem(context, 5),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'TD',
                    icon: Icons.work,
                    onClicked: () => selectedItem(context, 6),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Emploi du temps',
                    icon: Icons.timelapse_outlined,
                    onClicked: () => selectedItem(context, 7),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Notes',
                    icon: Icons.bookmarks,
                    onClicked: () => selectedItem(context, 8),
                  ),

                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Absences',
                    icon: Icons.access_alarms_rounded,
                    onClicked: () => selectedItem(context, 4),
                  ),

                  const SizedBox(height: 24),
                  const Divider(color: Colors.white70),
                  const SizedBox(height: 24),
                  buildMenuItem(
                    text: 'Contactez-Nous',
                    icon: Icons.phone,
                    onClicked: () => selectedItem(context, 9),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'À propos',
                    icon: Icons.accessibility_outlined,
                    onClicked: () => selectedItem(context, 10),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Déconnexion',
                    icon: Icons.login,
                    onClicked: () => selectedItem(context, 11),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(const EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: const TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
              const Spacer(),
              /*
              CircleAvatar(
                radius: 24,
                backgroundColor: Color.fromRGBO(30, 60, 168, 1),
                child: Icon(Icons.add_comment_outlined, color: Colors.white),
              )

               */
            ],
          ),
        ),
      );

  Widget buildSearchField() {
    const color = Colors.white;

    return TextField(
      style: const TextStyle(color: color),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        hintText: 'Recherche',
        hintStyle: const TextStyle(color: color),
        prefixIcon: const Icon(Icons.search, color: color),
        filled: true,
        fillColor: Colors.white12,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    const color = Colors.white;
    const hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: const TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop(); //FERME LE WIDGET

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PeoplePage(name: 'Baoula', prenom: 'Baoula', email: 'duc@gmai.com'),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FavouritesPage(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FavouritesPage(),
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Module(),
        ));
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FavouritesPage(),
        ));
        break;
      case 5:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Devoir(),
        ));
        break;
      case 6:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => TD(),
        ));
        break;
      case 7:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FavouritesPage(),
        ));
        break;
      case 8:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FavouritesPage(),
        ));
        break;
      case 9:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const ContactezNous(),
        ));
        break;

      case 10:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FavouritesPage(),
        ));
        break;

      case 11:
        Navigator.of(context).pop();
        Navigator.push(
          context,
          MaterialPageRoute(
            //  builder: (context) =>ListUser(),
            //),

            builder: (context) => LoginForm(),
          ),


        );
        break;
    }
  }
}