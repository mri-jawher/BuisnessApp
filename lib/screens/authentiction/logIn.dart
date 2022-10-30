import 'package:buisness/screens/authentiction/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller.dart';
class logIn extends StatefulWidget {
  const logIn({Key? key}) : super(key: key);

  @override
  State<logIn> createState() => _logInState();
}

class _logInState extends State<logIn> {
  SimpleUIController simpleUIController = Get.put(SimpleUIController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          body: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 600) {
                return _buildLargeScreen(size, simpleUIController,context);
              } else {
                return _buildSmallScreen(size, simpleUIController,context);
              }
            },
          )),
    );
  }
}



Widget _buildSmallScreen(
    Size size,
    SimpleUIController simpleUIController,BuildContext context
    ) {
      return Center(
        child: _signeUP(size,simpleUIController,context),
      );
      }



Widget _buildLargeScreen(
    Size size,
    SimpleUIController simpleUIController,BuildContext context
    ) {
  if (size.height>900){
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/Backeground1.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(child: Card(margin:EdgeInsets.all(6),child: Padding(padding: EdgeInsets.all(8),
          child:Container(width:500,height:900,child: _signeUP(size,simpleUIController,context))))) ,/* add child content here */
    );}
  else{
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/Backeground1.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(child: Card(margin:EdgeInsets.all(6),child: Padding(padding: EdgeInsets.all(8),
          child:Container(width:500,height:size.height,child: _signeUP(size,simpleUIController,context))))) ,/* add child content here */
    );
  }


}


Widget _signeUP(
Size size,
    SimpleUIController simpleUIController,BuildContext context
) {

  return Column(
    children: [
      Expanded(flex: 2,child: Container(decoration: BoxDecoration(borderRadius:BorderRadius.circular(100) ),child: Image.asset("images/logo.png"))),
      Expanded(flex: 6,
  child: Column(
  children: [
    SizedBox(height: size.height/30,),
    Text(style: TextStyle(fontSize: 22,fontWeight: FontWeight.w900),"let's Get You Started"),
    SizedBox(height: size.height/25,),
    InkWell(onTap: (){}, child:_Button('images/facebook.png',"Continue With Facebook",size) ),
    SizedBox(height: size.height/30,),
    InkWell(onTap: (){}, child:_Button('images/google.png',"Continue With Google",size) ),
    SizedBox(height: size.height/30,),
    InkWell(onTap: (){}, child:_Button('images/whatsapp.png',"Continue With WhatsApp",size) )
  // or
  ,SizedBox(height: size.height/30,)
    ,Row(children: [ Expanded(
              child: Divider()
          ),

            Text("  OR  ",style:TextStyle(color: Colors.grey),),

            Expanded(
                child: Divider()
            ),],),
  SizedBox(height: size.height/25,)
   ,InkWell(onTap: (){}, child:Container(width: size.width/1.3,height:size.height/12 ,decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(50)),child: Center(child: Text("Sign in with Password",style: TextStyle(color: Colors.white),)),)),
    SizedBox(height: size.height/25,),
    Row(mainAxisAlignment: MainAxisAlignment.center,children: [Text("Don't have an account?   "),InkWell(onTap: (){
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const signUp()),
    );},child: Text("Sign up",style: TextStyle(color: Colors.green),),)],)


  ],
  )),
    ],
  );
}


Widget _Button(String ImageDir,String name,Size size){
  return Container(width: size.width/1.3,height:size.height/12 ,decoration: BoxDecoration(color: Colors.white,border: Border.all(color: Colors.grey),borderRadius: BorderRadius.circular(15)),child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [Image.asset(ImageDir,height: 30,width: 30,),SizedBox(width: 30,),Text(name,style: TextStyle(fontWeight: FontWeight.bold),)],));
}