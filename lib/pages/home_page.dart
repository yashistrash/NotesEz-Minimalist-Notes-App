import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project/pages/mainpage.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:google_fonts/google_fonts.dart';


class Homepage extends StatefulWidget {
  const Homepage ({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? _user;

  @override
  void initState() {
    super.initState();
    _auth.authStateChanges().listen((event) {
      setState(() {
        _user = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('lib/images/logo.png', height: 55, width: 55),
            SizedBox(width: 10), // Adjust the spacing between the image and text
            Text(
              "NotesEZ",
              style: GoogleFonts.chakraPetch(
                textStyle: TextStyle(fontSize: 30), // Adjust the font size as needed
                backgroundColor: Theme.of(context).colorScheme.background,
              ),
            ),
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: _user != null ? _userInfo() : _googleSignInButton(),
    );
  }



  Widget _googleSignInButton() {
    return Center(child: SizedBox(
        height: 50,
        child: SignInButton(
          Buttons.google, text: "Sign up with Google", onPressed: _handleGoogleSignIn,)
    ));
  }

  Widget _userInfo() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
          height:100,
          width: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(_user!.photoURL!),
            ),
          ),
          ),
          Text(_user!.email!,style: GoogleFonts.chakraPetch()),
          Text(_user!.displayName ?? "",style: GoogleFonts.chakraPetch()),
          MaterialButton(
            color: Colors.grey.shade700,
              onPressed: _auth.signOut,
              child: Text("Sign Out",style: GoogleFonts.chakraPetch(textStyle: TextStyle(color: Theme.of(context).colorScheme.background))),
          ),
        const SizedBox(width: 20), // Adjust the spacing between buttons as needed
        MaterialButton(
          color: Theme.of(context).colorScheme.primary,
          child: Text("Continue", style: GoogleFonts.chakraPetch(textStyle: TextStyle(color: Theme.of(context).colorScheme.background))),
          onPressed: (){
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => const mainpage()),
            );
          }),
        ],
      )
    );
  }
  void _handleGoogleSignIn() {
    try {
      GoogleAuthProvider _googleAuthProvider = GoogleAuthProvider();
      _auth.signInWithProvider(_googleAuthProvider);
    } catch (error) {
      print(error);
    }

  }
}

