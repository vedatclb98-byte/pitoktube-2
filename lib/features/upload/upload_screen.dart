import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final TextEditingController titleController =
      TextEditingController();

  final TextEditingController descriptionController =
      TextEditingController();

  bool isUploading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Video Yükle"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 220,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFF15151C),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.video_library,
                    size: 70,
                    color: Color(0xFF7C3AED),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Henüz video seçilmedi",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () async {
                  HapticFeedback.mediumImpact();

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "📹 Gerçek video seçme özelliği yakında eklenecek.",
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.folder),
                label: const Text("Galeriden Video Seç"),
              ),
            ),

            const SizedBox(height: 16),
                        TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: "Video Başlığı",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: descriptionController,
              maxLines: 4,
              decoration: InputDecoration(
                labelText: "Açıklama",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                onPressed: () async {
                  if (titleController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Video başlığı giriniz.",
                        ),
                      ),
                    );
                    return;
                  }

                  setState(() {
                    isUploading = true;
                  });

                  await Future.delayed(
                    const Duration(seconds: 2),
                  );

                  setState(() {
                    isUploading = false;
                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "🚀 Video başarıyla yüklendi (Demo)",
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.cloud_upload),
                label: isUploading
                    ? const Text("Yükleniyor...")
                    : const Text("Videoyu Yayınla"),
              ),
            ),
                      ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}