part of escape;

class InfoBox extends Sprite {

  int _level;
  TextField _levelText;

  int _chains;
  TextField _chainsText;
  Sprite _chainsTextZoom;

  InfoBox(ResourceManager resourceManager, Juggler juggler) {

    addChild(Bitmap(resourceManager.getBitmapData("InfoBox")));

    _levelText = TextField();
    _levelText.defaultTextFormat = TextFormat("Arial", 35, 0xFFFFFF, bold:true, align:TextFormatAlign.CENTER);
    _levelText.width = 220;
    _levelText.height = 40;
    _levelText.wordWrap = false;
    //_levelText.selectable = false;
    _levelText.text = "Level 1";
    _levelText.x = 20;
    _levelText.y = 115;
    //_levelText.filters = [GlowFilter(0x000000, 0.7, 3, 3)];    // ToDo
    _levelText.rotation = -2 * math.pi / 180;
    addChild(_levelText);

    _chainsText = TextField();
    _chainsText.defaultTextFormat = TextFormat("Arial", 25, 0xFFFFFF, bold:true, align:TextFormatAlign.CENTER);
    _chainsText.width = 220;
    _chainsText.height = 30;
    _chainsText.wordWrap = false;
    //_chainsText.selectable = false;
    _chainsText.text = "40";
    _chainsText.x = -_chainsText.width / 2;
    _chainsText.y = - _chainsText.height / 2;
    //_chainsText.filters = [GlowFilter(0x000000, 0.7, 3, 3)];   // ToDo
    _chainsText.rotation = -2 * math.pi / 180;

    _chainsTextZoom = Sprite();
    _chainsTextZoom.addChild(_chainsText);
    _chainsTextZoom.x = 150;
    _chainsTextZoom.y = 172;

    addChild(_chainsTextZoom);

    Bitmap chain = Grafix.getChain(resourceManager, 3, 0);
    chain.x = 110;
    chain.y = 171;
    chain.rotation = -2 * math.pi / 180;
    chain.scaleX = chain.scaleY = 0.6;
    addChild(chain);
  }

  set level(int value) {
    _level = value;
    _levelText.text = "Level $_level";
  }

  set chains(int value) {
    _chains = value;
    _chainsText.text = "$_chains";
  }

}