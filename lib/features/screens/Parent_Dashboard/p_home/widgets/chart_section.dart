import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartSection extends StatelessWidget {
  const ChartSection({super.key});

  @override
  Widget build(BuildContext context) {
    const mainColor = Color(0xFF26A69A);

    return Container(
      padding: const EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
      decoration: BoxDecoration(
        color: Colors.white,
        // borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          // 1. The Line Chart
          SizedBox(
            height: 140,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (value) => FlLine(
                    // withValues implementation for grid
                    color: Colors.grey.withValues(alpha: 0.2),
                    strokeWidth: 1,
                    dashArray: [5, 5],
                  ),
                ),
                titlesData: const FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: const [
                      FlSpot(0, 1),
                      FlSpot(1, 3.2),
                      FlSpot(2, 3),
                      FlSpot(3, 4.5),
                      FlSpot(4, 3.5),
                      FlSpot(5, 2.5),
                      FlSpot(6, 2.8),
                      FlSpot(7, 2.2),
                      FlSpot(8, 4),
                      FlSpot(9, 1),
                      FlSpot(10, 2),
                      FlSpot(11, 2.5),
                    ],
                    isCurved: true,
                    curveSmoothness: 0.5, // Extra smooth curves
                    color: mainColor,
                    barWidth: 3,
                    isStrokeCapRound: true,
                    // Showing ONLY the last dot
                    dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, barData, index) {
                        if (index == 11) {
                          return FlDotCirclePainter(
                            radius: 4,
                            color: Colors.white,
                            strokeWidth: 2,
                            strokeColor: mainColor,
                          );
                        }
                        return FlDotCirclePainter(radius: 0);
                      },
                    ),
                    belowBarData: BarAreaData(
                      show: true,
                      // withValues for gradient opacity
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          mainColor.withValues(alpha: 0.3),
                          mainColor.withValues(alpha: 0.0),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 10),

          // 2. Days Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: ["S", "M", "T", "W", "T", "F", "S"].map((day) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                child: Text(
                  day,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 20),

          // 3. View all Insights Button
          SizedBox(
            width: 230, // Mobile friendly width
            height: 52,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4DB6AC),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              child: const Text(
                "View all Insights",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
