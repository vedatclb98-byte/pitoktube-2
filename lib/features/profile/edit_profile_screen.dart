import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final nameController = TextEditingController(
    text: "@pitoktube",
  );

  final bioController = TextEditingController(
    text: "🚀 Pi Network Creator",
  );

  @override
  void dispose() {
    nameController.dispose();
    bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profili Düzenle"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Center(
            child: CircleAvatar(
              radius: 55,
              backgroundColor: Color(0xFF7C3AED),
              child: Icon(
                Icons.person,
                size: 55,
                color: Colors.white,
              ),
            ),
          ),

          const SizedBox(height: 30),

          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              labelText: "Kullanıcı Adı",
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 20),

          TextField(
            controller: bioController,
            maxLines: 3,
            decoration: const InputDecoration(
              labelText: "Biyografi",
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 30),

          SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Kaydet"),
            ),
          ),
        ],
      ),
    );
  }
}