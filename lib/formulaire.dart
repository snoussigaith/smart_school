import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:http/http.dart' as  http;
import 'package:smart_school/people_page.dart';
import 'package:smart_school/social_page.dart';



class Inscription extends StatelessWidget {

  const Inscription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My EPI',
      home: FormulairePage(),
    );
  }
}



class FormulairePage extends StatelessWidget {
  const FormulairePage({Key? key}) : super(key: key);

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("My EPI"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            //Navigator.pop(context);
            Navigator.of(context).pushAndRemoveUntil(
              CupertinoPageRoute(
                builder: (BuildContext context) {
                  return const SocialPage();
                },
              ),
                  (_) => true,
            );
          },
        ),
      ),
      body: SingleChildScrollView
        ( child : Column (
        children: [
          const BodySection(),
        ],
      ),
      ),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(50);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      //  leading: IconButton(
      //icon : Icon(
      //     Icons.arrow_back,
      //     color: Colors.white,
      //      size: 20 ),
      //  onPressed: null,
      // ),

      title: Text(
        'My EPI',
        style: GoogleFonts.nunito(
          fontSize: 22,
          fontWeight: FontWeight.w800,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.green,
    );
  }
}

class BodySection extends StatefulWidget {
  const BodySection({Key? key}) : super(key: key);

  @override
  State<BodySection> createState() => _BodySectionState();
}

class _BodySectionState extends State<BodySection> {

