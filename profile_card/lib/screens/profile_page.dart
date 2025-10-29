import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final VoidCallback onThemeChange;

  const ProfilePage({Key? key, required this.onThemeChange}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = 'Brewok';
  String title = 'Sastra Mesin';
  String description = 'Abri, Yapping';
  String email = 'brewok@example.com';
  String phone = '+62 812 3333 9999';

  // Gambar lokal, bukan dari internet
  final String imageAsset = 'assets/profile_pic.jpg';

  bool isEditing = false;

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: name);
    emailController = TextEditingController(text: email);
    phoneController = TextEditingController(text: phone);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    setState(() {
      name = nameController.text;
      email = emailController.text;
      phone = phoneController.text;
      isEditing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Card'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: widget.onThemeChange,
            tooltip: 'Ganti Tema',
          ),
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              Navigator.pushNamed(context, '/about');
            },
            tooltip: 'Tentang Aplikasi',
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Card(
            elevation: 4,
            margin: const EdgeInsets.all(24),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // ✅ Gambar lokal + fallback icon jika gagal
                  ClipOval(
                    child: Image.asset(
                      imageAsset,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.person, size: 60, color: Colors.grey),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(name, style: Theme.of(context).textTheme.titleLarge),
                  Text(title, style: const TextStyle(color: Colors.grey)),
                  const SizedBox(height: 8),
                  Text(description, textAlign: TextAlign.center),
                  const Divider(height: 30),
                  isEditing ? _buildEditForm() : _buildProfileInfo(),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () {
                      if (isEditing) {
                        _saveChanges();
                      } else {
                        setState(() {
                          isEditing = true;
                        });
                      }
                    },
                    icon: Icon(isEditing ? Icons.save : Icons.edit),
                    label: Text(isEditing ? 'Simpan' : 'Edit Profil'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileInfo() {
    return Column(
      children: [
        Text('Email: $email'),
        Text('Telepon: $phone'),
      ],
    );
  }

  Widget _buildEditForm() {
    return Column(
      children: [
        TextField(
          controller: nameController,
          decoration: const InputDecoration(labelText: 'Nama'),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: emailController,
          decoration: const InputDecoration(labelText: 'Email'),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: phoneController,
          decoration: const InputDecoration(labelText: 'Telepon'),
        ),
        const SizedBox(height: 12),
        ElevatedButton.icon(
          onPressed: _saveChanges,
          icon: const Icon(Icons.check),
          label: const Text('Simpan Perubahan'),
        ),
      ],
    );
  }
}
