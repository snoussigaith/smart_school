import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_school/people_page.dart';
import 'delayed_animation.dart';
import 'main.dart';
import 'package:http/http.dart' as  http;
import 'package:fluttertoast/fluttertoast.dart';


class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);


  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm>
    with SingleTickerProviderStateMixin {
  final _keyForm = GlobalKey<FormState>();
  var _obscureText = true;
  TextEditingController cnib_passport = TextEditingController();
  TextEditingController password = TextEditingController();

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      value: 0.0,
      duration: const Duration(seconds: 25),
      upperBound: 1,
      lowerBound: -1,
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  sendToServer()
  {
    //CONTROLE DE LA SAISIE
    if (_keyForm.currentState!.validate()) {

      login(context);

    }
    else
    {
      //TODO :  Appliquer la logique

      //
    }

  }

  //CONTROLER LA SAISIE
  Future login(BuildContext cont) async
  {

    var url  = "http://localhost/MYEPI/login.php";
    var reponse = await http.post(Uri.parse(url) ,
        body: {
          "cnib_passport": cnib_passport.text,
          "password" : password.text,
        });
    var data = json.decode(reponse.body);
    print(data);
    if (data == "success")
    {

      /*
      var rep = await http.get(Uri.parse(url));

      var jsonResponse = json.decode(rep.body);

      print (jsonResponse);

       */


      Navigator.of(context).pop();
      Navigator.push(
        cont,
        MaterialPageRoute(
        //  builder: (context) =>ListUser(),
        //),

          builder: (context) => PeoplePage(name: _LoginFormState().cnib_passport.text, prenom: _LoginFormState().cnib_passport.text, email: _LoginFormState().cnib_passport.text,),
        ),


      );



    }

    else {



      Fluttertoast.showToast(msg: "Matricule ou mot de passe incorrect",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.blueAccent,
        fontSize: 16.0,

      );


    }

  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // if (_controller.value == 0.8) _controller.reverse();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key : _keyForm,
        //  autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: [

                AnimatedBuilder(
                  animation: _controller,
                  builder: (BuildContext context, child) {
                    return ClipPath(
                      clipper: DrawClip(_controller.value),
                      child: Container(
                        height: size.height * 0.3,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              colors: [Colors.blueAccent, Colors.pink]),
                        ),
                      ),
                    );
                  },
                ),


                Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: const Text(
                    'My EPI',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),

                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 30,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DelayedAnimation(
                            delay: 500,
                            child: Text(
                              "Connexion avec votre numéro matricule",
                              style: GoogleFonts.poppins(
                                //color: Colors.green,
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),

                          const SizedBox(height: 35),
                          DelayedAnimation(
                            delay: 1000,
                            child: TextFormField(
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                controller: cnib_passport,
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide(),
                                  ),
                                  labelText: 'Matricule',
                                  labelStyle: TextStyle(
                                    color: Colors.grey[400],
                                  ),
                                ),
                                maxLength: 10,
                                keyboardType: TextInputType.emailAddress,

                                validator: (val) {
                                  if ( val!.isEmpty )
                                  {
                                    return ("Ce champ est obligatoire");
                                  }
                                  else
                                  {
                                    return null;
                                  }

                                }
                            ),
                          ),
                          const SizedBox(height: 30),
                          DelayedAnimation(
                            delay: 1500,
                            child: TextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: (val) {
                                if ( val!.isEmpty)
                                {
                                  return ('Ce champ est obligatoire');
                                }
                                else if (val.length<=6)
                                {
                                  return ('Doit être supérieur ou égale à 6 caractères');
                                }
                                else
                                {
                                  return null;
                                }

                              },
                              maxLength: 10,
                              controller: password,
                              obscureText: _obscureText,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(),
                                ),
                                labelStyle: TextStyle(
                                  color: Colors.grey[400],
                                ),
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
                          ),

                          const SizedBox(height: 15),
                          DelayedAnimation(
                            delay: 1500,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                // shape: StadiumBorder(),
                                primary: Colors.white,

                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  Text(
                                    "Mot de passe oublié ? ",
                                    style: GoogleFonts.poppins(
                                      color: Colors.grey,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),

                                ],
                              ),

                              onPressed: () {
                                /*
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        Inscription(),
                                  ),
                                );

                                 */
                              },
                            ),
                          ),


                        ],
                      ),
                    ),

                    const SizedBox(height: 25),
                    DelayedAnimation(
                      delay: 1500,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          primary: d_red,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 125,
                            vertical: 13,
                          ),
                        ),
                        child: Text(
                          'Valider',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onPressed: () {
                          sendToServer();
                        },
                      ),
                    ),

                    const SizedBox(height: 25),

                    /*
                    DelayedAnimation(
                      delay: 1700,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                         // shape: StadiumBorder(),
                          primary: Colors.white,

                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 10),
                            Text(
                              "Vous n'avez pas de compte ?, ",
                              style: GoogleFonts.poppins(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "Inscription",
                              style: GoogleFonts.poppins(
                                color: Colors.green,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),

                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Inscription(),
                            ),
                          );
                        },
                      ),
                    ),

                     */

                    const SizedBox(height: 50),
                  ],
                ),
          ],
              ),
      ),
          ),



            );

  }
}



class DrawClip extends CustomClipper<Path> {
  double move = 2;
  double slice = math.pi;
  DrawClip(this.move);
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.8);
    double xCenter =
        size.width * 0.5 + (size.width * 0.6 + 1) * math.sin(move * slice);
    double yCenter = size.height * 0.8 + 69 * math.cos(move * slice);
    path.quadraticBezierTo(xCenter, yCenter, size.width, size.height * 0.8);

    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }


}