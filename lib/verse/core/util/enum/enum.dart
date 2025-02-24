//router redirect

//service_dio
enum RestApiEnum {guest, user, kakao, apple, chatApi, chatImg}

//api status
enum StatusEnum {
  initial, loading, success, later, failure, exception, error, network, token
}


enum InfoUserStateEnum {
  profile, location, finish
}

enum NavEnum {home,  store, deal, chat, etc}

enum UploadEnum {none ,userInfo, chat, declaration, thumbnail, }

enum OtpProgressEnum {email, otp, pw, finish}

enum WidgetDirectionEnum {left, right, top, bottom}


enum AuthProgressEnum {login, sign}

enum DownLoadEnum {initial, loading, success, fail}


enum EventEnum {
  userInfoEvent, searchAddressEvent, naverMapEvent, srcHomeEvent, address
}


enum StepWidgetEnum {
  deal, invite, finish
}

enum StepEnum {
  age, currentAgency, requestAgency, selectModel, recModel, selectRate, recRate, promotion, finish
}

enum PromotionEnum {maxInstallment, supportType, combination, welfare, request}


enum ModelDetailEnum {image, detail, spec}

enum ReservationEnum {estimate, chat}