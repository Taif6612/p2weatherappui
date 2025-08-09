import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color(0xFF9D52AC),
              Color(0xFF3E2D8F),
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "North America",
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Max: 24°C",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Text(
                          "Min: 18°C",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "7-Days Forecasts",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 140,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Left Arrow (flush, no border)
                          IconButton(
                            icon: const Icon(Icons.arrow_back_ios,
                                color: Colors.white),
                            onPressed: () {},
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                          ),
                          Expanded(
                            flex: 8,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              padding:
                              const EdgeInsets.symmetric(horizontal: 4),
                              children: [
                                // Monday with 3-color gradient
                                forecastCardThreeGradient(
                                  day: "Mon",
                                  temp: "19°C",
                                  imagePath:
                                  "assets/placeholder_weather.png",
                                  colors: const [
                                    Color(0xFF3E2D8F), // Top
                                    Color(0xFF533595), // Middle
                                    Color(0xFF9D52AC), // Bottom
                                  ],
                                ),
                                // Tue, Wed, Thu with 2-color gradient
                                forecastCard(
                                  day: "Tue",
                                  temp: "18°C",
                                  imagePath:
                                  "assets/placeholder_wweather.png",
                                  darkColor: const Color(0xFF3E2D8F),
                                  lightColor: const Color(0xFF8E78C8),
                                ),
                                forecastCard(
                                  day: "Wed",
                                  temp: "18°C",
                                  imagePath:
                                  "assets/placeholder_wweather.png",
                                  darkColor: const Color(0xFF3E2D8F),
                                  lightColor: const Color(0xFF8E78C8),
                                ),
                                forecastCard(
                                  day: "Thu",
                                  temp: "19°C",
                                  imagePath:
                                  "assets/placeholder_weather.png",
                                  darkColor: const Color(0xFF3E2D8F),
                                  lightColor: const Color(0xFF8E78C8),
                                ),
                              ],
                            ),
                          ),
                          // Right Arrow (flush, no border)
                          IconButton(
                            icon: const Icon(Icons.arrow_forward_ios,
                                color: Colors.white),
                            onPressed: () {},
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: const LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [
                            Color(0xFF9D52AC), // light purple bottom left
                            Color(0xFF3E2D8F), // dark purple top right
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 6),
                            blurRadius: 18,
                            spreadRadius: -6,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/placeholder_crosshair.png",
                                width: 24,
                                height: 24,
                                color: Colors.white70,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "AIR QUALITY",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Text(
                            "3 - Low Health Risk",
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            width: double.infinity,
                            height: 4,
                            decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "See more",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: Colors.white70,
                                ),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white70,
                                size: 16,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        infoCard(
                          title: "SUNRISE",
                          value: "5:28 AM",
                          subtitle: "Sunset: 7:25 PM",
                          imagePath: "assets/placeholder_sunrise.png",
                          darkColor: const Color(0xFF3E2D8F),
                          lightColor: const Color(0xFF9D52AC),
                        ),
                        infoCard(
                          title: "UV INDEX",
                          value: "4",
                          subtitle: "Moderate",
                          imagePath: "assets/placeholder_sunrise.png",
                          darkColor: const Color(0xFF3E2D8F),
                          lightColor: const Color(0xFF9D52AC),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

// Regular 2-color forecast card
  static Widget forecastCard({
    required String day,
    required String temp,
    required String imagePath,
    required Color darkColor,
    required Color lightColor,
  }) {
    return Container(
      width: 72,
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            darkColor,
            lightColor,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: const Offset(0, 8),
            blurRadius: 20,
            spreadRadius: -10,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            temp,
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Image.asset(
            imagePath,
            width: 26,
            height: 26,
            // color parameter removed here to show original icon colors
          ),
          const SizedBox(height: 8),
          Text(
            day,
            style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

// 3-color forecast card for Monday
  static Widget forecastCardThreeGradient({
    required String day,
    required String temp,
    required String imagePath,
    required List<Color> colors,
  }) {
    return Container(
      width: 72,
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: colors,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: const Offset(0, 8),
            blurRadius: 20,
            spreadRadius: -10,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            temp,
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Image.asset(
            imagePath,
            width: 26,
            height: 26,
            // color parameter removed here to show original icon colors
          ),
          const SizedBox(height: 8),
          Text(
            day,
            style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

  static Widget infoCard({
    required String title,
    required String value,
    required String subtitle,
    required String imagePath,
    required Color darkColor,
    required Color lightColor,
  }) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            lightColor, // light purple bottom left
            darkColor,  // dark purple top right
          ],
        ),

        border: Border.all(color: Colors.white, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: const Offset(0, 6),
            blurRadius: 14,
            spreadRadius: -8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                imagePath,
                width: 20,
                height: 20,
                color: Colors.white70,
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}
