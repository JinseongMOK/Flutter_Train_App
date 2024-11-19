import 'package:flutter/material.dart';

class SelectSeat extends StatefulWidget {
  const SelectSeat({super.key});

  @override
  State<SelectSeat> createState() => _SelectSeatState();
}

class _SelectSeatState extends State<SelectSeat> {
  // 좌석 선택 상태 관리 (여기서는 80개 좌석을 예시로 설정, 20줄 x 4좌석)
  final List<bool> _selectedSeats = List.generate(80, (index) => false);

  void toggleSeat(int index) {
    setState(() {
      _selectedSeats[index] = !_selectedSeats[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 21, // 알파벳 줄 + 20개의 좌석 줄
      itemBuilder: (context, index) {
        if (index == 0) {
          return seatAlphabet(); // 첫 번째 줄: 알파벳
        } else {
          return seatRow(index); // 나머지 줄: 좌석 행
        }
      },
    );
  }

  // 좌석 알파벳 열
  Row seatAlphabet() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: ['A', 'B', '', 'C', 'D'].map((letter) => row(letter)).toList(),
    );
  }

  // 한 줄의 좌석
  Widget seatRow(int rowNumber) {
    int baseIndex = (rowNumber - 1) * 4;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          mySeat(baseIndex),
          SizedBox(width: 4),
          mySeat(baseIndex + 1),
          SizedBox(width: 4),
          seatColNum(rowNumber),
          SizedBox(width: 4),
          mySeat(baseIndex + 2),
          SizedBox(width: 4),
          mySeat(baseIndex + 3),
        ],
      ),
    );
  }

  // 좌석 번호 표시
  Container seatColNum(int colNum) {
    return Container(
      width: 50,
      height: 50,
      alignment: Alignment.center,
      child: Text(
        '$colNum',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  // 알파벳 및 좌석 생성용 위젯
  SizedBox row(String alphabet) {
    return SizedBox.square(
      dimension: 50,
      child: Center(
        child: Text(
          alphabet,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  // 좌석 위젯
  Widget mySeat(int index) {
    return GestureDetector(
      onTap: () => toggleSeat(index),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: _selectedSeats[index]
              ? Colors.purple
              : Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
