import 'package:flutter/material.dart';

class ChangeCode extends StatefulWidget {
  const ChangeCode({super.key});

  @override
  State<ChangeCode> createState() => _ChangeCodeState();
}

class _ChangeCodeState extends State<ChangeCode> {
  final TextEditingController _password2Controller = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isObscure = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _validatePasswords() {
    if (_passwordController.text != _password2Controller.text) {
      return 'Las contraseñas no coinciden';
    }
    return null; // Las contraseñas coinciden
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cambiar Contraseña'),
        centerTitle: true,
        backgroundColor: Colors.red[900],
        titleTextStyle: const TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.png',
                  width: 200,
                  height: 200,
                ),
                TextFormField(
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa una contraseña';
                    }
                    return null;
                  },
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                      hintText: 'Contraseña',
                      label: Text('Contraseña'),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                          icon: Icon(_isObscure
                              ? Icons.visibility
                              : Icons.visibility_off))),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _password2Controller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor repite la contraseña';
                    }
                    return _validatePasswords(); // Validación de que ambas contraseñas coinciden
                  },
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                      hintText: 'Repetir Contraseña',
                      label: Text('Repetir Contraseña'),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                          icon: Icon(_isObscure
                              ? Icons.visibility
                              : Icons.visibility_off))),
                ),
                const SizedBox(
                  height: 48,
                ),
                SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Formulario válido')),
                        );
                      }
                    },
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.red[900],
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16))),
                    child: const Text('Guardar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
