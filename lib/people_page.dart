
import 'package:flutter/material.dart';
import 'package:smart_school/caroussel.dart';
import 'devoir.dart';
import 'emploiDuTemps.dart';
import 'module.dart';
import 'navigation_drawer_widget.dart';
import 'td.dart';

class PeoplePage extends StatelessWidget {
   final String name;
   final String prenom;
   final String email;

   PeoplePage({
    Key? key, required this.name, required this.prenom, required this.email,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    drawer: NavigationDrawerWidget(name : name, prenom : prenom, email : email),
    appBar: AppBar(
      title: const Text('My EPI'),
      centerTitle: true,
      backgroundColor: Colors.red.shade700,
    ),

    body: SingleChildScrollView(
  child: Column(
  children: [
    const Caroussel(),
    const SizedBox(height: 20),
    const sectionPrincipale3(),
    const sectionPrincipale2(),
   // const sectionPrincipale1(),
    const SizedBox(height: 20),
    imageSection,






  ],
  ),
  ),
  );


  Widget imageSection = Container (
    padding: const EdgeInsets.all(20), //ECARTE DU CONTENAIRE
    margin: const EdgeInsets.all(20) , //ECARTE LE CONTANAIRE DE LECRAN
    height: 320,

    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius:  BorderRadius.circular(10),

      color:
              Colors.red.shade800,


    ),
    child: Column(

      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //SizedBox(height: 20),
        ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Image.asset('images/image111.jpeg',
            ),
        ),

        const SizedBox(height: 30),
        Center(child: const Text("Restez connecter sur votre smartphone avec My EPI", style: TextStyle(color: Colors.white,fontSize: 20,fontWeight:FontWeight.w500,))),
       // SizedBox(height: 10),

      ],
    ),
  );



}

class sectionPrincipale1 extends StatefulWidget {
  const sectionPrincipale1({Key? key}) : super(key: key);

  @override
  _sectionPrincipaleState1 createState() => _sectionPrincipaleState1();
}

class _sectionPrincipaleState1 extends State<sectionPrincipale1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Colors.grey.shade100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 150,
              child: InkWell(onTap:() {  Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Devoir(),
              ));
              },
                child: Column(
                  children: [
                    Expanded(child: Image.asset('images/IMG_9522.PNG')),
                    const SizedBox(height: 10,),
                    const Center(child:Text("Absences",style: TextStyle(color: Colors.black,fontSize: 17,fontWeight:FontWeight.w500,))),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 40,),
            Container(
              height: 150,
              width: 150,
              child: InkWell(onTap:() {  Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Devoir(),
              ));
              },
              child: Column(
                children: [
                  Expanded(child: Image.asset('images/IMG_9525.PNG')),
                  const SizedBox(height: 10,),
                  const Center(child:Text("Notes",style: TextStyle(color: Colors.black,fontSize: 17,fontWeight:FontWeight.w500,))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}




class sectionPrincipale2 extends StatefulWidget {
const sectionPrincipale2({Key? key}) : super(key: key);

@override
_sectionPrincipaleState2 createState() => _sectionPrincipaleState2();
}

class _sectionPrincipaleState2 extends State<sectionPrincipale2> {
    @override
    Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.grey.shade100,
      child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
        height: 150,
        width: 150,
          child: InkWell(onTap:() {  Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Module(),
          ));
          },
        child: Column(
          children: [
          Expanded(child: Image.asset('images/IMG_9524.PNG')),
          const SizedBox(height: 10,),
          const Center(child:Text("Modules",style: TextStyle(color: Colors.black,fontSize: 17,fontWeight:FontWeight.w500,))),
          ],
        ),
      ),
        ),
        const SizedBox(width: 40,),
        Container(
          height: 150,
          width: 150,
          child: InkWell(onTap:() {  Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const emploiDuTemps(filiere: 'Genie Logiciel', niveau: '4 em annee',),
          ));
          },
            child: Column(
              children: [
                Expanded(child: Image.asset('images/IMG_9528.JPG')),
                const SizedBox(height: 10,),
                const Center(child:Text("Emploi du temps",style: TextStyle(color: Colors.black,fontSize: 17,fontWeight:FontWeight.w500,))),
              ],
            ),
          ),
        ),
        ],
        ),
        );
    }
}

class sectionPrincipale3 extends StatefulWidget {
  const sectionPrincipale3({Key? key}) : super(key: key);

  @override
  _sectionPrincipaleState3 createState() => _sectionPrincipaleState3();
}

class _sectionPrincipaleState3 extends State<sectionPrincipale3> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.grey.shade100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 150,
            width: 150,
            child: InkWell(onTap:() {  Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Devoir(),
            ));
              },
                child : Column(
              children: [

                Expanded(child: Image.asset('images/IMG_9518.JPG')),
                const SizedBox(height: 10,),
                const Center(child:Text("Devoirs",style: TextStyle(color: Colors.black,fontSize: 17,fontWeight:FontWeight.w500,))),

              ],
            ),
    ),
          ),
          const SizedBox(width: 40,),
          Container(
            height: 150,
            width: 150,
            child: InkWell(onTap:() {  Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => TD(),
            ));
            },
            child: Column(
              children: [
                Expanded(child: Image.asset('images/IMG_9520.JPG')),
                const SizedBox(height: 10,),
                const Center(child:Text("TD",style: TextStyle(color: Colors.black,fontSize: 17,fontWeight:FontWeight.w500,))),
              ],
            ),
          ),
          ),
        ],
      ),
    );
  }
}

