import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as  http;
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:file_picker/file_picker.dart';


class afficherDevoir extends StatelessWidget {
  final String filiere;
  final String niveau;

  const afficherDevoir({
    Key? key, required this.filiere, required this.niveau

  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    Future<List> getData() async
    {
      await Future.delayed(const Duration(seconds: 1));
      var url  = "http://127.0.0.1/MYEPI/afficherDevoir.php";
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

  Future openFile({required String url, String? fileName}) async
  {
    final file = await downloadFile(url,fileName!);
    if (file == null) return null;
    print ('Path:${file.path}');
     OpenFile.open(file.path);

  }

  Future<File?> downloadFile(String url, String name) async
  {
    final appStorage = await getApplicationDocumentsDirectory();
    final file= File("${appStorage.path}/$name");
    try {
      final response = await Dio().get(url,
          //onReceiveProgress: showDownloadProgress,
          options: Options(
        responseType: ResponseType.bytes,
        followRedirects: false,
        //receiveTimeout: 0,
      ));
      final raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();
      return file;
    } catch (e){ return null;}
  }

  /*
void showDownloadProgress(recu,total)
{
if (total!=-1)
  {
    print(recu/total*100 + "%");
  }
}

   */

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,

      child: ListView.separated(
        padding: const EdgeInsets.all(20),
        // scrollDirection: Axis.horizontal,
        itemCount:list==null?0:list.length,
        separatorBuilder:(context, _) => const SizedBox(width: 20,),
        itemBuilder: (context,index){
          return
            Card(
              color: Colors.white70,
              child: Container(
                margin: const EdgeInsets.all(20),
                // color: Colors.green.shade300,
                child: Column(
                  children: [

                    Row(

                      //CENTRE LE BOUTON TELECHARGER
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(list[index]['nomDevoir'],style: const TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.w500),),
                            Text("Enseignant : "+list[index]['nomProf'],style: const TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.w300),),
                            Text("Date : "+list[index]['annee'],style: const TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.w300),),

                          ],
                        ),

                        Container(
                          child: InkWell(onTap:() {
                           // print("http://127.0.0.1/MYEPI/PDF/"+list[index]['sourceDevoir'].toString());
                            openFile(
                                url : "http://127.0.0.1/MYEPI/PDF/"+list[index]['sourceDevoir'].toString(),
                                fileName: list[index]['sourceDevoir'],
                            );
//print (list[index]['sourceDevoir']);


                          },
                          child: Column(
                            children: [
                              Icon(Icons.archive_rounded,size: 30,color: Colors.red.shade700),
                            ],
                          ),
                        ),
                        ),
                      ],
                    ),
                  ],

                ),


              ),
            );

        },
      ),

    );
  }


}