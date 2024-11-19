import 'package:flutter/material.dart';
import 'package:flutter_train_app/components/select_seat.dart';

class SeatPage extends StatefulWidget {
  const SeatPage({super.key});

  @override
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  @override
  Widget build(BuildContext context) {
    // 전달받은 arguments를 Map으로 캐스팅
    final arguments = ModalRoute.of(context)?.settings.arguments as Map?;
    final startStation = arguments?['startStation'] ?? '출발역';
    final endStation = arguments?['endStation'] ?? '도착역';

    return Scaffold(
      appBar: AppBar(
        title: Text('좌석 선택'),
      ),
      body: Column(
        children: [
          station(startStation, endStation), // 전달받은 데이터 사용
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                label(Colors.purple, '선택됨'),
                SizedBox(width: 20),
                label(Colors.grey[300]!, '선택안됨'),
              ],
            ),
          ),
          // SelectSeat 추가
          Expanded(
            child: SelectSeat(),
          ),
        ],
      ),
    );
  }

  Row label(Color color, String select) {
    return Row(
      children: [
        SizedBox.square(
          dimension: 24,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
        SizedBox(width: 4),
        Text(select),
      ],
    );
  }

  Row station(String startStation, String endStation) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        selectedStation(startStation), // 출발역 정보
        Icon(
          Icons.arrow_circle_right_outlined,
          size: 30,
        ),
        selectedStation(endStation), // 도착역 정보
      ],
    );
  }

  Text selectedStation(String stationName) {
    return Text(
      stationName,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.purple,
        fontSize: 30,
      ),
    );
  }
}
