part of supersonic;

class AbortGameMenu extends Menu {

  SimpleButton btn_yes;
  SimpleButton btn_no;

  TextField text_yes;
  TextField text_no;

  int buttonBorderBottom = 40;
  int buttonBorderH = 30;

  AbortGameMenu(Game game, [String fontName = defaultFont]):super(game, true, fontName) {
    this.fontName = fontName;

    this.removeEventListeners(MouseEvent.CLICK);
    this.removeEventListeners(MouseEvent.MOUSE_DOWN);

    this.createChildren();
  }

  void createChildren() {

    var mGame = this.game as MissileGame;

    this.textField.wordWrap = true;
    this.text = mGame.getResource("GENexitquery");

    this.btn_yes = SimpleButton(
      Bitmap(resourceManager.getTextureAtlas("items").getBitmapData("but_yes")),
      Bitmap(resourceManager.getTextureAtlas("items").getBitmapData("but_yes2")),
      Bitmap(resourceManager.getTextureAtlas("items").getBitmapData("but_yes2")),
      Bitmap(resourceManager.getTextureAtlas("items").getBitmapData("but_yes2"))
    );

    this.btn_yes.x = buttonBorderH;
    this.btn_yes.y = Menu.menuHeight - this.btn_yes.height - buttonBorderBottom;
    this.btn_yes.addEventListener(MouseEvent.CLICK, this.yes);
    this.addChild( this.btn_yes );


    this.btn_no = SimpleButton(
      Bitmap(resourceManager.getTextureAtlas("items").getBitmapData("but_no")),
      Bitmap(resourceManager.getTextureAtlas("items").getBitmapData("but_no2")),
      Bitmap(resourceManager.getTextureAtlas("items").getBitmapData("but_no2")),
      Bitmap(resourceManager.getTextureAtlas("items").getBitmapData("but_no2"))
    );

    this.btn_no.x = Menu.menuWidth - this.btn_no.width - buttonBorderH;
    this.btn_no.y = Menu.menuHeight - this.btn_yes.height - buttonBorderBottom;
    this.btn_no.addEventListener(MouseEvent.CLICK, this.no);
    this.addChild( this.btn_no );

    this.text_yes = TextField();
    this.text_yes.addEventListener(MouseEvent.CLICK, this.btn_yes.dispatchEvent);
    this.text_yes.textColor = 0x000000;
    this.text_yes.defaultTextFormat = TextFormat(fontName, 48, 0, bold:true, align:TextFormatAlign.LEFT);
    this.text_yes.height = 60;
    this.text_yes.x = this.btn_yes.x + this.btn_yes.width;
    this.text_yes.y = this.btn_yes.y + 5;
    this.addChild( this.text_yes );
    this.text_yes.text = mGame.getResource("GENyes");

    this.text_no = TextField();
    this.text_no.addEventListener(MouseEvent.CLICK, this.btn_no.dispatchEvent);
    this.text_no.textColor = 0x000000;
    this.text_no.defaultTextFormat = TextFormat(fontName, 48, 0, bold:true, align:TextFormatAlign.RIGHT);
    this.text_no.height = 60;
    this.text_no.x = this.btn_no.x - this.text_no.width;
    this.text_no.y = this.btn_yes.y + 5;
    this.addChild( this.text_no );
    this.text_no.text = mGame.getResource("GENno");
  }

  @override
  void defaultAction() {
    no(null);
  }

  void yes(Event event) {
    destroy();
    this.dispatchEvent(MenuEvent(MenuEvent.TYPE_OK, this));
  }

  void no(Event event) {
    destroy();
    this.dispatchEvent(MenuEvent(MenuEvent.TYPE_CANCEL, this));
  }

}