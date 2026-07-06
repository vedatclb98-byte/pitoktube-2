Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    const Text(
      "Başarı Rozetleri",
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),
    TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const AchievementsScreen(),
          ),
        );
      },
      child: const Text("Tümünü Gör"),
    ),
  ],
),

const SizedBox(height: 16),

Wrap(
  spacing: 10,
  runSpacing: 10,
  children: const [
    Chip(
      avatar: Icon(Icons.verified, color: Colors.blue),
      label: Text("Doğrulandı"),
    ),
    Chip(
      avatar: Icon(
        Icons.workspace_premium,
        color: Color(0xFF7C3AED),
      ),
      label: Text("Pi Creator"),
    ),
    Chip(
      avatar: Icon(
        Icons.star,
        color: Colors.amber,
      ),
      label: Text("Top Creator"),
    ),
  ],
),