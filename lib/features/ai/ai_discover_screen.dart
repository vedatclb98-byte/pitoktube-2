import 'package:flutter/material.dart';

class AIDiscoverScreen extends StatelessWidget {
  const AIDiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final recommendations = [
      (
        "Pi Network Haberleri",
        "Bugün en çok izlenen Pi videoları",
        Icons.currency_exchange,
      ),
      (
        "Flutter Geliştiricileri",
        "Sana uygun içerik üreticileri",
        Icons.code,
      ),
      (
        "Web3 Trendleri",
        "Son blockchain gelişmeleri",
        Icons.public,
      ),
      (
        "Yapay Zekâ",
        "AI ile üretilen popüler videolar",
        Icons.smart_toy,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("AI Discover"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFF7C3AED),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                children: [
                  Icon(
                    Icons.auto_awesome,
                    color: Colors.white,
                    size: 50,
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Yapay Zekâ Senin İçin Seçti",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
                        Expanded(
              child: ListView.builder(
                itemCount: recommendations.length,
                itemBuilder: (context, index) {
                  final item = recommendations[index];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: const Color(0xFF15151C),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundColor:
                              const Color(0xFF7C3AED).withOpacity(0.15),
                          child: Icon(
                            item.$3,
                            color: const Color(0xFF7C3AED),
                          ),
                        ),

                        const SizedBox(width: 16),

                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.$1,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 6),

                              Text(
                                item.$2,
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),

                        IconButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "${item.$1} önerileri yakında aktif olacak 🚀",
                                ),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
                      ],
        ),
      ),
    );
  }
}