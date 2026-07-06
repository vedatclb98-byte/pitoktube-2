import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.play_circle_fill,
                size: 90,
                color: Color(0xFF7C3AED),
              ),

              const SizedBox(height: 24),

              const Text(
                "PitokTube",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Pi Network doğrulanmış kullanıcılar için kısa video platformu",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 40),

              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: const Color(0xFF15151C),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Column(
                  children: [
                    Icon(
                      Icons.verified_user,
                      color: Colors.green,
                      size: 40,
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Giriş yapabilmek için Pi Network KYC doğrulamanız tamamlanmış olmalıdır.",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              const Spacer(),
                            SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Gelecekte Pi Authentication burada başlayacak.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Pi Authentication yakında aktif olacak.",
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.account_balance_wallet),
                  label: const Text(
                    "Pi ile Giriş Yap",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              const Text(
                "• Sadece KYC doğrulanmış Pi hesapları desteklenir.\n"
                "• Giriş için Pi Browser Authentication kullanılacaktır.\n"
                "• Pi Wallet hesabınız otomatik olarak eşleştirilecektir.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),
              ),

              const SizedBox(height: 24),
                          ],
          ),
        ),
      ),
    );
  }
}