import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:login_app/iu/input_decorations.dart';
import 'package:login_app/providers/login_form_provider.dart';
import 'package:login_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          // controller: controller,
          child: Column(
            children: [
              SizedBox(height: 250,),
              CardContainer(                
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    Text('Acceso', style: Theme.of(context).textTheme.headline5,),
                    SizedBox(height: 10,),
                    
                    //Crear una instancia del loginformprovirder
                    //y puede redibujar lo que contenga
                    ChangeNotifierProvider(
                      create:(_)=> LoginFormProvider(),
                      child: _LoginForm()
                    )

                    

                  ],
                )
              ),
              SizedBox(height: 50,),
              Text('Crear una nueva cuenta'),


            ],
          ),
        ),
      )
    );
  }
}


class _LoginForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    final loginForm = Provider.of<LoginFormProvider>(context);


    return Container(
      child: Form(
        //TODO: Mantener la referencia del key

        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,

        child: Column(children: [
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration:InputDecorations.authInputDecoration(
              hintText: 'juan.perez@gmail.com',
              labelText: 'Correo',
              prefixIcon: Icons.alternate_email
            ),
            onChanged: (value)=>loginForm.email = value,
            validator: (value){

              String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regExp  = new RegExp(pattern);

              return regExp.hasMatch(value ?? '')
              ? null
              :'El correoe no es valido';
            },
            
          ),
          SizedBox(height: 30,),
          TextFormField(
            autocorrect: false,
            obscureText: true,
            decoration:InputDecorations.authInputDecoration(
              hintText: '...',
              labelText: 'Contraseña',
              prefixIcon: Icons.lock_outline
            ),
            onChanged: (value)=>loginForm.password = value,
            validator: (value){

              return value != null && value.length >=6
              ? null
              :'El correoe no es valido';
            },
            
          ),

          SizedBox(height: 30,),

          MaterialButton(
          onPressed: loginForm.isLoading ? null : () async{
            // loginForm.isValidForm();

            FocusScope.of(context).unfocus();

            if(!loginForm.isValidForm()){
              return;
            }
            loginForm.isLoading = true;

            await Future.delayed(Duration(seconds: 4));
            loginForm.isLoading = false;
            // Navigator.pushNamed(context, 'home');
            Navigator.pushReplacementNamed(context,'home');

            
          },
          disabledColor: Colors.grey,
          elevation: 0,
          color: Colors.deepPurple,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80,vertical: 15),
            child: Text(

              loginForm.isLoading
              ? 'Espere'
              : 'Acceder'

              , style: TextStyle(color:Colors.white),),
          ),

          )
        ],),
      ),
    );
  }
}