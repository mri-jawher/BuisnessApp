import 'package:buisness/data/data.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class popularPage extends StatelessWidget {
  const popularPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height:size.height/30,),
            Row(children: [InkWell(child: Row(children: [SizedBox(width: 10,),Icon(Icons.list),Text('Filter')],),)],),
            SizedBox(height:size.height/30,),
            item('Kalopsia','Accessories,Fashion','4.8','1,1K','   1  ',userImage,context),
            SizedBox(height:size.height/50,),
            item('Kalopsia','Accessories','4.8','1,1K','   1  ',userImage,context),
            SizedBox(height:size.height/50,),
            item('Kalopsia','Accessories','4.8','1,1K','   1  ',userImage,context),
            SizedBox(height:size.height/50,),
            item('Kalopsia','Accessories','4.8','1,1K','   1  ',userImage,context),
            SizedBox(height:size.height/50,),
            item('Kalopsia','Accessories','4.8','1,1K','   1  ',userImage,context),
            SizedBox(height:size.height/50,),
            item('Kalopsia','Accessories','4.8','1,1K','   1  ',userImage,context),
            SizedBox(height:size.height/50,),
            item('Kalopsia','Accessories','4.8','1,1K','   1  ',userImage,context),
            SizedBox(height:size.height/50,),
            item('Kalopsia','Accessories','4.8','1,1K','   1  ',userImage,context),
            SizedBox(height:size.height/50,),
            item('Kalopsia','Accessories','4.8','1,1K','   1  ',userImage,context),


          ]));


  }
}


//item('Kalopsia','Accessories','4.8','1,1K','   1  ',userImage,context),



Widget item(String name,String type,var rate,var orders,var number,String imageUrl,BuildContext context){
  var size = MediaQuery.of(context).size;
  return Container(
    child: Row(
      children: [
        SizedBox(width:size.width/6),
        Text(number,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
        CachedNetworkImage(
          imageUrl:imageUrl ,
          imageBuilder: (context, imageProvider) => Container(
            width: size.width/7,
            height: size.width/7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        Column(
          children: [
            Text(name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
            Text(type),
            Text('  ★'+rate+'| '+orders+' orders')
            
          ],
        )
      ],
    ),
  );
}