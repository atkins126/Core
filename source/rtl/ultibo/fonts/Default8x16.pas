{
Ultibo Default8x16 font unit.

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

 This font was originally from the file default8x16.psfu

}

{$mode delphi} {Default to Delphi compatible syntax}
{$H+}          {Default to AnsiString}
{$inline on}   {Allow use of Inline procedures}

unit Default8x16;

interface

uses GlobalConfig,GlobalConst,GlobalTypes,Platform,Font;

{==============================================================================}
{const}
 {Default8x16 specific constants}

{==============================================================================}
{type}
 {Default8x16 specific types}

{==============================================================================}
{var}
 {Default8x16 specific variables}

{==============================================================================}
{Initialization Functions}

{==============================================================================}
{==============================================================================}

implementation

{==============================================================================}
{==============================================================================}
var
 {Default8x16 specific variables}
 Default8x16Initialized:Boolean;

 Default8x16FontHeader:TFontHeader = (
  Width:8;
  Height:16;
  Count:256;
  Mode:FONT_MODE_PIXEL;
  Flags:FONT_FLAG_NONE;
  Mask:0;
  CodePage:CP_ACP;
  Name:('Default8x16');
  Description:('Default (8x16) Console Font')
  );

 Default8x16FontData:array[0..255,0..15] of Byte = (
   ($00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00),
   ($00, $00, $7E, $81, $A5, $81, $81, $BD, $99, $81, $81, $7E, $00, $00, $00, $00),
   ($00, $00, $7E, $FF, $DB, $FF, $FF, $C3, $E7, $FF, $FF, $7E, $00, $00, $00, $00),
   ($00, $00, $00, $00, $6C, $FE, $FE, $FE, $FE, $7C, $38, $10, $00, $00, $00, $00),
   ($00, $00, $00, $00, $10, $38, $7C, $FE, $7C, $38, $10, $00, $00, $00, $00, $00),
   ($00, $00, $00, $18, $3C, $3C, $E7, $E7, $E7, $18, $18, $3C, $00, $00, $00, $00),
   ($00, $00, $00, $18, $3C, $7E, $FF, $FF, $7E, $18, $18, $3C, $00, $00, $00, $00),
   ($00, $00, $00, $00, $00, $00, $18, $3C, $3C, $18, $00, $00, $00, $00, $00, $00),
   ($FF, $FF, $FF, $FF, $FF, $FF, $E7, $C3, $C3, $E7, $FF, $FF, $FF, $FF, $FF, $FF),
   ($00, $00, $00, $00, $00, $3C, $66, $42, $42, $66, $3C, $00, $00, $00, $00, $00),
   ($FF, $FF, $FF, $FF, $FF, $C3, $99, $BD, $BD, $99, $C3, $FF, $FF, $FF, $FF, $FF),
   ($00, $00, $1E, $0E, $1A, $32, $78, $CC, $CC, $CC, $CC, $78, $00, $00, $00, $00),
   ($00, $00, $3C, $66, $66, $66, $66, $3C, $18, $7E, $18, $18, $00, $00, $00, $00),
   ($00, $00, $3F, $33, $3F, $30, $30, $30, $30, $70, $F0, $E0, $00, $00, $00, $00),
   ($00, $00, $7F, $63, $7F, $63, $63, $63, $63, $67, $E7, $E6, $C0, $00, $00, $00),
   ($00, $00, $00, $18, $18, $DB, $3C, $E7, $3C, $DB, $18, $18, $00, $00, $00, $00),
   ($00, $80, $C0, $E0, $F0, $F8, $FE, $F8, $F0, $E0, $C0, $80, $00, $00, $00, $00),
   ($00, $02, $06, $0E, $1E, $3E, $FE, $3E, $1E, $0E, $06, $02, $00, $00, $00, $00),
   ($00, $00, $18, $3C, $7E, $18, $18, $18, $7E, $3C, $18, $00, $00, $00, $00, $00),
   ($00, $00, $66, $66, $66, $66, $66, $66, $66, $00, $66, $66, $00, $00, $00, $00),
   ($00, $00, $7F, $DB, $DB, $DB, $7B, $1B, $1B, $1B, $1B, $1B, $00, $00, $00, $00),
   ($00, $7C, $C6, $60, $38, $6C, $C6, $C6, $6C, $38, $0C, $C6, $7C, $00, $00, $00),
   ($00, $00, $00, $00, $00, $00, $00, $00, $FE, $FE, $FE, $FE, $00, $00, $00, $00),
   ($00, $00, $18, $3C, $7E, $18, $18, $18, $7E, $3C, $18, $7E, $00, $00, $00, $00),
   ($00, $00, $18, $3C, $7E, $18, $18, $18, $18, $18, $18, $18, $00, $00, $00, $00),
   ($00, $00, $18, $18, $18, $18, $18, $18, $18, $7E, $3C, $18, $00, $00, $00, $00),
   ($00, $00, $00, $00, $00, $18, $0C, $FE, $0C, $18, $00, $00, $00, $00, $00, $00),
   ($00, $00, $00, $00, $00, $30, $60, $FE, $60, $30, $00, $00, $00, $00, $00, $00),
   ($00, $00, $00, $00, $00, $00, $C0, $C0, $C0, $FE, $00, $00, $00, $00, $00, $00),
   ($00, $00, $00, $00, $00, $24, $66, $FF, $66, $24, $00, $00, $00, $00, $00, $00),
   ($00, $00, $00, $00, $10, $38, $38, $7C, $7C, $FE, $FE, $00, $00, $00, $00, $00),
   ($00, $00, $00, $00, $FE, $FE, $7C, $7C, $38, $38, $10, $00, $00, $00, $00, $00),
   ($00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00),
   ($00, $00, $18, $3C, $3C, $3C, $18, $18, $18, $00, $18, $18, $00, $00, $00, $00),
   ($00, $66, $66, $66, $24, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00),
   ($00, $00, $00, $6C, $6C, $FE, $6C, $6C, $6C, $FE, $6C, $6C, $00, $00, $00, $00),
   ($18, $18, $7C, $C6, $C2, $C0, $7C, $06, $06, $86, $C6, $7C, $18, $18, $00, $00),
   ($00, $00, $00, $00, $C2, $C6, $0C, $18, $30, $60, $C6, $86, $00, $00, $00, $00),
   ($00, $00, $38, $6C, $6C, $38, $76, $DC, $CC, $CC, $CC, $76, $00, $00, $00, $00),
   ($00, $30, $30, $30, $60, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00),
   ($00, $00, $0C, $18, $30, $30, $30, $30, $30, $30, $18, $0C, $00, $00, $00, $00),
   ($00, $00, $30, $18, $0C, $0C, $0C, $0C, $0C, $0C, $18, $30, $00, $00, $00, $00),
   ($00, $00, $00, $00, $00, $66, $3C, $FF, $3C, $66, $00, $00, $00, $00, $00, $00),
   ($00, $00, $00, $00, $00, $18, $18, $7E, $18, $18, $00, $00, $00, $00, $00, $00),
   ($00, $00, $00, $00, $00, $00, $00, $00, $00, $18, $18, $18, $30, $00, $00, $00),
   ($00, $00, $00, $00, $00, $00, $00, $7E, $00, $00, $00, $00, $00, $00, $00, $00),
   ($00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $18, $18, $00, $00, $00, $00),
   ($00, $00, $00, $00, $02, $06, $0C, $18, $30, $60, $C0, $80, $00, $00, $00, $00),
   ($00, $00, $7C, $C6, $C6, $CE, $DE, $F6, $E6, $C6, $C6, $7C, $00, $00, $00, $00),
   ($00, $00, $18, $38, $78, $18, $18, $18, $18, $18, $18, $7E, $00, $00, $00, $00),
   ($00, $00, $7C, $C6, $06, $0C, $18, $30, $60, $C0, $C6, $FE, $00, $00, $00, $00),
   ($00, $00, $7C, $C6, $06, $06, $3C, $06, $06, $06, $C6, $7C, $00, $00, $00, $00),
   ($00, $00, $0C, $1C, $3C, $6C, $CC, $FE, $0C, $0C, $0C, $1E, $00, $00, $00, $00),
   ($00, $00, $FE, $C0, $C0, $C0, $FC, $06, $06, $06, $C6, $7C, $00, $00, $00, $00),
   ($00, $00, $38, $60, $C0, $C0, $FC, $C6, $C6, $C6, $C6, $7C, $00, $00, $00, $00),
   ($00, $00, $FE, $C6, $06, $06, $0C, $18, $30, $30, $30, $30, $00, $00, $00, $00),
   ($00, $00, $7C, $C6, $C6, $C6, $7C, $C6, $C6, $C6, $C6, $7C, $00, $00, $00, $00),
   ($00, $00, $7C, $C6, $C6, $C6, $7E, $06, $06, $06, $0C, $78, $00, $00, $00, $00),
   ($00, $00, $00, $00, $18, $18, $00, $00, $00, $18, $18, $00, $00, $00, $00, $00),
   ($00, $00, $00, $00, $18, $18, $00, $00, $00, $18, $18, $30, $00, $00, $00, $00),
   ($00, $00, $00, $06, $0C, $18, $30, $60, $30, $18, $0C, $06, $00, $00, $00, $00),
   ($00, $00, $00, $00, $00, $7E, $00, $00, $7E, $00, $00, $00, $00, $00, $00, $00),
   ($00, $00, $00, $60, $30, $18, $0C, $06, $0C, $18, $30, $60, $00, $00, $00, $00),
   ($00, $00, $7C, $C6, $C6, $0C, $18, $18, $18, $00, $18, $18, $00, $00, $00, $00),
   ($00, $00, $7C, $C6, $C6, $C6, $DE, $DE, $DE, $DC, $C0, $7C, $00, $00, $00, $00),
   ($00, $00, $10, $38, $6C, $C6, $C6, $FE, $C6, $C6, $C6, $C6, $00, $00, $00, $00),
   ($00, $00, $FC, $66, $66, $66, $7C, $66, $66, $66, $66, $FC, $00, $00, $00, $00),
   ($00, $00, $3C, $66, $C2, $C0, $C0, $C0, $C0, $C2, $66, $3C, $00, $00, $00, $00),
   ($00, $00, $F8, $6C, $66, $66, $66, $66, $66, $66, $6C, $F8, $00, $00, $00, $00),
   ($00, $00, $FE, $66, $62, $68, $78, $68, $60, $62, $66, $FE, $00, $00, $00, $00),
   ($00, $00, $FE, $66, $62, $68, $78, $68, $60, $60, $60, $F0, $00, $00, $00, $00),
   ($00, $00, $3C, $66, $C2, $C0, $C0, $DE, $C6, $C6, $66, $3A, $00, $00, $00, $00),
   ($00, $00, $C6, $C6, $C6, $C6, $FE, $C6, $C6, $C6, $C6, $C6, $00, $00, $00, $00),
   ($00, $00, $3C, $18, $18, $18, $18, $18, $18, $18, $18, $3C, $00, $00, $00, $00),
   ($00, $00, $1E, $0C, $0C, $0C, $0C, $0C, $CC, $CC, $CC, $78, $00, $00, $00, $00),
   ($00, $00, $E6, $66, $66, $6C, $78, $78, $6C, $66, $66, $E6, $00, $00, $00, $00),
   ($00, $00, $F0, $60, $60, $60, $60, $60, $60, $62, $66, $FE, $00, $00, $00, $00),
   ($00, $00, $C3, $E7, $FF, $FF, $DB, $C3, $C3, $C3, $C3, $C3, $00, $00, $00, $00),
   ($00, $00, $C6, $E6, $F6, $FE, $DE, $CE, $C6, $C6, $C6, $C6, $00, $00, $00, $00),
   ($00, $00, $7C, $C6, $C6, $C6, $C6, $C6, $C6, $C6, $C6, $7C, $00, $00, $00, $00),
   ($00, $00, $FC, $66, $66, $66, $7C, $60, $60, $60, $60, $F0, $00, $00, $00, $00),
   ($00, $00, $7C, $C6, $C6, $C6, $C6, $C6, $C6, $D6, $DE, $7C, $0C, $0E, $00, $00),
   ($00, $00, $FC, $66, $66, $66, $7C, $6C, $66, $66, $66, $E6, $00, $00, $00, $00),
   ($00, $00, $7C, $C6, $C6, $60, $38, $0C, $06, $C6, $C6, $7C, $00, $00, $00, $00),
   ($00, $00, $FF, $DB, $99, $18, $18, $18, $18, $18, $18, $3C, $00, $00, $00, $00),
   ($00, $00, $C6, $C6, $C6, $C6, $C6, $C6, $C6, $C6, $C6, $7C, $00, $00, $00, $00),
   ($00, $00, $C3, $C3, $C3, $C3, $C3, $C3, $C3, $66, $3C, $18, $00, $00, $00, $00),
   ($00, $00, $C3, $C3, $C3, $C3, $C3, $DB, $DB, $FF, $66, $66, $00, $00, $00, $00),
   ($00, $00, $C3, $C3, $66, $3C, $18, $18, $3C, $66, $C3, $C3, $00, $00, $00, $00),
   ($00, $00, $C3, $C3, $C3, $66, $3C, $18, $18, $18, $18, $3C, $00, $00, $00, $00),
   ($00, $00, $FF, $C3, $86, $0C, $18, $30, $60, $C1, $C3, $FF, $00, $00, $00, $00),
   ($00, $00, $3C, $30, $30, $30, $30, $30, $30, $30, $30, $3C, $00, $00, $00, $00),
   ($00, $00, $00, $80, $C0, $E0, $70, $38, $1C, $0E, $06, $02, $00, $00, $00, $00),
   ($00, $00, $3C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $3C, $00, $00, $00, $00),
   ($10, $38, $6C, $C6, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00),
   ($00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $FF, $00, $00),
   ($30, $30, $18, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00),
   ($00, $00, $00, $00, $00, $78, $0C, $7C, $CC, $CC, $CC, $76, $00, $00, $00, $00),
   ($00, $00, $E0, $60, $60, $78, $6C, $66, $66, $66, $66, $7C, $00, $00, $00, $00),
   ($00, $00, $00, $00, $00, $7C, $C6, $C0, $C0, $C0, $C6, $7C, $00, $00, $00, $00),
   ($00, $00, $1C, $0C, $0C, $3C, $6C, $CC, $CC, $CC, $CC, $76, $00, $00, $00, $00),
   ($00, $00, $00, $00, $00, $7C, $C6, $FE, $C0, $C0, $C6, $7C, $00, $00, $00, $00),
   ($00, $00, $38, $6C, $64, $60, $F0, $60, $60, $60, $60, $F0, $00, $00, $00, $00),
   ($00, $00, $00, $00, $00, $76, $CC, $CC, $CC, $CC, $CC, $7C, $0C, $CC, $78, $00),
   ($00, $00, $E0, $60, $60, $6C, $76, $66, $66, $66, $66, $E6, $00, $00, $00, $00),
   ($00, $00, $18, $18, $00, $38, $18, $18, $18, $18, $18, $3C, $00, $00, $00, $00),
   ($00, $00, $06, $06, $00, $0E, $06, $06, $06, $06, $06, $06, $66, $66, $3C, $00),
   ($00, $00, $E0, $60, $60, $66, $6C, $78, $78, $6C, $66, $E6, $00, $00, $00, $00),
   ($00, $00, $38, $18, $18, $18, $18, $18, $18, $18, $18, $3C, $00, $00, $00, $00),
   ($00, $00, $00, $00, $00, $E6, $FF, $DB, $DB, $DB, $DB, $DB, $00, $00, $00, $00),
   ($00, $00, $00, $00, $00, $DC, $66, $66, $66, $66, $66, $66, $00, $00, $00, $00),
   ($00, $00, $00, $00, $00, $7C, $C6, $C6, $C6, $C6, $C6, $7C, $00, $00, $00, $00),
   ($00, $00, $00, $00, $00, $DC, $66, $66, $66, $66, $66, $7C, $60, $60, $F0, $00),
   ($00, $00, $00, $00, $00, $76, $CC, $CC, $CC, $CC, $CC, $7C, $0C, $0C, $1E, $00),
   ($00, $00, $00, $00, $00, $DC, $76, $66, $60, $60, $60, $F0, $00, $00, $00, $00),
   ($00, $00, $00, $00, $00, $7C, $C6, $60, $38, $0C, $C6, $7C, $00, $00, $00, $00),
   ($00, $00, $10, $30, $30, $FC, $30, $30, $30, $30, $36, $1C, $00, $00, $00, $00),
   ($00, $00, $00, $00, $00, $CC, $CC, $CC, $CC, $CC, $CC, $76, $00, $00, $00, $00),
   ($00, $00, $00, $00, $00, $C3, $C3, $C3, $C3, $66, $3C, $18, $00, $00, $00, $00),
   ($00, $00, $00, $00, $00, $C3, $C3, $C3, $DB, $DB, $FF, $66, $00, $00, $00, $00),
   ($00, $00, $00, $00, $00, $C3, $66, $3C, $18, $3C, $66, $C3, $00, $00, $00, $00),
   ($00, $00, $00, $00, $00, $C6, $C6, $C6, $C6, $C6, $C6, $7E, $06, $0C, $F8, $00),
   ($00, $00, $00, $00, $00, $FE, $CC, $18, $30, $60, $C6, $FE, $00, $00, $00, $00),
   ($00, $00, $0E, $18, $18, $18, $70, $18, $18, $18, $18, $0E, $00, $00, $00, $00),
   ($00, $00, $18, $18, $18, $18, $00, $18, $18, $18, $18, $18, $00, $00, $00, $00),
   ($00, $00, $70, $18, $18, $18, $0E, $18, $18, $18, $18, $70, $00, $00, $00, $00),
   ($00, $00, $76, $DC, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00),
   ($00, $00, $00, $00, $10, $38, $6C, $C6, $C6, $C6, $FE, $00, $00, $00, $00, $00),
   ($00, $00, $3C, $66, $C2, $C0, $C0, $C0, $C2, $66, $3C, $0C, $06, $7C, $00, $00),
   ($00, $00, $CC, $00, $00, $CC, $CC, $CC, $CC, $CC, $CC, $76, $00, $00, $00, $00),
   ($00, $0C, $18, $30, $00, $7C, $C6, $FE, $C0, $C0, $C6, $7C, $00, $00, $00, $00),
   ($00, $10, $38, $6C, $00, $78, $0C, $7C, $CC, $CC, $CC, $76, $00, $00, $00, $00),
   ($00, $00, $CC, $00, $00, $78, $0C, $7C, $CC, $CC, $CC, $76, $00, $00, $00, $00),
   ($00, $60, $30, $18, $00, $78, $0C, $7C, $CC, $CC, $CC, $76, $00, $00, $00, $00),
   ($00, $38, $6C, $38, $00, $78, $0C, $7C, $CC, $CC, $CC, $76, $00, $00, $00, $00),
   ($00, $00, $00, $00, $3C, $66, $60, $60, $66, $3C, $0C, $06, $3C, $00, $00, $00),
   ($00, $10, $38, $6C, $00, $7C, $C6, $FE, $C0, $C0, $C6, $7C, $00, $00, $00, $00),
   ($00, $00, $C6, $00, $00, $7C, $C6, $FE, $C0, $C0, $C6, $7C, $00, $00, $00, $00),
   ($00, $60, $30, $18, $00, $7C, $C6, $FE, $C0, $C0, $C6, $7C, $00, $00, $00, $00),
   ($00, $00, $66, $00, $00, $38, $18, $18, $18, $18, $18, $3C, $00, $00, $00, $00),
   ($00, $18, $3C, $66, $00, $38, $18, $18, $18, $18, $18, $3C, $00, $00, $00, $00),
   ($00, $60, $30, $18, $00, $38, $18, $18, $18, $18, $18, $3C, $00, $00, $00, $00),
   ($00, $C6, $00, $10, $38, $6C, $C6, $C6, $FE, $C6, $C6, $C6, $00, $00, $00, $00),
   ($38, $6C, $38, $00, $38, $6C, $C6, $C6, $FE, $C6, $C6, $C6, $00, $00, $00, $00),
   ($18, $30, $60, $00, $FE, $66, $60, $7C, $60, $60, $66, $FE, $00, $00, $00, $00),
   ($00, $00, $00, $00, $00, $6E, $3B, $1B, $7E, $D8, $DC, $77, $00, $00, $00, $00),
   ($00, $00, $3E, $6C, $CC, $CC, $FE, $CC, $CC, $CC, $CC, $CE, $00, $00, $00, $00),
   ($00, $10, $38, $6C, $00, $7C, $C6, $C6, $C6, $C6, $C6, $7C, $00, $00, $00, $00),
   ($00, $00, $C6, $00, $00, $7C, $C6, $C6, $C6, $C6, $C6, $7C, $00, $00, $00, $00),
   ($00, $60, $30, $18, $00, $7C, $C6, $C6, $C6, $C6, $C6, $7C, $00, $00, $00, $00),
   ($00, $30, $78, $CC, $00, $CC, $CC, $CC, $CC, $CC, $CC, $76, $00, $00, $00, $00),
   ($00, $60, $30, $18, $00, $CC, $CC, $CC, $CC, $CC, $CC, $76, $00, $00, $00, $00),
   ($00, $00, $C6, $00, $00, $C6, $C6, $C6, $C6, $C6, $C6, $7E, $06, $0C, $78, $00),
   ($00, $C6, $00, $7C, $C6, $C6, $C6, $C6, $C6, $C6, $C6, $7C, $00, $00, $00, $00),
   ($00, $C6, $00, $C6, $C6, $C6, $C6, $C6, $C6, $C6, $C6, $7C, $00, $00, $00, $00),
   ($00, $18, $18, $7E, $C3, $C0, $C0, $C0, $C3, $7E, $18, $18, $00, $00, $00, $00),
   ($00, $38, $6C, $64, $60, $F0, $60, $60, $60, $60, $E6, $FC, $00, $00, $00, $00),
   ($00, $00, $C3, $66, $3C, $18, $FF, $18, $FF, $18, $18, $18, $00, $00, $00, $00),
   ($00, $FC, $66, $66, $7C, $62, $66, $6F, $66, $66, $66, $F3, $00, $00, $00, $00),
   ($00, $0E, $1B, $18, $18, $18, $7E, $18, $18, $18, $18, $18, $D8, $70, $00, $00),
   ($00, $18, $30, $60, $00, $78, $0C, $7C, $CC, $CC, $CC, $76, $00, $00, $00, $00),
   ($00, $0C, $18, $30, $00, $38, $18, $18, $18, $18, $18, $3C, $00, $00, $00, $00),
   ($00, $18, $30, $60, $00, $7C, $C6, $C6, $C6, $C6, $C6, $7C, $00, $00, $00, $00),
   ($00, $18, $30, $60, $00, $CC, $CC, $CC, $CC, $CC, $CC, $76, $00, $00, $00, $00),
   ($00, $00, $76, $DC, $00, $DC, $66, $66, $66, $66, $66, $66, $00, $00, $00, $00),
   ($76, $DC, $00, $C6, $E6, $F6, $FE, $DE, $CE, $C6, $C6, $C6, $00, $00, $00, $00),
   ($00, $3C, $6C, $6C, $3E, $00, $7E, $00, $00, $00, $00, $00, $00, $00, $00, $00),
   ($00, $38, $6C, $6C, $38, $00, $7C, $00, $00, $00, $00, $00, $00, $00, $00, $00),
   ($00, $00, $30, $30, $00, $30, $30, $60, $C0, $C6, $C6, $7C, $00, $00, $00, $00),
   ($00, $00, $00, $00, $00, $00, $FE, $C0, $C0, $C0, $C0, $00, $00, $00, $00, $00),
   ($00, $00, $00, $00, $00, $00, $FE, $06, $06, $06, $06, $00, $00, $00, $00, $00),
   ($00, $C0, $C0, $C2, $C6, $CC, $18, $30, $60, $CE, $9B, $06, $0C, $1F, $00, $00),
   ($00, $C0, $C0, $C2, $C6, $CC, $18, $30, $66, $CE, $96, $3E, $06, $06, $00, $00),
   ($00, $00, $18, $18, $00, $18, $18, $18, $3C, $3C, $3C, $18, $00, $00, $00, $00),
   ($00, $00, $00, $00, $00, $36, $6C, $D8, $6C, $36, $00, $00, $00, $00, $00, $00),
   ($00, $00, $00, $00, $00, $D8, $6C, $36, $6C, $D8, $00, $00, $00, $00, $00, $00),
   ($11, $44, $11, $44, $11, $44, $11, $44, $11, $44, $11, $44, $11, $44, $11, $44),
   ($55, $AA, $55, $AA, $55, $AA, $55, $AA, $55, $AA, $55, $AA, $55, $AA, $55, $AA),
   ($DD, $77, $DD, $77, $DD, $77, $DD, $77, $DD, $77, $DD, $77, $DD, $77, $DD, $77),
   ($18, $18, $18, $18, $18, $18, $18, $18, $18, $18, $18, $18, $18, $18, $18, $18),
   ($18, $18, $18, $18, $18, $18, $18, $F8, $18, $18, $18, $18, $18, $18, $18, $18),
   ($18, $18, $18, $18, $18, $F8, $18, $F8, $18, $18, $18, $18, $18, $18, $18, $18),
   ($36, $36, $36, $36, $36, $36, $36, $F6, $36, $36, $36, $36, $36, $36, $36, $36),
   ($00, $00, $00, $00, $00, $00, $00, $FE, $36, $36, $36, $36, $36, $36, $36, $36),
   ($00, $00, $00, $00, $00, $F8, $18, $F8, $18, $18, $18, $18, $18, $18, $18, $18),
   ($36, $36, $36, $36, $36, $F6, $06, $F6, $36, $36, $36, $36, $36, $36, $36, $36),
   ($36, $36, $36, $36, $36, $36, $36, $36, $36, $36, $36, $36, $36, $36, $36, $36),
   ($00, $00, $00, $00, $00, $FE, $06, $F6, $36, $36, $36, $36, $36, $36, $36, $36),
   ($36, $36, $36, $36, $36, $F6, $06, $FE, $00, $00, $00, $00, $00, $00, $00, $00),
   ($36, $36, $36, $36, $36, $36, $36, $FE, $00, $00, $00, $00, $00, $00, $00, $00),
   ($18, $18, $18, $18, $18, $F8, $18, $F8, $00, $00, $00, $00, $00, $00, $00, $00),
   ($00, $00, $00, $00, $00, $00, $00, $F8, $18, $18, $18, $18, $18, $18, $18, $18),
   ($18, $18, $18, $18, $18, $18, $18, $1F, $00, $00, $00, $00, $00, $00, $00, $00),
   ($18, $18, $18, $18, $18, $18, $18, $FF, $00, $00, $00, $00, $00, $00, $00, $00),
   ($00, $00, $00, $00, $00, $00, $00, $FF, $18, $18, $18, $18, $18, $18, $18, $18),
   ($18, $18, $18, $18, $18, $18, $18, $1F, $18, $18, $18, $18, $18, $18, $18, $18),
   ($00, $00, $00, $00, $00, $00, $00, $FF, $00, $00, $00, $00, $00, $00, $00, $00),
   ($18, $18, $18, $18, $18, $18, $18, $FF, $18, $18, $18, $18, $18, $18, $18, $18),
   ($18, $18, $18, $18, $18, $1F, $18, $1F, $18, $18, $18, $18, $18, $18, $18, $18),
   ($36, $36, $36, $36, $36, $36, $36, $37, $36, $36, $36, $36, $36, $36, $36, $36),
   ($36, $36, $36, $36, $36, $37, $30, $3F, $00, $00, $00, $00, $00, $00, $00, $00),
   ($00, $00, $00, $00, $00, $3F, $30, $37, $36, $36, $36, $36, $36, $36, $36, $36),
   ($36, $36, $36, $36, $36, $F7, $00, $FF, $00, $00, $00, $00, $00, $00, $00, $00),
   ($00, $00, $00, $00, $00, $FF, $00, $F7, $36, $36, $36, $36, $36, $36, $36, $36),
   ($36, $36, $36, $36, $36, $37, $30, $37, $36, $36, $36, $36, $36, $36, $36, $36),
   ($00, $00, $00, $00, $00, $FF, $00, $FF, $00, $00, $00, $00, $00, $00, $00, $00),
   ($36, $36, $36, $36, $36, $F7, $00, $F7, $36, $36, $36, $36, $36, $36, $36, $36),
   ($18, $18, $18, $18, $18, $FF, $00, $FF, $00, $00, $00, $00, $00, $00, $00, $00),
   ($36, $36, $36, $36, $36, $36, $36, $FF, $00, $00, $00, $00, $00, $00, $00, $00),
   ($00, $00, $00, $00, $00, $FF, $00, $FF, $18, $18, $18, $18, $18, $18, $18, $18),
   ($00, $00, $00, $00, $00, $00, $00, $FF, $36, $36, $36, $36, $36, $36, $36, $36),
   ($36, $36, $36, $36, $36, $36, $36, $3F, $00, $00, $00, $00, $00, $00, $00, $00),
   ($18, $18, $18, $18, $18, $1F, $18, $1F, $00, $00, $00, $00, $00, $00, $00, $00),
   ($00, $00, $00, $00, $00, $1F, $18, $1F, $18, $18, $18, $18, $18, $18, $18, $18),
   ($00, $00, $00, $00, $00, $00, $00, $3F, $36, $36, $36, $36, $36, $36, $36, $36),
   ($36, $36, $36, $36, $36, $36, $36, $FF, $36, $36, $36, $36, $36, $36, $36, $36),
   ($18, $18, $18, $18, $18, $FF, $18, $FF, $18, $18, $18, $18, $18, $18, $18, $18),
   ($18, $18, $18, $18, $18, $18, $18, $F8, $00, $00, $00, $00, $00, $00, $00, $00),
   ($00, $00, $00, $00, $00, $00, $00, $1F, $18, $18, $18, $18, $18, $18, $18, $18),
   ($FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF),
   ($00, $00, $00, $00, $00, $00, $00, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF),
   ($F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0),
   ($0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F, $0F),
   ($FF, $FF, $FF, $FF, $FF, $FF, $FF, $00, $00, $00, $00, $00, $00, $00, $00, $00),
   ($00, $00, $00, $00, $00, $76, $DC, $D8, $D8, $D8, $DC, $76, $00, $00, $00, $00),
   ($00, $00, $78, $CC, $CC, $CC, $D8, $CC, $C6, $C6, $C6, $CC, $00, $00, $00, $00),
   ($00, $00, $FE, $C6, $C6, $C0, $C0, $C0, $C0, $C0, $C0, $C0, $00, $00, $00, $00),
   ($00, $00, $00, $00, $FE, $6C, $6C, $6C, $6C, $6C, $6C, $6C, $00, $00, $00, $00),
   ($00, $00, $00, $FE, $C6, $60, $30, $18, $30, $60, $C6, $FE, $00, $00, $00, $00),
   ($00, $00, $00, $00, $00, $7E, $D8, $D8, $D8, $D8, $D8, $70, $00, $00, $00, $00),
   ($00, $00, $00, $00, $66, $66, $66, $66, $66, $7C, $60, $60, $C0, $00, $00, $00),
   ($00, $00, $00, $00, $76, $DC, $18, $18, $18, $18, $18, $18, $00, $00, $00, $00),
   ($00, $00, $00, $7E, $18, $3C, $66, $66, $66, $3C, $18, $7E, $00, $00, $00, $00),
   ($00, $00, $00, $38, $6C, $C6, $C6, $FE, $C6, $C6, $6C, $38, $00, $00, $00, $00),
   ($00, $00, $38, $6C, $C6, $C6, $C6, $6C, $6C, $6C, $6C, $EE, $00, $00, $00, $00),
   ($00, $00, $1E, $30, $18, $0C, $3E, $66, $66, $66, $66, $3C, $00, $00, $00, $00),
   ($00, $00, $00, $00, $00, $7E, $DB, $DB, $DB, $7E, $00, $00, $00, $00, $00, $00),
   ($00, $00, $00, $03, $06, $7E, $DB, $DB, $F3, $7E, $60, $C0, $00, $00, $00, $00),
   ($00, $00, $1C, $30, $60, $60, $7C, $60, $60, $60, $30, $1C, $00, $00, $00, $00),
   ($00, $00, $00, $7C, $C6, $C6, $C6, $C6, $C6, $C6, $C6, $C6, $00, $00, $00, $00),
   ($00, $00, $00, $00, $FE, $00, $00, $FE, $00, $00, $FE, $00, $00, $00, $00, $00),
   ($00, $00, $00, $00, $18, $18, $7E, $18, $18, $00, $00, $FF, $00, $00, $00, $00),
   ($00, $00, $00, $30, $18, $0C, $06, $0C, $18, $30, $00, $7E, $00, $00, $00, $00),
   ($00, $00, $00, $0C, $18, $30, $60, $30, $18, $0C, $00, $7E, $00, $00, $00, $00),
   ($00, $00, $0E, $1B, $1B, $1B, $18, $18, $18, $18, $18, $18, $18, $18, $18, $18),
   ($18, $18, $18, $18, $18, $18, $18, $18, $D8, $D8, $D8, $70, $00, $00, $00, $00),
   ($00, $00, $00, $00, $18, $18, $00, $7E, $00, $18, $18, $00, $00, $00, $00, $00),
   ($00, $00, $00, $00, $00, $76, $DC, $00, $76, $DC, $00, $00, $00, $00, $00, $00),
   ($00, $38, $6C, $6C, $38, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00),
   ($00, $00, $00, $00, $00, $00, $00, $18, $18, $00, $00, $00, $00, $00, $00, $00),
   ($00, $00, $00, $00, $00, $00, $00, $00, $18, $00, $00, $00, $00, $00, $00, $00),
   ($00, $0F, $0C, $0C, $0C, $0C, $0C, $EC, $6C, $6C, $3C, $1C, $00, $00, $00, $00),
   ($00, $D8, $6C, $6C, $6C, $6C, $6C, $00, $00, $00, $00, $00, $00, $00, $00, $00),
   ($00, $70, $D8, $30, $60, $C8, $F8, $00, $00, $00, $00, $00, $00, $00, $00, $00),
   ($00, $00, $00, $00, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $00, $00, $00, $00, $00),
   ($00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00)
  );

{==============================================================================}
{==============================================================================}
{Initialization Functions}
procedure Default8x16Init;
begin
 {}
 {Check Initialized}
 if Default8x16Initialized then Exit;

 {Load Default8x16}
 if FontLoad(@Default8x16FontHeader,@Default8x16FontData,SizeOf(Default8x16FontData)) = INVALID_HANDLE_VALUE then
  begin
   if PLATFORM_LOG_ENABLED then PlatformLogError('Failed to load Default8x16 font');
  end;

 Default8x16Initialized:=True;
end;

{==============================================================================}
{==============================================================================}

initialization
 Default8x16Init;

{==============================================================================}

finalization
 {Nothing}

{==============================================================================}
{==============================================================================}

end.