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
          child: Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
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
                    // Dynamic spacing based on screen height
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    Text(
                      "7-Days Forecasts",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // ---------- Forecast area aligned with Air Quality start ----------
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: SizedBox(
                        height: 180, // increased height for taller cards
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            final double arrowWidth = 1.0;
                            final List<Widget> cards = [
                              forecastCardThreeGradient(
                                day: "Mon",
                                temp: "19°C",
                                imagePath: "assets/placeholder_weather.png",
                                colors: const [
                                  Color(0xFF3E2D8F),
                                  Color(0xFF533595),
                                  Color(0xFF9D52AC),
                                ],
                              ),
                              forecastCard(
                                day: "Tue",
                                temp: "18°C",
                                imagePath: "assets/placeholder_wweather.png",
                                darkColor: const Color(0xFF3E2D8F),
                                lightColor: const Color(0xFF8E78C8),
                              ),
                              forecastCard(
                                day: "Wed",
                                temp: "18°C",
                                imagePath: "assets/placeholder_wweather.png",
                                darkColor: const Color(0xFF3E2D8F),
                                lightColor: const Color(0xFF8E78C8),
                              ),
                              forecastCard(
                                day: "Thu",
                                temp: "19°C",
                                imagePath: "assets/placeholder_weather.png",
                                darkColor: const Color(0xFF3E2D8F),
                                lightColor: const Color(0xFF8E78C8),
                              ),
                            ];

                            final double totalWidth = constraints.maxWidth;
                            final double cardsAreaWidth = totalWidth - (arrowWidth * 2);
                            const double cardWidth = 88.0; // increased card width
                            final int n = cards.length;

                            double spacing = (cardsAreaWidth - (n * cardWidth)) / (n - 1);
                            final bool fitsNonScrollable = spacing >= 0;

                            if (fitsNonScrollable) {
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: arrowWidth,
                                    child: IconButton(
                                      icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                                      onPressed: () {},
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      padding: EdgeInsets.zero,
                                      constraints: const BoxConstraints(minWidth: 0, minHeight: 0),
                                      iconSize: 18,
                                    ),
                                  ),
                                  SizedBox(
                                    width: cardsAreaWidth,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        for (int i = 0; i < n; i++) ...[
                                          SizedBox(width: cardWidth, child: cards[i]),
                                          if (i != n - 1) SizedBox(width: spacing),
                                        ]
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: arrowWidth,
                                    child: IconButton(
                                      icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                                      onPressed: () {},
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      padding: EdgeInsets.zero,
                                      constraints: const BoxConstraints(minWidth: 0, minHeight: 0),
                                      iconSize: 18,
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: arrowWidth,
                                    child: IconButton(
                                      icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                                      onPressed: () {},
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      padding: EdgeInsets.zero,
                                      constraints: const BoxConstraints(minWidth: 0, minHeight: 0),
                                      iconSize: 18,
                                    ),
                                  ),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      padding: const EdgeInsets.symmetric(horizontal: 6),
                                      child: Row(
                                        children: cards.map((c) => Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 6),
                                          child: SizedBox(width: cardWidth, child: c),
                                        )).toList(),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: arrowWidth,
                                    child: IconButton(
                                      icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                                      onPressed: () {},
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      padding: EdgeInsets.zero,
                                      constraints: const BoxConstraints(minWidth: 0, minHeight: 0),
                                      iconSize: 18,
                                    ),
                                  ),
                                ],
                              );
                            }
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),

                    // Air Quality (nudged right)
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: const LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [
                              Color(0xFF9D52AC),
                              Color(0xFF3E2D8F),
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
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),

                    // SUNRISE & UV (nudged right)
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.92),
                                  width: 1.6,
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black45,
                                    offset: Offset(0, 6),
                                    blurRadius: 12,
                                    spreadRadius: -6,
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: infoCard(
                                  title: "SUNRISE",
                                  value: "5:28 AM",
                                  subtitle: "Sunset: 7:25 PM",
                                  imagePath: "assets/placeholder_sunrise.png",
                                  darkColor: const Color(0xFF3E2D8F),
                                  lightColor: const Color(0xFF9D52AC),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.92),
                                  width: 1.6,
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black45,
                                    offset: Offset(0, 6),
                                    blurRadius: 12,
                                    spreadRadius: -6,
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: infoCard(
                                  title: "UV INDEX",
                                  value: "4",
                                  subtitle: "Moderate",
                                  imagePath: "assets/placeholder_sunrise.png",
                                  darkColor: const Color(0xFF3E2D8F),
                                  lightColor: const Color(0xFF9D52AC),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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

  // ---------- forecast card widgets updated for larger size ----------
  static Widget forecastCard({
    required String day,
    required String temp,
    required String imagePath,
    required Color darkColor,
    required Color lightColor,
  }) {
    return Container(
      width: 88, // increased width
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8), // increased vertical padding
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
      top: Radius.circular(50),    // round top corners
      bottom: Radius.circular(50), // round bottom corners
    ),
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
              fontSize: 16, // slightly larger
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Image.asset(
            imagePath,
            width: 32, // bigger icon
            height: 32,
          ),
          const SizedBox(height: 10),
          Text(
            day,
            style: GoogleFonts.poppins(
              fontSize: 14, // slightly larger
              fontWeight: FontWeight.w500,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

  static Widget forecastCardThreeGradient({
    required String day,
    required String temp,
    required String imagePath,
    required List<Color> colors,
  }) {
    return Container(
      width: 88, // increased width
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(50),    // round top corners
          bottom: Radius.circular(50), // round bottom corners
        ),
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
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Image.asset(
            imagePath,
            width: 32,
            height: 32,
          ),
          const SizedBox(height: 10),
          Text(
            day,
            style: GoogleFonts.poppins(
              fontSize: 14,
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
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            lightColor,
            darkColor,
          ],
        ),
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
