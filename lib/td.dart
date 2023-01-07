import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as  http;
import 'afficherTD.dart';


class TD extends StatelessWidget {

  final _keyForm = GlobalKey<FormState>();
  late String niveau;
  late String filiere;


  final List<String> genderItems = ["Genie Logiciel","Intelligence Artificielle","Architecture","Cyber Security","Genie Electrique","Genie Electo Mecanique", "Genie Indistruel", "Genie Civil",];
  final List<String> genderItems1 = ['1 ere annee' , '2 em annee', '3 em annee','4 em annee', '5 em annee','6 em annee',];

  TD({Key? key}) : super(key: key);

  Future listeTD(BuildContext cont) async
  {

    var url  = "http://127.0.0.1/MYEPI/listeTD.php";
    var reponse = await http.post(Uri.parse(url) ,
        body: {
          "niveau": niveau,
          "filiere" : filiere,
        });
    var data = json.decode(reponse.body);
    if (data == "success")
    {
      Navigator.push(
        cont,
        MaterialPageRoute(
          //  builder: (context) =>ListUser(),
          //),

          builder: (context) => afficherTD(filiere: filiere, niveau: niveau,),
        ),


      );



    }

    else {


      Fluttertoast.showToast(msg: "Désolé il n'y pas encore d'anciens TD en " + niveau +" "+ filiere ,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red.shade700,
        fontSize: 16.0,

      );


    }

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(


      // drawer: NavigationDrawerWidget(name : this.name, prenom : this.prenom, email : this.email),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('My EPI'),
        centerTitle: true,
        backgroundColor: Colors.red.shade700,
      ),

      body: SingleChildScrollView(
        child: Form(
          key : _keyForm,
          child: Column(
            children: [
              // Caroussel(),
              Container(height: 550, width: double.infinity,
                child: Column(
                  children: [
                    const SizedBox(height: 70,),
                     const Text("SELECTION DES TRAVAUX DIRIGES", style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          //fontStyle: FontStyle.italic,
                          fontFamily: 'Open Sans',
                          fontSize: 20)),

                    const SizedBox(height: 20,),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        //ECARTE DU CONTENAIRE
                        margin: const EdgeInsets.all(30),
                        //ECARTE LE CONTANAIRE DE LECRAN
                        color: Colors.blueGrey.shade100,

                        child:


                        Column(children: [

                          const SizedBox(height: 30,),

                          ListTile(
                            //shape: RoundedRectangleBorder(
                            //   borderRadius: BorderRadius.circular(4),
                            //   side: const BorderSide(color: Colors.white, width: 1.5),
                            //  ),
                            title:
                            Row(
                              children: [
                                Expanded(child:
                                DropdownButtonFormField(
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  isExpanded: true,
                                  hint: const Text(
                                    'Filière *',
                                    //  style: TextStyle(fontSize: 20,color: Colors.black),
                                  ),
                                  icon: const Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.black45,
                                  ),
                                  //  iconSize: 20,
                                  // buttonHeight: 50,
                                  // buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                                  // dropdownDecoration: BoxDecoration(
                                  //    borderRadius: BorderRadius.circular(15),
                                  // ),
                                  items: genderItems
                                      .map((item) =>
                                      DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            //   fontSize: 18,color: Colors.black
                                          ),

                                        ),

                                      ),
                                  )
                                      .toList(),

                                  validator: (value) {
                                    if (value == null) {
                                      return 'Entrez la filière';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    filiere = value.toString();   //Do something when changing the item if you want.
                                  },
                                  onSaved: (value) {
                                    // filiere = value.toString();
                                  },


                                  //    ),),
                                  //  ],
                                  // ),


                                ),
                                ),


                              ],
                            ),


                          ),

                          const SizedBox(height: 50,),


                          ListTile(
                            //shape: RoundedRectangleBorder(
                            //   borderRadius: BorderRadius.circular(4),
                            //   side: const BorderSide(color: Colors.white, width: 1.5),
                            //  ),
                            title:
                            Row(
                              children: [
                                Expanded(child:

                                DropdownButtonFormField(
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  isExpanded: true,
                                  hint: const Text(
                                    'Niveau *',
                                    //  style: TextStyle(fontSize: 20,color: Colors.black),
                                  ),
                                  icon: const Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.black45,
                                  ),
                                  //  iconSize: 20,
                                  // buttonHeight: 50,
                                  // buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                                  // dropdownDecoration: BoxDecoration(
                                  //    borderRadius: BorderRadius.circular(15),
                                  // ),
                                  items: genderItems1
                                      .map((item) =>
                                      DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            //   fontSize: 18,color: Colors.black
                                          ),

                                        ),

                                      ),
                                  )
                                      .toList(),

                                  validator: (value) {
                                    if (value == null) {
                                      return 'Entrez le niveau';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    niveau = value.toString();  //Do something when changing the item if you want.
                                  },
                                  onSaved: (value) {
                                    // niveau = value.toString();
                                  },


                                  //    ),),
                                  //  ],
                                  // ),


                                ),
                                ),


                              ],
                            ),


                          ),


                          const SizedBox(height: 50,),

                          ElevatedButton(
                            onPressed: () {

                              //CONTROLE DE LA SAISIE
                              if (_keyForm.currentState!.validate()) {

                                listeTD(context);

                              }
                              else
                              {
                                //TODO :  Appliquer la logique

                                //
                              };



                            },
                            style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder(),
                              primary: Colors.red.shade700,
                              padding: const EdgeInsets.all(13),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                const SizedBox(width: 10),
                                const Text(
                                  'Rechercher', style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                                ),
                                const SizedBox(width: 5,),
                                const Icon(Icons.search, color: Colors.white),
                              ],
                            ),
                          ),

                        ],),


                      ),
                    ),
                  ],
                ),
              ),
              //   Container(color: Colors.grey, height: 100,),
              //   Container(color: Colors.blueAccent, height: 100,),


            ],
          ),
        ),
      ),
    );
  }
}
