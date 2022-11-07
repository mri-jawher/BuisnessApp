import 'package:buisness/data/data.dart';
import 'package:buisness/screens/mainApp/homeUi/notificationPage.dart';
import 'package:buisness/screens/mainApp/homeUi/popularPage.dart';
import 'package:buisness/screens/mainApp/homeUi/recommendedPage.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override

    @override
    Widget build(BuildContext context) {
    return _homePage(context);
    }

}




Widget _homePage(BuildContext context){

  const upperTab =  TabBar(
      indicatorColor: Colors.green,
      labelColor: Colors.green,
      unselectedLabelColor: Colors.grey,

      tabs: <Tab>[
        Tab(text: 'Recommended',),
        Tab(text: 'Popular',),
        Tab(text: 'New',),
        Tab(text: 'Viewd',),
      ]);
  return DefaultTabController(
    length: 4,
    child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottom: upperTab,
        flexibleSpace: _topBar(userImage, userName, context),
              ),
      body:
      Container(
        height: MediaQuery.of(context).size.height,
        child: TabBarView(
          children: [
            recommendedPage(),
            popularPage(),
            Icon(Icons.directions_car, size: 350),
            Icon(Icons.directions_car, size: 350),
          ],
        ),
      ),
    ),
  );

}

 Widget  _topBar(String imageUrl,String name,BuildContext context){
   var size = MediaQuery.of(context).size;
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SizedBox(width: size.width/13,),
          Column(
            mainAxisAlignment:MainAxisAlignment.start ,
            children: [
              SizedBox(height: size.height/80,),
              CachedNetworkImage(
                imageUrl:imageUrl ,
                imageBuilder: (context, imageProvider) => Container(
                  height: size.height/20,
                  width: size.height/20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(180),
                    image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                  ),
                ),
                placeholder: (context, url) => const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ],
          ),
          SizedBox(width: size.width/15,),
          Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: size.height/50,),
            const Text('Welcome Back ! 👏',style: TextStyle(color: Colors.grey,fontSize:10, ),),
           Row(mainAxisAlignment: MainAxisAlignment.start,children: [Text(userName+" ",style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),const Icon(Icons.check_circle,color: Colors.green,size: 15,)],)
           ],
           ),
          SizedBox(width: size.width/3,),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: size.height/80,),
              Row(
                children: [
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(180),border: Border.all(color: Colors.black12),),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                          Icon(
                            Icons.search_rounded,
                            size: size.height/40,
                            color: Colors.black,
                          ),
                      ),
                    ),
                  ),
                  SizedBox(width: size.width/50,),
                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const notificationPage()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(180),border: Border.all(color: Colors.black12),),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                        Icon(
                          Icons.notifications_active_outlined,
                          size: size.height/40,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),




    ],
  );
}
