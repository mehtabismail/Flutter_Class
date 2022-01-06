// Connect via USB: adb tcpip 5555.
// Disconnect USB, Get Phone Ip Address Settings > About Phone > Status.
// Now adb connect 192.168.0.100

//  void SignIn(String email, String password) async{
//     if (_formKey.currentState!.validate()) {
//       await _auth.signInWithEmailAndPassword(email: email, password: password).then((uid) => {
//         Fluttertoast.showToast(msg: "Login Successful"),
//         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()))
//       }).catchError((e){
//         Fluttertoast.showToast(msg: e!.message);
//       });
      
//   }


// width: MediaQuery.of(context).size.width,