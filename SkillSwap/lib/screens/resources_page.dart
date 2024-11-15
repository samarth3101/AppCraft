import 'package:flutter/material.dart';

class ResourcesPage extends StatelessWidget {
  const ResourcesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Removed the AppBar
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // One-line "Explore Learning Resources" statement
              const Text(
                'Explore Learning Resources',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),

              // Video Tutorials Section
              ResourceSection(
                sectionTitle: 'Video Tutorials',
                sectionColor: Colors.green,
                items: [
                  ResourceItem(
                    title: 'Introduction to AI',
                    description: 'Learn the basics of Artificial Intelligence.',
                    icon: Icons.play_circle_outline,
                    action: () {
                      // Simulate opening a video (replace with actual functionality)
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Opening Video'),
                            content: const Text('Do you want to watch "Introduction to AI"?'),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Watch'),
                                onPressed: () {
                                  Navigator.pop(context);
                                  // Implement actual video navigation or action
                                },
                              ),
                              TextButton(
                                child: const Text('Cancel'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                  ResourceItem(
                    title: 'Data Structures in Java',
                    description: 'A deep dive into data structures.',
                    icon: Icons.play_circle_outline,
                    action: () {
                      // Simulate opening a video (replace with actual functionality)
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Opening Video'),
                            content: const Text('Do you want to watch "Data Structures in Java"?'),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Watch'),
                                onPressed: () {
                                  Navigator.pop(context);
                                  // Implement actual video navigation or action
                                },
                              ),
                              TextButton(
                                child: const Text('Cancel'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Articles Section
              ResourceSection(
                sectionTitle: 'Articles',
                sectionColor: Colors.deepPurple,
                items: [
                  ResourceItem(
                    title: 'The Future of Machine Learning',
                    description: 'An insightful article on the future of ML.',
                    icon: Icons.article,
                    action: () {
                      // Simulate opening an article (replace with actual functionality)
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Opening Article'),
                            content: const Text('Do you want to read "The Future of Machine Learning"?'),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Read'),
                                onPressed: () {
                                  Navigator.pop(context);
                                  // Implement actual article navigation or action
                                },
                              ),
                              TextButton(
                                child: const Text('Cancel'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                  ResourceItem(
                    title: 'Understanding Neural Networks',
                    description: 'Explore the world of neural networks.',
                    icon: Icons.article,
                    action: () {
                      // Simulate opening an article (replace with actual functionality)
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Opening Article'),
                            content: const Text('Do you want to read "Understanding Neural Networks"?'),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Read'),
                                onPressed: () {
                                  Navigator.pop(context);
                                  // Implement actual article navigation or action
                                },
                              ),
                              TextButton(
                                child: const Text('Cancel'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Downloadable Resources Section
              ResourceSection(
                sectionTitle: 'Downloadable PDFs',
                sectionColor: Colors.orange,
                items: [
                  ResourceItem(
                    title: 'AI Concepts PDF',
                    description: 'Download the AI Concepts guide.',
                    icon: Icons.file_download,
                    action: () {
                      // Simulate file download (replace with actual functionality)
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Downloading PDF'),
                            content: const Text('Do you want to download "AI Concepts PDF"?'),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Download'),
                                onPressed: () {
                                  Navigator.pop(context);
                                  // Implement actual file download action
                                },
                              ),
                              TextButton(
                                child: const Text('Cancel'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                  ResourceItem(
                    title: 'Machine Learning PDF',
                    description: 'Download the Machine Learning PDF.',
                    icon: Icons.file_download,
                    action: () {
                      // Simulate file download (replace with actual functionality)
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Downloading PDF'),
                            content: const Text('Do you want to download "Machine Learning PDF"?'),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Download'),
                                onPressed: () {
                                  Navigator.pop(context);
                                  // Implement actual file download action
                                },
                              ),
                              TextButton(
                                child: const Text('Cancel'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Resource Section Widget with Customizable Section Colors
class ResourceSection extends StatelessWidget {
  final String sectionTitle;
  final List<ResourceItem> items;
  final Color sectionColor;

  const ResourceSection({
    required this.sectionTitle,
    required this.items,
    required this.sectionColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Title with a Color Highlight
        Text(
          sectionTitle,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: sectionColor,
          ),
        ),
        const SizedBox(height: 10),
        
        // Resource Items List
        Column(
          children: items.map((item) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Card(
                elevation: 8,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: Icon(
                    item.icon,
                    color: sectionColor,
                  ),
                  title: Text(
                    item.title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    item.description,
                    style: const TextStyle(color: Colors.black54),
                  ),
                  onTap: item.action, // Using the action from the ResourceItem
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

// Resource Item Model for Data Handling
class ResourceItem {
  final String title;
  final String description;
  final IconData icon;
  final VoidCallback action;

  const ResourceItem({
    required this.title,
    required this.description,
    required this.icon,
    required this.action,
  });
}