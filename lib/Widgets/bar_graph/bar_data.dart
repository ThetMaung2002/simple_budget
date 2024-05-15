import 'package:simple_budget/Widgets/bar_graph/individual_bar.dart';

class BarData {
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thuAmount;
  final double friAmount;
  final double satAmount;

  List<IndividualBar> barData = [];

  BarData({
    required this.sunAmount,
    required this.monAmount,
    required this.tueAmount,
    required this.wedAmount,
    required this.thuAmount,
    required this.friAmount,
    required this.satAmount,
  });

  void initializeBarData() {
    barData = [
      //* Sunday
      IndividualBar(x: 0, y: sunAmount),
      //* Monday
      IndividualBar(x: 0, y: monAmount),
      //* Tuesday
      IndividualBar(x: 0, y: tueAmount),
      //* Wednesday
      IndividualBar(x: 0, y: wedAmount),
      //* Thursday
      IndividualBar(x: 0, y: thuAmount),
      //* Friday
      IndividualBar(x: 0, y: friAmount),
      //* Saturday
      IndividualBar(x: 0, y: satAmount),
    ];
  }
}
