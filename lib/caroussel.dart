import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Caroussel extends StatefulWidget {
  const Caroussel({Key? key}) : super(key: key);

  @override
  _CarousselState createState() => _CarousselState();
}

class _CarousselState extends State<Caroussel> {
  List<String> imageList = [

    'images/1.png',
    'images/2.jpeg',
    'images/3.jpeg',
    'images/4.png',


  ];
  @override
  Widget build(BuildContext context) {
    return Column(
    children:<Widget>[
      const SizedBox(height: 10,),

      CarouselSlider(items: imageList.map((e) => ClipRRect(
        borderRadius: BorderRadius.circular(10),
       child: Stack(
         fit: StackFit.expand,
         children: [
           Image.asset(e,height:200 ,width: 100,fit: BoxFit.cover
           ),
          // Text(e)
         ],
       ),
      ),
      ).toList(),
        options: CarouselOptions(
        autoPlay: true,
        enableInfiniteScroll: true,
        enlargeCenterPage: true,
         height: 150,

      ),


      ),
    ],
    );
  }
}
