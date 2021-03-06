{
Ultibo CP1251 (ANSI) interface unit.

Copyright (C) 2016 - SoftOz Pty Ltd.

Arch
====

 <All>

Boards
======

 <All>

Licence
=======

 LGPLv2.1 with static linking exception (See COPYING.modifiedLGPL.txt)
 
Credits
=======

 Information for this unit was obtained from:

 
References
==========


CP1251 ANSI (Cyrillic)
======================

 Note: This unit automatically includes CP866OEM as the matching OEM code page.

}

{$mode delphi} {Default to Delphi compatible syntax}
{$H+}          {Default to AnsiString}
{$inline on}   {Allow use of Inline procedures}

unit CP1251ANSI;

interface

uses GlobalConfig,GlobalConst,GlobalTypes,Locale;

{==============================================================================}
{Global definitions}
{$INCLUDE ..\core\GlobalDefines.inc}
        
{==============================================================================}
{const}
 {CP1251ANSI specific constants}

{==============================================================================}
{type}
 {CP1251ANSI specific types}

{==============================================================================}
{var}
 {CP1251ANSI specific variables}

{==============================================================================}
{Initialization Functions}
procedure CP1251ANSIInit;
 
{==============================================================================}
{CP1251ANSI Functions}
 
{==============================================================================}
{CP1251ANSI Helper Functions}
 
{==============================================================================}
{==============================================================================}

implementation

uses CP866OEM;

