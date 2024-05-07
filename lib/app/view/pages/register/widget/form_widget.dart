import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peludos_pet/app/view/pages/login/from_login.dart';
import 'package:peludos_pet/app/view/pages/login/utils/send_login_form.dart';
import 'package:peludos_pet/app/view/pages/register/form_register.dart';
import 'package:peludos_pet/app/view/pages/register/utils/send_register_form.dart';
import 'package:peludos_pet/app/view/routes/routes.dart';
import 'package:peludos_pet/app/widgets/button_widget.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({super.key, required this.indice});

  final int indice;

  @override
  // ignore: no_logic_in_create_state
  State<FormLogin> createState() => _FormLoginState(indice);
}

class _FormLoginState extends State<FormLogin> {
  int _selectedIndex = 0;

  _FormLoginState(int indice) {
    _selectedIndex = indice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(0, 100, 9, 9),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 260.0, left: 30.0, right: 30.0),
            child: Center(
              child: Container(
                width: 400.0,
                height: 700.0,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10.0),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedIndex = 0;
                                });
                              },
                              child: Container(
                                height: 50.0,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          const Color.fromARGB(255, 100, 9, 9)
                                              .withOpacity(0.8),
                                      spreadRadius: -4,
                                      blurRadius: 10,
                                      offset: const Offset(5, 9),
                                    ),
                                  ],
                                  color: _selectedIndex == 0
                                      ? const Color(0xffFFEFEF)
                                      : Colors.grey,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(25.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    color: _selectedIndex == 0
                                        ? Colors.black
                                        : Colors.white,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedIndex = 1;
                                });
                              },
                              child: Container(
                                height: 50.0,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          const Color.fromARGB(255, 100, 9, 9)
                                              .withOpacity(0.8),
                                      spreadRadius: -4,
                                      blurRadius: 10,
                                      offset: const Offset(5, 9),
                                    ),
                                  ],
                                  color: _selectedIndex == 1
                                      ? const Color(0xffFFEFEF)
                                      : Colors.grey,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(25.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: _selectedIndex == 1
                                        ? Colors.black
                                        : Colors.white,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _selectedIndex == 0
                                ? 'Welcome to '
                                : 'Register to ',
                            style: GoogleFonts.inter(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Peludos Vet',
                            style: GoogleFonts.inter(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 197, 185, 185),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      _selectedIndex == 0
                          ? _buildLoginForm()
                          : _buildSignUpForm(),
                      const SizedBox(height: 20.0),
                      SizedBox(
                          width:
                              double.infinity, // Ocupa todo el ancho disponible
                          height: 50.0, // Altura deseada del botón
                          child: Button(
                              text: _selectedIndex == 0 ? 'Login' : 'Sign Up',
                              onPressed: () {
                                if (_selectedIndex == 0) {
                                  sendLoginForm(context);
                                } else {
                                  sendRegisterForm(context);
                                }
                                // Lógica para iniciar sesión o registrarse
                              })),
                      const SizedBox(height: 10.0),
                      if (_selectedIndex == 0)
                        TextButton(
                          onPressed: () {
                            router.pushNamed(Routes.RESET_PASSWORD);
                          }, 
                          child: Text('Forgot your password?', style: TextStyle(
                            fontSize: 16.0, 
                            fontFamily: GoogleFonts.inter().fontFamily,
                            decoration: TextDecoration.underline),),
                          )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildLoginForm() {
    return const FromLogin();
  }

  _buildSignUpForm() {
    return const FromRegister();
  }
}
