import 'package:daily_planner/page/home.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                "assets/images/loginback.png",
                fit: BoxFit.cover,
              ),
            ),
            Align(
              child: Material(
                color: Colors.white,
                elevation: 30,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Container(
                  width: 300,
                  height: 600,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center, 
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.only(top: 40),
                          child: Image.asset(
                            "assets/images/mylogo.png",
                            width: 150,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsetsDirectional.only(top: 20),
                          child: Text(
                            "Đăng Nhập",
                            style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                    
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(top: 20),
                          child: SizedBox(
                            width: 270,
                            child: TextField(
                              
                              controller: emailController,
                              decoration: InputDecoration(
                                hintText: "Email",
                                
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:const BorderSide(color: Colors.black, width: 1.0)
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:const BorderSide(color: Colors.blue, width: 1.0)
                                ),
                                prefixIcon: const Icon(Icons.email, color: Colors.black, size: 20,),
                    
                              ),
                    
                    
                            ),
                          ),
                    
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(top: 20),
                          child: SizedBox(
                            width: 270,
                            child: TextField(
                              
                              controller: passController,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: "Password",
                                
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:const BorderSide(color: Colors.black, width: 1.0)
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:const BorderSide(color: Colors.blue, width: 1.0)
                                ),
                                prefixIcon: const Icon(Icons.password, color: Colors.black),
                    
                              ),
                    
                    
                            ),
                          ),
                    
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(top: 20),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context, 
                                MaterialPageRoute(builder: (context) => const TaskList())
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: const Text(
                              "Đăng Nhập" , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}