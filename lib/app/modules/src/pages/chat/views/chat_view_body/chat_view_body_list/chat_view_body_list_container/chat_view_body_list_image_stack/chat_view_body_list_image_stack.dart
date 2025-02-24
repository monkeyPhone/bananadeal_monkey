import 'package:flutter/material.dart';

import '../../../../../../../../../components/image_provider/image_providers.dart';
import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../css/style.dart';
import '../../../../../../../../../routes/api_url.dart';
import '../../../../../../../../../routes/const_element.dart';
import '../../../../../../widgets/service/service_model/chat_user_room_list.dart';

class ChatViewBodyListImageStack extends StatelessWidget {
  final RoomList room;
  const ChatViewBodyListImageStack({
    super.key,
    required this.room
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child:
            ImageProviders(
                imageWidth: WidgetSize(context).height60px,
                imageHeight: WidgetSize(context).height60px,
                imageUrl: ApiConsole.imageBananaUrl+room.smPathImg0,
                errUrl: AppElement.defaultStore,
                imageLabel: AppElement.caseThumb)
        ),
        Positioned.fill(
            child:
            room.crStatus != 'NORMAL'
            ?
            Container(
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(999),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('대화', style: TextStyle(color: Style.white, fontSize: WidgetSize(context).sizedBox12, fontWeight: FontWeight.w700),),
                  SizedBox(
                    height: WidgetSize(context).sizedBox3,
                  ),
                  Text('종료', style: TextStyle(color: Style.white, fontSize: WidgetSize(context).sizedBox12, fontWeight: FontWeight.w700),),
                ],
              ),
            )
                : SizedBox()
        )
      ],
    );
  }
}
