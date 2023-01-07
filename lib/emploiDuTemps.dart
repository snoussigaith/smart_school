import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as  http;

class emploiDuTemps extends StatelessWidget {
  final String filiere;
  final String niveau;

  const emploiDuTemps({
    Key? key, required this.filiere, required this.niveau

  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    Future<List> getData() async
    {
      await Future.delayed(const Duration(seconds: 1));
      var url  = "http://127.0.0.1/MYEPI/emploiDuTemps.php";
      var reponse = await http.post(Uri.parse(url) ,
          body: {
            "niveau": niveau,
            "filiere" : filiere,
          });
      return json.decode(reponse.body);


    }

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

      body: FutureBuilder<List>(
        future: getData(), // a previously-obtained Future<String> or null
        builder: (context, snapshot) {
          if (snapshot.hasError) print (snapshot.error);
          return snapshot.hasData
              ? Items(list : snapshot.data??[],)
              : const Center(
            child:
            CircularProgressIndicator(color: Colors.red,),
          );
        },
      ),
    );
  }
}

class Items extends StatelessWidget {
  List list;
  Items({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,

      child: ListView.separated(
        padding: const EdgeInsets.all(20),
        // scrollDirection: Axis.horizontal,
        itemCount:list==null?0:list.length,
        separatorBuilder:(context, _) => const SizedBox(width: 20,),
        itemBuilder: (context,index){
          return Container(
                margin: const EdgeInsets.all(20),
                // color: Colors.green.shade300,
                child: Column(
                  children: [

                    Row(

                      //CENTRE LE BOUTON TELECHARGER
                     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              const SizedBox(height: 20,),
                              const Center(
                                child: Text("EMPLOI DU TEMPS", style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                    //fontStyle: FontStyle.italic,
                                    fontFamily: 'Open Sans',
                                    fontSize: 20)),
                              ),

                              const SizedBox(height: 20,),

                              Image.network("http://127.0.0.1/MYEPI/PDF/"+list[index]['sourceEmploi']),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],

                ),


              );


        },
      ),

    );
  }
}