import 'package:banana_deal_by_monkeycompany/package/api/chat_log/model/data/chat_log_dto.dart';
import 'package:banana_deal_by_monkeycompany/package/api/check_version/model/data/splash_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/api/permission/model/data/permission_entity.dart';
import 'package:banana_deal_by_monkeycompany/package/api/searh_address/model/data/address_dto.dart';
import 'package:banana_deal_by_monkeycompany/package/data/address_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/data/bootstrap/user_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/data/chat_room_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/data/check_email_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/data/monkey/model/model_list_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/data/monkey/model/phone_spec_detail_entity.dart';
import 'package:banana_deal_by_monkeycompany/package/data/monkey/model/phone_spec_detail_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/data/store/json_bool.dart';
import 'package:banana_deal_by_monkeycompany/package/data/store/store_detail_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/json_error.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/fcm/model/data/noti_list_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/date_time/const_date_time.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';

class ModelConfig {
  static const DataDto dataDto = DataDto(statusEnum: StatusEnum.initial, tokenError: false, data: []);

  static const UserVO userVO = UserVO(mIdx: 0, mEmail: '', mJoinType: '', mName: '', mAdd: '', mLatitude: '', mLongitude: '', mAddDong: '', mPathImg: '', mIsUsed: '', mPauseDuration: '', mPauseReason: '', mRegdate: '', mSearchRange: 0, mAppPush: '', mGwanggoPush: '', mChatPush: '', mUuid: '', mModel: '', mMpPush: '', mSpPush: '', mEditDateMp: '', mEditDateSp: '');

  static const JsonError jsonError = JsonError(apiUrl: '', status: 0, apiLocation: '', dioExceptionType: '');

  static const CheckEmailVO otp = CheckEmailVO(msg: '', joinType: '', authNumber: '');

  static const PermissionEntity permission = PermissionEntity(notification: false, location: false, photo: false, storage: false, camera: false, isSettings: false, permissionList: [], isIos: false);

  static const SplashVO splashVO = SplashVO(statusEnum: StatusEnum.initial,currentVersion: '');

  static const AddressSearchEntity addressSearchEntity = AddressSearchEntity(
      results: AddressSearchDTO(
          common: Common(
              errorMessage: '', countPerPage: '', totalCount: '', errorCode: '', currentPage: ''
          ),
          juso: <Juso>[]
      )
  );

  static const ChatLogDto chatLogDto = ChatLogDto(
      cIdx: 0, cRoomIdx: 0, cMessage: '', cType: '', cIsRead: '', cRegdate: '');

  static const ChatRoomVO chatRoomVO = ChatRoomVO(
      crIdx: 0, smMId: '', smIsShow: '', crStatus: '', smStoreName: '',
      smTel: '', smAddress: '', smPathImg0: '', lastMessage: '', lastMessageTime: '',
      cIsRead: 0, isDealing: 0, smToken: '', smLatitude: '', smLongitude: '', favoriteStore: 0);


  static const SpecListVO specList = SpecListVO(samsung: [], apple: [], etc: []);


  static const PhoneSpecDetailEntity phoneSpecDetailEntity = PhoneSpecDetailEntity(
      result: '', phoneSpecDetail: phoneSpecDetail, phoneImg: [], phoneOptionNum: []
  );

  static const PhoneSpecDetailDto phoneSpecDetail =
  PhoneSpecDetailDto(
    psIdx: '', mkIdx: '', mksIdx: '', psOrder: '', psName: '', psModel: '', psOs: '',
    psCpu: '', psDisplay: '', psDisplaySize: '', psCameraFront: '', psCameraBack: '',
    psWeight: '', psHeight: '', psWidth: '', psThickness: '', psInMemory: '', psExMemory: '',
    psRam: '', psBattery: '', psInfo1: '', psInfo2: '', psExplainImgPath: '', psMobileGrade: '', psTypeAnalytics: '',
    psReleaseDate: ConstDateTime(0), psRegiDate: ConstDateTime(0), psEditDate: ConstDateTime(0),
    psDualNumber: '', psAllImgPath: '', psIsAllImg: '', psSpecNfc: '', psSpecType: '', psSpecFilm: '', psSpecUsim: '', psSpecComponent: '', psSpecDesign: '',
    psSpecSpecial: '', psSpecCamera: '', psSpecAsinfo: '', psSpecAod: '', psSpecPay: '', psSpecIp: '',
  );

  static const PsSpec psSpec = PsSpec(design: '', special: '', camera: '');

  static const AddressVO addressVO = AddressVO(address: '', dong: '', coordinate: coordinate);

  static const GpsVO coordinate = GpsVO(lat: 0.0, lnt: 0.0);

  static const StoreDetailVO storeDetailVO = StoreDetailVO(
      smIdx: 0, smMId: '', smStoreName: '', smAddress: '', smTel: '', smCity: '', smCity2: '', smCity3: '',
      smPathImg0: '', smPathImg1: '', smPathImg2: '', smPathImg3: '', smPathImg4: '', smPathImg5: '', smStoreIntroduce: '',
      smConsultationTime: '', smTimeStart: '', smTimeEnd: '', smEvent1: '', smEvent2: '', smEvent3: '', smIconEvent1: '', smIconEvent2: '', smIconEvent3: '',
      smMessage: '', smLatitude: '', smLongitude: '', smRegdate: '', dealYN: 0, avgPoint: '', reviewCnt: 0, favoriteStore: 0, isDealing: 0 , reviewList: [], isDeclaration: JsonBool.Y);

}