import 'package:assignment_task/seat_grid_ui.dart';
import 'package:flutter/material.dart';

class SeatGridPage extends StatefulWidget {
  final int totalSeats;
  final int? selectedSeatNumber;
  const SeatGridPage(
      {super.key, this.selectedSeatNumber, this.totalSeats = 108});

  @override
  State<SeatGridPage> createState() => _SeatGridPageState();
}

class _SeatGridPageState extends State<SeatGridPage> {
  final scrollController = ScrollController();

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.selectedSeatNumber != null) {
      final jumpto = (widget.selectedSeatNumber ?? 0) / 12;
      scrollController.jumpTo(120 * jumpto);
    }

    return SingleChildScrollView(
      controller: scrollController,
      child: Container(
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            for (int i = 0, sn = 1; i < widget.totalSeats / 12; i++, sn += 12)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: SeatGrid(
                          selectedSeatNumber: widget.selectedSeatNumber,
                          aspectRatio: 0.9,
                          rows: 2,
                          columns: 3,
                          seatNumber: sn,
                          leftSide: true,
                        )),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: SeatGrid(
                          selectedSeatNumber: widget.selectedSeatNumber,
                          aspectRatio: 0.9,
                          rows: 2,
                          columns: 3,
                          seatNumber: sn + 6,
                          leftSide: false,
                        )),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
