import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final String allowedDomain = 'student.tarc.edu.my'; // 替换为您允许的域名

  Future<void> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        // 用户取消了登录
        return;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential = await _auth.signInWithCredential(credential);
      User? user = userCredential.user;

      if (user != null) {
        String? email = user.email;
        if (email != null && email.endsWith('@$allowedDomain')) {
          // 域名符合要求，允许访问
          print('登录成功：${user.email}');
          // 在此处导航到您的应用主界面
        } else {
          // 域名不符合要求，执行登出操作
          await _auth.signOut();
          await _googleSignIn.signOut();
          _showErrorDialog('仅允许使用 $allowedDomain 域名的电子邮件地址登录。');
        }
      }
    } catch (e) {
      print('登录失败：$e');
      _showErrorDialog('登录失败，请重试。');
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('登录错误'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('确定'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google 登录示例'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _signInWithGoogle,
          child: Text('使用 Google 登录'),
        ),
      ),
    );
  }
}