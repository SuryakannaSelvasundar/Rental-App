import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:rental_app/location_card.dart';
import 'package:rental_app/most_viewed_card.dart';
import 'package:rental_app/recommended_card.dart';

import 'location.dart';


class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> mostViewed = [
    {
      'price': '\$90',
      'title': 'Carinthia Lake see Breakfast',
      'subtitle': 'Private room / 4 beds',
      'rating': 4,
      'image':
      'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcThwl9WXeXVJA6dTufyys2TDMZulaLfWLTxqVo_6OBVyJpFMa7q',
    },
    {
      'price': '\$300',
      'title': 'Luxury Villa in Moscow',
      'subtitle': 'Private villa / 3 beds',
      'rating': 2,
      'image': 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSE-XycA5mMqIe-yH7JvSoyvHU98gujkq4y4wGG_c-pttc3VspC',
    },
    {
      'price': '\$120',
      'title': 'Beachfront Bungalow',
      'subtitle': 'Private room / 2 beds',
      'rating': 3,
      'image': 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQ9CqdreAlZW3g9fnOduZ6_4WQQwy2sSxWVxKa3ma8XksH2SAbI',
    },
  ];

  final List<Map<String, String>> locations = [
    {
      'image': 'https://images.news18.com/ibnlive/uploads/2021/09/untitled-3-13-16460786444x3.jpg?impolicy=website&width=360&height=270',
      'title': 'India',
    },
    {
      'image': 'https://www.tahagasht.com/uploads/blocks_intro/russia-landing2.jpg',
      'title': 'Moscow',
    },
    {
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8BI8vRe5IrGSbciqzt2UU9_aASoTZ5Tqz3moXfra-KUkMkeKi',
      'title': 'USA',
    },
    {
      'image': 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/67/London_Skyline_%28125508655%29.jpeg/278px-London_Skyline_%28125508655%29.jpeg',
      'title': 'London',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isWideScreen = constraints.maxWidth > 600;
        
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Explore the world! By Travelling",
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                                prefixIcon: CircleAvatar(
                                backgroundColor: Colors.black12,
                                  child: Icon(Icons.search)),
                              hintText: "    Where did you go?",
                              hintStyle: TextStyle(color: Colors.black),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Stack(
                          children:[
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                Icons.filter_alt,
                                color: Colors.white,
                              ),
                            ),
                            Positioned(
                              top: 6,
                              left: 7,
                              child: Container(
                                height: 38,
                                width: 38,
                                child: Image.network("https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQeaxpKZCHtlj4UQpflajK-CB_DWWaHpuZ13MTZNhIAFYXvTGy6"),
                              ),
                            )
                          ]
                         
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 190),
                          child: Text(
                            "Popular locations",
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Container(
                          height: 120,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: locations.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 16),
                                child: Container(
                                  height: 120,
                                  width: 100,
                                  child: LocationCard(
                                    image: locations[index]['image']!,
                                    title: locations[index]['title']!,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    Text(
                      "Recommended",
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                      height: isWideScreen ? 400 : 250,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: mostViewed.length,
                        itemBuilder: (context, index) {
                          final item = mostViewed[index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: RecommendedCard(
                              price: item['price']!,
                              title: item['title']!,
                              subtitle: item['subtitle']!,
                              rating: item['rating'],
                              image: item['image']!,
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 24),
                    Text(
                      "Most viewed",
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: mostViewed.length,
                      itemBuilder: (context, index) {
                        final item = mostViewed[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: MostViewedCard(
                            price: item['price']!,
                            title: item['title']!,
                            subtitle: item['subtitle']!,
                            rating: item['rating'],
                            image: item['image']!,
                          ),
                        );
                      },
                    ),
                  ],
                )

              ),
            );
          },
        ),
      ),
    );
  }
}