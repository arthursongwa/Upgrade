import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartSample2 extends StatefulWidget {
  final double minX;
  final double maxX;
  final double minY;
  final double maxY;
  final List<FlSpot> spots;
  final bool isCurved;
  final List<Color> gradientColors;
  final double barWidth;
  final bool showDot;
  final Color color;
  final Color colorText;
  final Color gridColor;
  final double gridWidth;
  final List<int>? dashArray;
  final String unitX;
  final String unitY;

  const LineChartSample2({
    super.key,
    required this.spots,
    this.minX = 0,
    this.maxX = 11,
    this.minY = 0,
    this.maxY = 6,
    this.isCurved = true,
    this.showDot = false,
    this.barWidth = 4,
    this.gradientColors = const [Colors.cyan, Colors.blue],
    this.gridColor = Colors.grey,
    this.color = Colors.green,
    this.colorText = Colors.grey,
    this.gridWidth = 1,
    this.dashArray = const [5, 5],
    this.unitX = 'kg',
    this.unitY = 'kg',
  });

  @override
  State<LineChartSample2> createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.80,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 18,
              left: 12,
              top: 24,
              bottom: 12,
            ),
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: const Color(0xFF161D26),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                child: LineChart(showAvg ? avgData() : mainData()),
              ),
            ),
          ),
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.only(top: 30, left: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Titre de "),
                TextButton(
                  onPressed: () {
                    setState(() {
                      showAvg = !showAvg;
                    });
                  },
                  child: Text(
                    'avg',
                    style: TextStyle(
                      fontSize: 12,
                      color:
                          showAvg
                              ? Colors.white.withValues(alpha: 0.5)
                              : Colors.white,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Icon(Icons.swap_horiz),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  double getAvg(List<FlSpot> points) {
    if (points.isEmpty) return 0;
    double avg = points.fold(0, (total, spot) => total + spot.y);
    return avg / points.length;
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = const Text('MAR', style: style);
        break;
      case 5:
        text = const Text('JUN', style: style);
        break;
      case 10:
        text = const Text('SEP', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(meta: meta, child: text);
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(fontWeight: FontWeight.bold, fontSize: 15);
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10K';
        break;
      case 3:
        text = '30k';
        break;
      case 5:
        text = '50k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        drawHorizontalLine: false,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: widget.gridColor,
            dashArray: widget.dashArray,
            strokeWidth: widget.gridWidth,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: widget.gridColor,
            dashArray: widget.dashArray,
            strokeWidth: widget.gridWidth,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: (value, meta) {
              // Retourne un widget (souvent un Text)
              return Text(
                '${value.toInt()}',
                style: TextStyle(color: widget.colorText),
              ); // exemple dynamique pour poids
            },
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: (value, meta) {
              // Retourne un widget (souvent un Text)
              return Text(
                '${value.toInt()}',
                style: TextStyle(color: widget.colorText),
              ); // exemple dynamique pour poids
            },
            reservedSize: 20,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
        border: Border.all(color: widget.gridColor),
      ),
      minX: widget.minX,
      maxX: widget.maxX,
      minY: widget.minY,
      maxY: widget.maxY,
      lineBarsData: [
        LineChartBarData(
          spots: widget.spots,
          isCurved: widget.isCurved,
          color: widget.color,
          barWidth: widget.barWidth,
          isStrokeCapRound: true,
          dotData: FlDotData(show: widget.showDot),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors:
                  widget.gradientColors
                      .map((color) => color.withValues(alpha: 0.15))
                      .toList(),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData avgData() {
    double avg = getAvg(widget.spots);
    return LineChartData(
      lineTouchData: const LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: false,
        verticalInterval: 1,
        horizontalInterval: 1,
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: widget.gridColor,
            dashArray: widget.dashArray,
            strokeWidth: widget.gridWidth,
          );
        },
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: widget.gridColor,
            dashArray: widget.dashArray,
            strokeWidth: widget.gridWidth,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: (value, meta) {
              // Retourne un widget (souvent un Text)
              return Text(
                '${value.toInt()}',
                style: TextStyle(color: widget.colorText),
              ); // exemple dynamique pour poids
            },
            interval: 1,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) {
              // Retourne un widget (souvent un Text)
              return Text(
                '${value.toInt()}',
                style: TextStyle(color: widget.colorText),
              ); // exemple dynamique pour poids
            },
            reservedSize: 20,
            interval: 1,
          ),
        ),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(
        show: false,
        border: Border.all(color: widget.gridColor),
      ),
      minX: widget.minX,
      maxX: widget.maxX,
      minY: widget.minY,
      maxY: widget.maxY,
      lineBarsData: [
        LineChartBarData(
          spots:
              widget.spots.map((spot) {
                return FlSpot(spot.x, avg); // Remplace dynamiquement Y
              }).toList(),
          isCurved: widget.isCurved,
          gradient: LinearGradient(
            colors: [
              ColorTween(
                begin: widget.gradientColors[0],
                end: widget.gradientColors[1],
              ).lerp(0.2)!,
              ColorTween(
                begin: widget.gradientColors[0],
                end: widget.gradientColors[1],
              ).lerp(0.2)!,
            ],
          ),
          barWidth: widget.barWidth,
          isStrokeCapRound: true,
          dotData: FlDotData(show: widget.showDot),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                ColorTween(
                  begin: widget.gradientColors[0],
                  end: widget.gradientColors[1],
                ).lerp(0.2)!.withValues(alpha: 0.1),
                ColorTween(
                  begin: widget.gradientColors[0],
                  end: widget.gradientColors[1],
                ).lerp(0.2)!.withValues(alpha: 0.1),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
