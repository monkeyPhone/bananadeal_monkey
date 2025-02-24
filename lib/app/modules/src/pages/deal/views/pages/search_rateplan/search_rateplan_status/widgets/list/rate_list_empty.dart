import 'package:flutter/material.dart';

class RateListEmpty extends StatelessWidget {
  const RateListEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Center(
              child: Text(MediaQuery.of(context).viewInsets.bottom > 0
                  ? '요금제 검색 중입니다.' : '검색된 요금제가 없습니다.'
              ),
            )
        ),
        SizedBox(
          height: MediaQuery.of(context).viewInsets.bottom > 0 ? MediaQuery.of(context).viewInsets.bottom : 0,
        )
      ],
    );
  }
}
