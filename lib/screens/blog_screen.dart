import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';

class BlogScreen extends StatelessWidget {
  final List<Map<String, String>> blogPosts = [
    {
      "title": "Top 5 Organic Vegetables to Buy",
      "snippet": "Discover the healthiest choices for your table.",
      "image": "https://static.vecteezy.com/system/resources/previews/033/692/531/large_2x/fresh-vegetables-on-the-table-in-the-kitchen-healthy-food-concept-fruits-and-vegetables-on-the-table-in-the-kitchen-kitchen-interior-ai-generated-free-photo.jpg", // Replace with an actual image URL
      "content": "Here we explore the top 5 organic vegetables that you should consider adding to your diet for a healthier lifestyle. From leafy greens to root vegetables, discover what makes them special and how they benefit your health."
    },
    {
      "title": "Why Direct Farm-to-Home Is the Future",
      "snippet": "Cut out the middlemen and help farmers thrive.",
      "image": "https://media.istockphoto.com/id/1447011226/photo/hydroponic-robot-farming.jpg?s=612x612&w=0&k=20&c=JVgQbVYavXC4xO3w8ea9TGcdEqNI68IgsGE97ZDKCI8=", // Replace with an actual image URL
      "content": "Direct farm-to-home is a sustainable solution that eliminates the middleman, ensuring fresh produce at better prices for consumers while supporting local farmers. Learn more about how this model is changing the agricultural landscape."
    },
    {
      "title": "How Climate Change Is Impacting Global Crop Production",
      "snippet": "Understanding the effects of climate change on farming and food security.",
      "image": "https://images.pexels.com/photos/60013/desert-drought-dehydrated-clay-soil-60013.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2", // Replace with an actual image URL
      "content": "Climate change is having a significant impact on crop production worldwide, leading to unpredictable weather patterns, droughts, and floods. This post explains how farmers are adapting to these challenges and what steps are being taken to ensure food security."
    },
    {
      "title": "Lab-Grown Meat: A New Era in Sustainable Food Production",
      "snippet": "Exploring the rise of lab-grown meat and its environmental benefits..",
      "image": "https://images.pexels.com/photos/1927383/pexels-photo-1927383.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2", // Replace with an actual image URL
      "content": "Lab-grown meat is revolutionizing the food industry, offering a more sustainable and ethical alternative to traditional meat production. This blog post discusses the benefits of lab-grown meat and its potential to change how we produce and consume food"
    },
    {
      "title": "Top 5 Organic Vegetables to Buy",
      "snippet": "Discover the healthiest choices for your table.",
      "image": "https://static.vecteezy.com/system/resources/previews/033/692/531/large_2x/fresh-vegetables-on-the-table-in-the-kitchen-healthy-food-concept-fruits-and-vegetables-on-the-table-in-the-kitchen-kitchen-interior-ai-generated-free-photo.jpg", // Replace with an actual image URL
      "content": "Here we explore the top 5 organic vegetables that you should consider adding to your diet for a healthier lifestyle. From leafy greens to root vegetables, discover what makes them special and how they benefit your health."
    },
    {
      "title": "Why Direct Farm-to-Home Is the Future",
      "snippet": "Cut out the middlemen and help farmers thrive.",
      "image": "https://media.istockphoto.com/id/1447011226/photo/hydroponic-robot-farming.jpg?s=612x612&w=0&k=20&c=JVgQbVYavXC4xO3w8ea9TGcdEqNI68IgsGE97ZDKCI8=", // Replace with an actual image URL
      "content": "Direct farm-to-home is a sustainable solution that eliminates the middleman, ensuring fresh produce at better prices for consumers while supporting local farmers. Learn more about how this model is changing the agricultural landscape."
    },
    {
      "title": "How Climate Change Is Impacting Global Crop Production",
      "snippet": "Understanding the effects of climate change on farming and food security.",
      "image": "https://images.pexels.com/photos/60013/desert-drought-dehydrated-clay-soil-60013.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2", // Replace with an actual image URL
      "content": "Climate change is having a significant impact on crop production worldwide, leading to unpredictable weather patterns, droughts, and floods. This post explains how farmers are adapting to these challenges and what steps are being taken to ensure food security."
    },
    {
      "title": "Lab-Grown Meat: A New Era in Sustainable Food Production",
      "snippet": "Exploring the rise of lab-grown meat and its environmental benefits..",
      "image": "https://images.pexels.com/photos/1927383/pexels-photo-1927383.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2", // Replace with an actual image URL
      "content": "Lab-grown meat is revolutionizing the food industry, offering a more sustainable and ethical alternative to traditional meat production. This blog post discusses the benefits of lab-grown meat and its potential to change how we produce and consume food"
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agro Blog"),
        backgroundColor: Colors.greenAccent,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        itemCount: blogPosts.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navigate to the detailed blog screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlogDetailScreen(blog: blogPosts[index]),
                ),
              );
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              margin: EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/loading.gif', // Provide your placeholder path
                    image: blogPosts[index]['image']!,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  blogPosts[index]['title']!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                ),
                subtitle: Text(
                  blogPosts[index]['snippet']!,
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 2),
    );
  }
}

class BlogDetailScreen extends StatelessWidget {
  final Map<String, String> blog;

  BlogDetailScreen({required this.blog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(blog['title']!),
        backgroundColor: Colors.greenAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            AnimatedSwitcher(
              duration: Duration(seconds: 1),
              child: Image.network(
                blog['image']!,
                key: ValueKey<String>(blog['image']!),
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Text(
              blog['content']!,
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
