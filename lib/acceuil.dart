import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as  http;


class ListUser extends StatelessWidget {
  const ListUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {




    Future<List> getData() async
    {
      await Future.delayed(const Duration(seconds: 4));
      var url  = "http://192.168.64.2/LONAB/readuser.php";
      var reponse = await http.get(Uri.parse(url));
      return json.decode(reponse.body);

    }

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



      body:  FutureBuilder<List>(
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
    return Container(
      height: 200,

      child: ListView.separated(
        padding: const EdgeInsets.all(20),
        scrollDirection: Axis.horizontal,
        itemCount:list==null?0:list.length,
        separatorBuilder:(context, _) => const SizedBox(width: 20,),
        itemBuilder: (context,index){
          return Container(

            height: 150,
            width: 150,
         //  color: Colors.green.shade300,
            child: Column(
              children: [
               // SizedBox(height: 10),
                Expanded(
                  child:


               AspectRatio( aspectRatio: 4/3,
                 child: ClipRRect(
                    borderRadius:BorderRadius.circular(20),
                  child :
                      Material(
                        child:
                  Ink.image(
                   image :  const AssetImage('images/image4.jpeg'),
                      ),
                 // child: InkWell( onTap:() {} ),
                  ),
          ),
               ),
          ),
                const SizedBox(height: 05,),
                Center(child: Text(list[index]['prenom'])),
                Center(child: Text(list[index]['prenom'])),

              ],
            ),


          );

        },
      ),

    );
  }
}

