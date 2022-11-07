import 'package:buisness/data/data.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class recommendedPage extends StatelessWidget {
  const recommendedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          virtList(recomendedList,context),
          Row(children: [
            Text('   Popular products',style: TextStyle(fontSize: size.height/30,fontWeight: FontWeight.bold),),
            Spacer(),
            InkWell(
              onTap: (){},
                child: const Text('See All  ',style: TextStyle(color: Colors.green),))

          ],),
          virtListC(recomendedList,context),
          Row(children: [
            Text('   Recent items bought',style: TextStyle(fontSize: size.height/30,fontWeight: FontWeight.bold),),
            Spacer(),
            InkWell(
                onTap: (){},
                child: const Text('See All  ',style: TextStyle(color: Colors.green),))
          ],),
          virtListC(recomendedList,context),
          Row(children: [
            Text('   Your recent activity',style: TextStyle(fontSize: size.height/30,fontWeight: FontWeight.bold),),
            Spacer(),
            InkWell(
                onTap: (){},
                child: const Text('See All  ',style: TextStyle(color: Colors.green),))
          ],),
          virtListC(recomendedList,context),
        ],
      ),
    );
  }
}

Widget recommendedUi(String imageUrl,BuildContext context){
  var size = MediaQuery.of(context).size;

  return CachedNetworkImage(
    imageUrl:imageUrl ,
    imageBuilder: (context, imageProvider) => Container(
      width: size.width/1.7,
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
  )

  ;
}


Widget recommendedUiC(String imageUrl,var compa,BuildContext context){
  var size = MediaQuery.of(context).size;

  return Card(
    child: Stack(
        children: <Widget>[
        CachedNetworkImage(
          imageUrl:imageUrl ,
          imageBuilder: (context, imageProvider) => Container(
            width: size.width/2.5,
            height: size.height/6,
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
    const Positioned(
      right: 5.0,
      bottom: 0.0,
      child:
      Icon(
        Icons.account_circle,
        color: Colors.red,
      ),),
      ],
    ),
  )

  ;
}

Widget virtList(var listProd,BuildContext context){
  var size = MediaQuery.of(context).size;
  return SizedBox(
    height: size.height/4,
    child: ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: recomendedList.length,
        itemBuilder: (BuildContext context, int index) =>
            Padding( padding:EdgeInsets.all(5),child: recommendedUi(recomendedList[index],context))
    ),
  );
}
Widget virtListC(var listProd,BuildContext context){
  var size = MediaQuery.of(context).size;
  return SizedBox(
    height: size.height/4,
    child: ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: recomendedList.length,
        itemBuilder: (BuildContext context, int index) =>
            Padding( padding:EdgeInsets.all(5),child: recommendedUiC(recomendedList[index],recomendedList[index],context))
    ),
  );
}