  //CONTROLER LA SAISIE
  Future ajout() async
  {

      var url  = "http://192.168.64.2/LONAB/ajout.php";
      var reponse = await http.post(Uri.parse(url) ,
          body: {
            "email": emailControler.text,
            "nom": nameControler.text,
            "prenom": prenomControler.text,
            "date":dateControler.text,
            "tel":  telControler.text ,
            "password" : passwordControler.text,
          });


      var data = json.decode(reponse.body);
      if (data == "success")
      {
        Navigator.of(context).pop(); //FERME LE WIDGET
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PeoplePage(name: nameControler.text, prenom: prenomControler.text, email: emailControler.text),
          ),
        );
        /*
        Navigator.push(
          context,
          MaterialPageRoute(

            builder: (context) => LoginForm(),
          ),
        );

         */

      }
      else if (data == "Email Existe")
        {
          Fluttertoast.showToast(msg: "Cet email est déjà utilisé",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.green,
            fontSize: 16.0,

          );
        }

      else if (data == "Tel Existe")
      {
        Fluttertoast.showToast(msg: "Ce numero existe déjà dans la base de donnée",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.green,
          fontSize: 16.0,

        );

      }

  }




  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(1960),
        lastDate: DateTime.now());
    if (pickedDate != null && pickedDate != currentDate) {
      setState(() {
        currentDate = pickedDate;
      });
    }
  }

  var _obscureText = true;
  var _obscureText2 = true;

  final _keyForm = GlobalKey<FormState>();


  DateTime currentDate = DateTime.now ();

  String a="" ; //POUR CONCATENENER LE NUMERO ET LINDINCE DU PAYS

  TextEditingController nameControler = TextEditingController();

  TextEditingController lieuControler = TextEditingController();

  TextEditingController dateControler = TextEditingController();

  TextEditingController prenomControler = TextEditingController();

  TextEditingController emailControler = TextEditingController();

  TextEditingController telControler = TextEditingController();

  TextEditingController passwordControler = TextEditingController();

  TextEditingController passConfControler = TextEditingController();



  @override
  Widget build(BuildContext context) {
final format = DateFormat(("dd-MM-yyyy"));


    return Container(


      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal:  30.0),
      child: Form(
        key : _keyForm,
       // autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(

          children: <Widget>[

            const SizedBox(height: 30.0),
            Text("INSCRIPTION", style: TextStyle(
                color: Colors.red[800],
                fontWeight: FontWeight.w900,
                //fontStyle: FontStyle.italic,
                fontFamily: 'Open Sans',
                fontSize: 30)),

            const SizedBox(height: 30.0),
           // DoroteeImage(),


            TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(),
              ),
              labelText: 'Nom',

            ),
                keyboardType: TextInputType.name,
                maxLength: 20,
                controller: nameControler,
                validator: (val) {
                 if ( val!.isEmpty )
                   {
                     return ('Ce champ est obligatoire');
                   } else if ( !RegExp(r'^[a-z A-Z]+$').hasMatch(val))
                  {
                  return ('Doit contenir seulement des lettres');
                  }
                 else
                   {
                     return null;
                   }

                }

             ),

            const SizedBox(height: 30.0),

            TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(),
              ),
              labelText: 'Prénom(s)',

            ),
                maxLength: 35,
                keyboardType: TextInputType.name,
                controller: prenomControler,
                validator: (val) {
                  if ( val!.isEmpty )
                  {
                    return ('Ce champ est obligatoire');
                  } else if ( !RegExp(r'^[a-z A-Z]+$').hasMatch(val))
                  {
                    return ('Doit contenir seulement des lettres');
                  }
                  else
                  {
                    return null;
                  }

                }

            ),

            const SizedBox(height: 30.0),
      DateTimeField(format: format,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        maxLength: 10,
    decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(),
        ),

        labelText: "Date de naissance"),
    controller: dateControler,
    validator: (val) {

      if ( val == null)
      {
        return ('Ce champ est obligatoire');
      }
      else
      {
        return null;
      }

    },


    onShowPicker: (context, currentValue) async
{

final date =showDatePicker(context: context,
    initialDate: currentValue ?? DateTime.now(),
    firstDate: DateTime(1960),
    lastDate:  DateTime.now());
     return date;
},


),

            const SizedBox(height: 30.0),

             IntlPhoneField(
               autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),

                    labelText: 'Téléphone',
                  ),
                  keyboardType: TextInputType.number,
                  controller: telControler,
                  initialCountryCode: 'BF',
                  onChanged: (phone) {

                     a = phone.countryCode + telControler.text;

                  },
               invalidNumberMessage: "Numéro de téléphone incorrect",

                ),



            const SizedBox(height: 30.0),

            TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(),
              ),
              labelText: 'Email',

            ),
                maxLength: 30,
                keyboardType: TextInputType.emailAddress,
                controller: emailControler,

                validator: (val) {
                  if ( val!.isEmpty )
                  {
                    return ("Ce champ est obligatoire");
                  } else if ( !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(val))
                  {
                    return ('Doit respester la notation des emails ');
                  }
                  else
                  {
                    return null;
                  }

                }

            ),

            const SizedBox(height: 30.0),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: passwordControler,
              validator: (val) {
                if ( val!.isEmpty)
                {
                  return ('Ce champ est obligatoire');
                }
                else if (val.length<7)
                  {
                    return ('Doit être supérieur à 7 caractères');
                  }
                else
                {
                  return null;
                }

              },
              maxLength: 12,
              obscureText: _obscureText,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
                /*
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
                */

                labelText: 'Mot de passe',
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.visibility,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
            ),

            const SizedBox(height: 30.0),


            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: passConfControler,
              validator: (val) {
                if ( val!.isEmpty)
                {
                  return ('Ce champ est obligatoire');
                }
                else if (val.length<7)
                {
                  return ('Doit être supérieur à 7 caractères');
                }
                else if (passConfControler.text != passwordControler.text)
                {
                  return ('Mot de passe incorrect');
                }
                else
                {
                  return null;
                }

              },

              maxLength: 12,
              obscureText: _obscureText2,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderSide: BorderSide(),
                ),

                /*
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),

                 */
                labelText: 'Confirmer mot de passe',
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.visibility,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText2 = !_obscureText2;
                    });
                  },
                ),
              ),


            ),



            const SizedBox(height: 30.0),

               ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  primary: Colors.green,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 125,
                    vertical: 13,
                  ),
                ),
                child: Text(
                  'Valider',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onPressed: () {

                  sendToServer();


                },
              ),


            const SizedBox(height: 30.0),



          ],
        ),
      ),

    );

  }

  sendToServer()
  {
    //CONTROLE DE LA SAISIE
    if (_keyForm.currentState!.validate()) {
      ajout();
    }
    else
      {
        //TODO :  Appliquer la logique

        //
      }

  }
}
