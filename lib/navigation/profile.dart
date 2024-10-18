import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('profile'),
      ),
      backgroundColor: Colors.white,
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: Colors.brown.shade800,
                foregroundColor: Colors.white,
                child: const Text('AH'),
              ),
              const SizedBox(
                width: 8.0,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Julio Alberto Ocampo Villalobos',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Hace 10 Minutos',
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  )
                ],
              ),
              Spacer(),
              const Icon(Icons.more_vert),
            ],
          ),
        ),
        const Spacer(),
        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();

                // Redirigir a la pantalla de inicio de sesión
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: const Text('Cerrar Sesion')),
        )
      ]),
    );
  }
}
