import 'package:flutter/material.dart';

class SeatGrid extends StatelessWidget {
  final int rows;
  final int columns;
  final double aspectRatio;
  final bool leftSide;
  final int? selectedSeatNumber;
  List<int> hideSeats = [];
  int seatNumber;
  SeatGrid({
    super.key,
    this.selectedSeatNumber,
    required this.leftSide,
    required this.rows,
    required this.columns,
    required this.seatNumber,
    required this.aspectRatio,
  });

  String label(int i) {
    if (i % columns == 0) return 'Window';
    if ((i + 1) % columns == 0) return 'Asile';
    if ((i + 2) % columns == 0) return 'Middle ';
    return '';
  }

  Widget _getSeat(int i) {
    if ((hideSeats).contains(seatNumber)) {
      hideSeats.remove(seatNumber);
      return Seat(seatNumber: seatNumber);
    } else {
      final x = Seat(
        label: label(i),
        seatNumber: seatNumber,
        isSeatSelected: seatNumber == selectedSeatNumber,
      );
      seatNumber++;
      return x;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 128,
      decoration: BoxDecoration(
        border: Border(
          bottom: const BorderSide(width: 5, color: Colors.black87),
          top: const BorderSide(width: 5, color: Colors.black87),
          left: leftSide
              ? const BorderSide(width: 5, color: Colors.black87)
              : BorderSide.none,
          right: !leftSide
              ? const BorderSide(width: 5, color: Colors.black87)
              : BorderSide.none,
        ),
      ),
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        childAspectRatio: aspectRatio,
        crossAxisCount: columns,
        crossAxisSpacing: 3,
        mainAxisSpacing: 10.0,
        children: [for (int i = 0; i < rows * columns; i++) _getSeat(i)],
      ),
    );
  }
}

class Seat extends StatelessWidget {
  final int seatNumber;
  final String label;
  final bool isSeatSelected;
  const Seat({
    super.key,
    required this.seatNumber,
    this.label = '',
    this.isSeatSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      color: isSeatSelected ? Colors.amber : Colors.lightGreen[300],
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            seatNumber.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          FittedBox(child: Text(label)),
        ],
      ),
    );
  }
}
