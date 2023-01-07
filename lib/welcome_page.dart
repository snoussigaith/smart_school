import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'delayed_animation.dart';
import 'main.dart';
import 'social_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(
            vertical: 60,
            horizontal: 30,
          ),
          child: Column(

            children: [
              const SizedBox(height: 100),
              DelayedAnimation(
                delay: 1000,
                child: Container(
                  height: 300,
                  child: Image.asset('images/4.png'),
                ),
              ),
              /*
              DelayedAnimation(
                delay: 2000,
                child: Container(
                  height: 400,
                  child: Image.asset('images/podium-lonab6.jpg'),
                ),
              ),

               */
              const SizedBox(height: 50),
              DelayedAnimation(
                delay: 3000,
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 30,
                    bottom: 20,
                  ),
                  child: Text(
                    "Bienvenue Sur La Platforme De La Meilleure Ecole Privée D'ingenieurs en Tunisie",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.black87,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              DelayedAnimation(
                delay: 4000,
                child: Container(
                  width: double.infinity, //PRENDS TOUT LECRAN
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: d_red,
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.all(13)),
                    child: const Text('Commencer',style: TextStyle(fontSize: 24),),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SocialPage(),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
