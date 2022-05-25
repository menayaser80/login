import 'package:flutter/material.dart';
import 'reuse.dart';
void main()
{
  runApp(MaterialApp(home: Login()));
}
class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var formkey=GlobalKey<FormState>();
  var emailcontroller=TextEditingController();
  var passwordcontroller=TextEditingController();
  bool ispassword=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: Icon(
          Icons.menu,
        ),
        title: Text('MeNa',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Icon(
            Icons.camera,
          ),
          SizedBox(
            width: 15.0,
          ),
          Icon(
            Icons.browse_gallery,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key:formkey ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('LOGIN',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                      controller: emailcontroller,
                      validator: (value)
                      {
                        if(value!.isEmpty&&value!=null)
                        {
                          return 'email address must not be empty';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                            Icons.email
                        ),
                        labelText: 'email address',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value)
                      {
                        print(value);
                      }
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  defaultpassword(
                    controller: passwordcontroller,
                    type: TextInputType.visiblePassword,
                    validator: (value){
                      if(value!=null &&value.isEmpty)
                      {
                        return 'password is too short';
                      }
                      return null;
                    },
                    label: 'password',
                    prefix: Icons.lock,
                    suffix: ispassword?Icons.remove_red_eye:Icons.visibility_off,
                    ispassword: ispassword,
                    suffixpressed: (){
                      setState(() {
                        ispassword=!ispassword;
                      });
                    },
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.blue,
                    child: MaterialButton(onPressed: (){
                      if(formkey.currentState!.validate())
                      {
                        print(emailcontroller.text);
                        print(passwordcontroller.text);
                      }
                    },child: Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'t have an account',
                          style: TextStyle(
                              fontSize: 20.0
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        MaterialButton(onPressed: (){},child: Text(
                          'Register Now'
                          ,style: TextStyle(
                          fontSize: 20.0,
                        ),
                        ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