{==============================================================================}
{==============================================================================}
var
 {CP1251ANSI specific variables}
 CP1251ANSIInitialized:Boolean;

 CPANSI1251:TCodeTable = (
  MaxCharSize:1;
  DefaultChar:(
  $3F,$00);
  LeadByte:(
  $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00);
  Values:(
  $0000,$0001,$0002,$0003,$0004,$0005,$0006,$0007,
  $0008,$0009,$000A,$000B,$000C,$000D,$000E,$000F,
  $0010,$0011,$0012,$0013,$0014,$0015,$0016,$0017,
  $0018,$0019,$001A,$001B,$001C,$001D,$001E,$001F,
  $0020,$0021,$0022,$0023,$0024,$0025,$0026,$0027,
  $0028,$0029,$002A,$002B,$002C,$002D,$002E,$002F,
  $0030,$0031,$0032,$0033,$0034,$0035,$0036,$0037,
  $0038,$0039,$003A,$003B,$003C,$003D,$003E,$003F,
  $0040,$0041,$0042,$0043,$0044,$0045,$0046,$0047,
  $0048,$0049,$004A,$004B,$004C,$004D,$004E,$004F,
  $0050,$0051,$0052,$0053,$0054,$0055,$0056,$0057,
  $0058,$0059,$005A,$005B,$005C,$005D,$005E,$005F,
  $0060,$0061,$0062,$0063,$0064,$0065,$0066,$0067,
  $0068,$0069,$006A,$006B,$006C,$006D,$006E,$006F,
  $0070,$0071,$0072,$0073,$0074,$0075,$0076,$0077,
  $0078,$0079,$007A,$007B,$007C,$007D,$007E,$007F,
  $0402,$0403,$201A,$0453,$201E,$2026,$2020,$2021,
  $20AC,$2030,$0409,$2039,$040A,$040C,$040B,$040F,
  $0452,$2018,$2019,$201C,$201D,$2022,$2013,$2014,
  $0098,$2122,$0459,$203A,$045A,$045C,$045B,$045F,
  $00A0,$040E,$045E,$0408,$00A4,$0490,$00A6,$00A7,
  $0401,$00A9,$0404,$00AB,$00AC,$00AD,$00AE,$0407,
  $00B0,$00B1,$0406,$0456,$0491,$00B5,$00B6,$00B7,
  $0451,$2116,$0454,$00BB,$0458,$0405,$0455,$0457,
  $0410,$0411,$0412,$0413,$0414,$0415,$0416,$0417,
  $0418,$0419,$041A,$041B,$041C,$041D,$041E,$041F,
  $0420,$0421,$0422,$0423,$0424,$0425,$0426,$0427,
  $0428,$0429,$042A,$042B,$042C,$042D,$042E,$042F,
  $0430,$0431,$0432,$0433,$0434,$0435,$0436,$0437,
  $0438,$0439,$043A,$043B,$043C,$043D,$043E,$043F,
  $0440,$0441,$0442,$0443,$0444,$0445,$0446,$0447,
  $0448,$0449,$044A,$044B,$044C,$044D,$044E,$044F)
 );
 
 CP1251Lower:TLowerTable = (
  LowerID:1251;
  Values:(
  $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B,$0C,$0D,$0E,$0F,
  $10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$1A,$1B,$1C,$1D,$1E,$1F,
  $20,$21,$22,$23,$24,$25,$26,$27,$28,$29,$2A,$2B,$2C,$2D,$2E,$2F,
  $30,$31,$32,$33,$34,$35,$36,$37,$38,$39,$3A,$3B,$3C,$3D,$3E,$3F,
  $40,$61,$62,$63,$64,$65,$66,$67,$68,$69,$6A,$6B,$6C,$6D,$6E,$6F,
  $70,$71,$72,$73,$74,$75,$76,$77,$78,$79,$7A,$5B,$5C,$5D,$5E,$5F,
  $60,$61,$62,$63,$64,$65,$66,$67,$68,$69,$6A,$6B,$6C,$6D,$6E,$6F,
  $70,$71,$72,$73,$74,$75,$76,$77,$78,$79,$7A,$7B,$7C,$7D,$7E,$7F,
  $90,$83,$82,$83,$84,$85,$86,$87,$88,$89,$9A,$8B,$9C,$9D,$9E,$9F,
  $90,$91,$92,$93,$94,$95,$96,$97,$98,$99,$9A,$9B,$9C,$9D,$9E,$9F,
  $A0,$A2,$A2,$BC,$A4,$B4,$A6,$A7,$B8,$A9,$BA,$AB,$AC,$AD,$AE,$BF,
  $B0,$B1,$B3,$B3,$B4,$B5,$B6,$B7,$B8,$B9,$BA,$BB,$BC,$BE,$BE,$BF,
  $E0,$E1,$E2,$E3,$E4,$E5,$E6,$E7,$E8,$E9,$EA,$EB,$EC,$ED,$EE,$EF,
  $F0,$F1,$F2,$F3,$F4,$F5,$F6,$F7,$F8,$F9,$FA,$FB,$FC,$FD,$FE,$FF,
  $E0,$E1,$E2,$E3,$E4,$E5,$E6,$E7,$E8,$E9,$EA,$EB,$EC,$ED,$EE,$EF,
  $F0,$F1,$F2,$F3,$F4,$F5,$F6,$F7,$F8,$F9,$FA,$FB,$FC,$FD,$FE,$FF)
 );
 
 CP1251Upper:TUpperTable = (
  UpperID:1251;
  Values:(
  $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B,$0C,$0D,$0E,$0F,
  $10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$1A,$1B,$1C,$1D,$1E,$1F,
  $20,$21,$22,$23,$24,$25,$26,$27,$28,$29,$2A,$2B,$2C,$2D,$2E,$2F,
  $30,$31,$32,$33,$34,$35,$36,$37,$38,$39,$3A,$3B,$3C,$3D,$3E,$3F,
  $40,$41,$42,$43,$44,$45,$46,$47,$48,$49,$4A,$4B,$4C,$4D,$4E,$4F,
  $50,$51,$52,$53,$54,$55,$56,$57,$58,$59,$5A,$5B,$5C,$5D,$5E,$5F,
  $60,$41,$42,$43,$44,$45,$46,$47,$48,$49,$4A,$4B,$4C,$4D,$4E,$4F,
  $50,$51,$52,$53,$54,$55,$56,$57,$58,$59,$5A,$7B,$7C,$7D,$7E,$7F,
  $80,$81,$82,$81,$84,$85,$86,$87,$88,$89,$8A,$8B,$8C,$8D,$8E,$8F,
  $80,$91,$92,$93,$94,$95,$96,$97,$98,$99,$8A,$9B,$8C,$8D,$8E,$8F,
  $A0,$A1,$A1,$A3,$A4,$A5,$A6,$A7,$A8,$A9,$AA,$AB,$AC,$AD,$AE,$AF,
  $B0,$B1,$B2,$B2,$A5,$B5,$B6,$B7,$A8,$B9,$AA,$BB,$A3,$BD,$BD,$AF,
  $C0,$C1,$C2,$C3,$C4,$C5,$C6,$C7,$C8,$C9,$CA,$CB,$CC,$CD,$CE,$CF,
  $D0,$D1,$D2,$D3,$D4,$D5,$D6,$D7,$D8,$D9,$DA,$DB,$DC,$DD,$DE,$DF,
  $C0,$C1,$C2,$C3,$C4,$C5,$C6,$C7,$C8,$C9,$CA,$CB,$CC,$CD,$CE,$CF,
  $D0,$D1,$D2,$D3,$D4,$D5,$D6,$D7,$D8,$D9,$DA,$DB,$DC,$DD,$DE,$DF)
 );
 
 CP1251TO866:TTransTable = (
  TransID:866;
  Values:(
  $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B,$0C,$0D,$0E,$0F,
  $10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$1A,$1B,$1C,$1D,$1E,$1F,
  $20,$21,$22,$23,$24,$25,$26,$27,$28,$29,$2A,$2B,$2C,$2D,$2E,$2F,
  $30,$31,$32,$33,$34,$35,$36,$37,$38,$39,$3A,$3B,$3C,$3D,$3E,$3F,
  $40,$41,$42,$43,$44,$45,$46,$47,$48,$49,$4A,$4B,$4C,$4D,$4E,$4F,
  $50,$51,$52,$53,$54,$55,$56,$57,$58,$59,$5A,$5B,$5C,$5D,$5E,$5F,
  $60,$61,$62,$63,$64,$65,$66,$67,$68,$69,$6A,$6B,$6C,$6D,$6E,$6F,
  $70,$71,$72,$73,$74,$75,$76,$77,$78,$79,$7A,$7B,$7C,$7D,$7E,$7F,
  $5F,$5F,$27,$5F,$22,$3A,$C5,$D8,$5F,$25,$5F,$3C,$5F,$5F,$5F,$5F,
  $5F,$27,$27,$22,$22,$07,$2D,$2D,$5F,$54,$5F,$3E,$5F,$5F,$5F,$5F,
  $FF,$F6,$F7,$5F,$FD,$5F,$B3,$15,$F0,$63,$F2,$3C,$BF,$2D,$52,$F4,
  $F8,$2B,$5F,$5F,$5F,$E7,$14,$FA,$F1,$FC,$F3,$3E,$5F,$5F,$5F,$F5,
  $80,$81,$82,$83,$84,$85,$86,$87,$88,$89,$8A,$8B,$8C,$8D,$8E,$8F,
  $90,$91,$92,$93,$94,$95,$96,$97,$98,$99,$9A,$9B,$9C,$9D,$9E,$9F,
  $A0,$A1,$A2,$A3,$A4,$A5,$A6,$A7,$A8,$A9,$AA,$AB,$AC,$AD,$AE,$AF,
  $E0,$E1,$E2,$E3,$E4,$E5,$E6,$E7,$E8,$E9,$EA,$EB,$EC,$ED,$EE,$EF)
 );
 
{==============================================================================}
{==============================================================================}
{Initialization Functions}
procedure CP1251ANSIInit;
begin
 {}
 {Check Initialized}
 if CP1251ANSIInitialized then Exit;

 {Load Default Code Pages}
 LoadPage(CP_ANSI_1251,@CPANSI1251,@CP1251Lower,@CP1251Upper);
 InstallTrans(CP_ANSI_1251,@CP1251TO866);

 CP1251ANSIInitialized:=True;
end;

{==============================================================================}
{==============================================================================}
{CP1251ANSI Functions}

{==============================================================================}
{==============================================================================}
{CP1251ANSI Helper Functions}

{==============================================================================}
{==============================================================================}

initialization
 CP1251ANSIInit;
 
{==============================================================================}
 
finalization
 {Nothing}

{==============================================================================}
{==============================================================================}

end.
