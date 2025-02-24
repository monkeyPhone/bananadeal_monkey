# banana_deal_by_monkeycompany

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

app 디렉토리는 구글 스토어, 앱 스토어에 등록되었던 flutter project 입니다. 
verse 디렉토리는 2차 작업 2024년 11월 ~ 2025년 1월 동안 banana 디렉토리 3차 수정 작업중에 package 작업중에 프로젝트 중단으로 사용할 수 없는 상태입니다. 

사용하기 위해선 해당 코드들 수정해야합니다. 

최종 3차 작업 형태는 Flutter Multi-Package Architecture 에 따라 Flutter Bloc 디자인 패턴을 적용했습니다. 

app - getx mvc 패턴
verse - flutter bloc - 모놀리식 bloc 패턴 적용 ( 디렉토리는 나눠져있지만 Presentation layer와 Business layer 가 분리되지 않은 상태)
banana -  Flutter Multi-Package Architecture 적용 시도.

bloc과 mvvm은 차이가 있습니다!


MVVM	
데이터 바인딩	View ↔ ViewModel 사이에서만 발생	
이벤트 처리	ViewModel에 알려줘야함 
상태 변화 감지	notifyListeners() 필요	

BLoC
데이터 바인딩	이벤트 발생 위치와 무관하게 상태 관리
이벤트 처리		이벤트 발생과 상관없이 Stream을 통해 처리
상태 변화 감지		Stream을 통해 자동 감지

Flutter Multi-Package Architecture 공부한 내용을 banana_example을 통해, 남겨 놓을테니 코드를 이용하여 앱작업하실때 참고하면 됩니다. 
lib 파일 내에서 다 작성하는 것에 비교해서 이득도 있지만 단점도 있습니다. 이를 관리해주는 Melos라는 패키지 통합 관리 cli도구가 잇어야 지속적인 관리가 가능할 것입니다. 
단점은 직접 작업하면 알게 될 것이며, melos도 공부가 필요하기 때문에, 아직 학습이 부족하여 적용은 못한 상태입니다. 
