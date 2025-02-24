abstract class CssSize {
  const CssSize();
  // Required base properties
  double get widthCommon;
  double get heightCommon;
  double get origin;

  // Height related

  // Grid sizes
  double get sized32grid;
  double get sized24grid;
  double get sized20grid;
  double get sized16grid;
  double get sized12grid;
  double get sized8grid;
  double get sized6grid;
  double get sized4grid;
  double get sized2grid;

  // Title sizes
  double get largeTitle;
  double get subTitle;
  double get body01;
  double get body02;
  double get button;
  double get caption;

  double get titleName;
  double get titleMain;
  double get titleButton;
  double get titleLittle;
  double get titleLarge;
  double get title27;

  // Text sizes
  double get body;
  double get callout;
  double get sub;
  double get special;
  double get foot;


  // Theme
  double get extendsGap;

  // Ratio
  double get ratio;
  double get dialogCircular;


}