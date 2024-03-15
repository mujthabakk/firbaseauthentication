import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                // ref.watch(firebaseAuthProvider).signOut().then(
                //       (value) => Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //           builder: (context) => const LoginPage(),
                //         ),
                //       ),
                //     );
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: const Center(child: Text("hello")),
    );
  }
}
