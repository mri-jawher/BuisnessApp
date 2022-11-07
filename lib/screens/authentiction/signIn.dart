import 'package:buisness/screens/authentiction/SignUp.dart';
import 'package:buisness/screens/authentiction/logIn.dart';
import 'package:buisness/screens/authentiction/signIn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}
class signIn extends StatefulWidget {
  const signIn({Key? key}) : super(key: key);

  @override
  State<signIn> createState() => _signInState();
}

class _signInState extends State<signIn> {
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
              if (constraints.maxWidth > 500) {
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
    child: _signe(),
  );
}



Widget _buildLargeScreen(
    Size size,
    SimpleUIController simpleUIController,BuildContext context
    ) {
  if (size.height>800){
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/Backeground1.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(child: Card(margin:EdgeInsets.all(6),child: Padding(padding: EdgeInsets.all(8),
          child:Container(width:500,height:800,child: _signe())))) ,/* add child content here */
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
          child:Container(width:500,height:size.height,child: _signe())))) ,/* add child content here */
    );
  }


}

class _signe extends StatefulWidget {
  _signe({Key? key}) : super(key: key);
  SimpleUIController simpleUIController = Get.put(SimpleUIController());

  @override
  State<_signe> createState() => _signeState();
}

class _signeState extends State<_signe> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var _email = "";
    var _password = "";
    bool val = false;
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.black;
      }
      return Colors.green;
    }
    bool isChecked = false;
    return Column(
      children: [
        Expanded(flex: 2,child: Container(decoration: BoxDecoration(borderRadius:BorderRadius.circular(100) ),child: Image.asset("images/logo.png"))),
        Expanded(flex: 6,
            child: Column(
              children: [
                SizedBox(height: size.height/40,),
                Text(style: TextStyle(fontSize: 22,fontWeight: FontWeight.w900),"Login to Your Account"),
                SizedBox(height: size.height/30,),
                Container(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(50,0,50,15),
                    child: Card(
                        child:  TextFormField(
                          onChanged: (v){_email = v;},
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            label:Row(children: [Icon(Icons.email_outlined,color: Colors.grey,),Text("  Email")],),
                            filled: true,
                            fillColor: Colors.grey.shade50,
                            border: InputBorder.none,
                          ),
                        )
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(50,0,50,0),
                    child: Card(
                        child:  TextFormField(
                          onChanged: (v){_password = v;},
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            label:Row(children: [Icon(Icons.lock_outline,color: Colors.grey,),Text("  Password")],),
                            filled: true,
                            fillColor: Colors.grey.shade50,
                            border: InputBorder.none,
                          ),
                        )
                    ),
                  ),
                ),
                Row(mainAxisAlignment:MainAxisAlignment.center,children: [Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: isChecked = false,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),Text("Remember me")],),
                SizedBox(height: size.height/40,)
                ,InkWell(onTap: (){}, child:Padding( padding: EdgeInsets.fromLTRB(50,0,50,0),child: Container(height:size.height/12,decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(50)),child: Center(child: Text("Sign in",style: TextStyle(color: Colors.white),)),))),
                SizedBox(height: size.height/30,)
                ,Row(children: [ Expanded(child: Divider()), Text("    or    ",), Expanded(child: Divider()),],),
                SizedBox(height: size.height/30,),
                Row(mainAxisAlignment: MainAxisAlignment.center,children: [Text("Continue with",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),)],),
                SizedBox(height: size.height/50,),
                Row(mainAxisAlignment:MainAxisAlignment.center,children: [
                  InkWell(child: Image.asset(height:size.height/30 ,width:size.width/20 ,'images/facebook.png')),
                  SizedBox(width: size.width/20,),
                  InkWell(onTap: (){signInWithGoogle();},
    child: Image.asset(height:size.height/30 ,width:size.width/20 ,'images/google.png')),
                  SizedBox(width: size.width/20,),
                  InkWell(child: Image.asset(height:size.height/30 ,width:size.width/20 ,'images/whatsapp.png')),
                ],),
                SizedBox(height: size.height/60,),
                Row(mainAxisAlignment: MainAxisAlignment.center,children: [Text("Don't have an account?   ",style: TextStyle(color: Colors.grey),),InkWell(onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const signUp()),);
                },child: Text("Sign up",style: TextStyle(color: Colors.green),),)],),


              ],
            )),
      ],
    );
  }
}





