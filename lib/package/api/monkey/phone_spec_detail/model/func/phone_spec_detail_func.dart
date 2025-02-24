class PhoneSpecDetailFunc {
  const PhoneSpecDetailFunc();

  String convertHtml(String spec,){
    List<String> designDetail = spec.split('\n');
    String designDetailFinal = '';
    for (int i = 0; i < designDetail.length; i++){
      if(i == 0){
        designDetail[i] = '<ul style="padding-left:0; margin-left:0;"><li style="margin: 10px 0px;">${designDetail[i]}</li>';
      } else{
        if(i == designDetail.length-1){
          designDetail[i] = '<li style="margin: 10px 0px;">${designDetail[i]}</li></ul>';
        } else{
          designDetail[i] = '<li style="margin: 10px 0px;">${designDetail[i]}</li>';
        }
      }
      designDetailFinal += designDetail[i];
    }
    return designDetailFinal;
  }

}