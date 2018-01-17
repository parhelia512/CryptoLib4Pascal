{ *********************************************************************************** }
{ *                              CryptoLib Library                                  * }
{ *                    Copyright (c) 2018 Ugochukwu Mmaduekwe                       * }
{ *                 Github Repository <https://github.com/Xor-el>                   * }

{ *  Distributed under the MIT software license, see the accompanying file LICENSE  * }
{ *          or visit http://www.opensource.org/licenses/mit-license.php.           * }

{ *                              Acknowledgements:                                  * }
{ *                                                                                 * }
{ *        Thanks to Sphere 10 Software (http://sphere10.com) for sponsoring        * }
{ *                        the development of this library                          * }

{ * ******************************************************************************* * }

(* &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& *)

unit ClpHex;

{$I ..\..\Include\CryptoLib.inc}

interface

uses
  Classes,
  ClpConverters,
  ClpCryptoLibTypes;

type
  THex = class sealed(TObject)

  public
    class function Decode(const Hex: String): TCryptoLibByteArray; static;
    class function Encode(Input: TCryptoLibByteArray): String; static;
  end;

implementation

{ THex }

class function THex.Decode(const Hex: String): TCryptoLibByteArray;
begin
  System.SetLength(result, System.length(Hex) shr 1);
  HexToBin(PChar(Hex), @result[0], System.length(result));
end;

class function THex.Encode(Input: TCryptoLibByteArray): String;
begin
  result := TConverters.ConvertBytesToHexString(Input, False);
end;

end.