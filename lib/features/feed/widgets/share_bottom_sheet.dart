import 'package:flutter/material.dart';

class ShareBottomSheet extends StatelessWidget {
  const ShareBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 320,
        decoration: const BoxDecoration(
          color: Color(0xFF15151C),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 12),

            Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Paylaş",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            Expanded(
              child: GridView.count(
                crossAxisCount: 4,
                children: const [
                  _ShareItem(Icons.copy, "Bağlantı"),
                  _ShareItem(Icons.message, "Mesaj"),
                  _ShareItem(Icons.group, "Grup"),
                  _ShareItem(Icons.qr_code, "QR Kod"),
                  _ShareItem(Icons.facebook, "Facebook"),
                  _ShareItem(Icons.telegram, "Telegram"),
                  _ShareItem(Icons.email, "E-posta"),
                  _ShareItem(Icons.more_horiz, "Diğer"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ShareItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const _ShareItem(this.icon, this.title);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: const Color(0xFF7C3AED),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}