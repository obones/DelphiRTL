﻿namespace RemObjects.Elements.RTL.Delphi;

interface

{$GLOBALS ON}

uses
  RemObjects.Elements.RTL;

const
  fmCreate = $FF00;

type
  TSeekOrigin = public enum (soBeginning, soCurrent, soEnd) of Integer;

  TStream = public class(TObject)
  private
    method GetPosition: Int64;
    method SetPosition(const Pos: Int64);
    method &Skip(Amount: Integer): Integer;
  protected
    method GetSize: Int64; virtual;
    method SetSize(NewSize: LongInt); virtual;
    method SetSize(const NewSize: Int64); virtual;
  public
    method &Read(Buffer: TBytes; Offset, Count: LongInt): LongInt; virtual;
    method &Write(const Buffer: TBytes; Offset, Count: LongInt): LongInt; virtual;

    {$IF ISLAND OR TOFFEE}
    method &Read(Buffer: Pointer; Count: LongInt): LongInt; virtual;
    method &Write(Buffer: Pointer; Count: LongInt): LongInt; virtual;
    {$ENDIF}
   
    method &Read(var Buffer: TBytes; Count: LongInt): LongInt; inline;
    method &Write(const Buffer: TBytes; Count: LongInt): LongInt; inline;

    method ReadBytes(Count: LongInt): TBytes;
    method ReadData(const Buffer: TBytes; Count: LongInt): LongInt; inline;
    method ReadData(var Buffer: Int32): LongInt;
    method ReadData(var Buffer: Int32; Count: LongInt): LongInt;
    {$IF NOT COOPER}
    method ReadData(var Buffer: Boolean): LongInt;
    method ReadData(var Buffer: Boolean; Count: LongInt): LongInt;
    method ReadData(var Buffer: Byte): LongInt;
    method ReadData(var Buffer: Byte; Count: LongInt): LongInt;
    method ReadData(var Buffer: Char): LongInt;
    method ReadData(var Buffer: Char; Count: LongInt): LongInt;
    method ReadData(var Buffer: ShortInt): LongInt;
    method ReadData(var Buffer: ShortInt; Count: LongInt): LongInt;
    method ReadData(var Buffer: Int16): LongInt;
    method ReadData(var Buffer: Int16; Count: LongInt): LongInt;
    method ReadData(var Buffer: UInt16): LongInt;
    method ReadData(var Buffer: UInt16; Count: LongInt): LongInt;
    method ReadData(var Buffer: UInt32): LongInt;
    method ReadData(var Buffer: UInt32; Count: LongInt): LongInt;
    method ReadData(var Buffer: UInt64): LongInt;
    method ReadData(var Buffer: UInt64; Count: LongInt): LongInt;
    method ReadData(var Buffer: Int64): LongInt;
    method ReadData(var Buffer: Int64; Count: LongInt): LongInt;
    method ReadData(var Buffer: Single): LongInt;
    method ReadData(var Buffer: Single; Count: LongInt): LongInt;   
    method ReadData(var Buffer: Double): LongInt;
    method ReadData(var Buffer: Double; Count: LongInt): LongInt;
    {$ENDIF}

    method WriteData(const Buffer: TBytes; Count: LongInt): LongInt;
    method WriteData(const Buffer: Int32): LongInt;
    method WriteData(const Buffer: Int32; Count: LongInt): LongInt;

    {$IF NOT COOPER}
    method WriteData(Buffer: Boolean): LongInt;
    method WriteData(Buffer: Boolean; Count: LongInt): LongInt;
    method WriteData(Buffer: Char): LongInt;
    method WriteData(Buffer: Char; Count: LongInt): LongInt;
    method WriteData(Buffer: ShortInt): LongInt;
    method WriteData(Buffer: ShortInt; Count: LongInt): LongInt;
    method WriteData(Buffer: Int16): LongInt;
    method WriteData(Buffer: Int16; Count: LongInt): LongInt;
    method WriteData(Buffer: Int64): LongInt;
    method WriteData(Buffer: Int64; Count: LongInt): LongInt;
    method WriteData(Buffer: Single): LongInt;
    method WriteData(Buffer: Single; Count: LongInt): LongInt;
    method WriteData(Buffer: Double): LongInt;
    method WriteData(Buffer: Double; Count: LongInt): LongInt;
    method WriteData(Buffer: Byte): LongInt;
    method WriteData(Buffer: Byte; Count: LongInt): LongInt;
    method WriteData(Buffer: UInt16): LongInt;
    method WriteData(Buffer: UInt16; Count: LongInt): LongInt;
    method WriteData(Buffer: UInt32): LongInt;
    method WriteData(Buffer: UInt32; Count: LongInt): LongInt;
    method WriteData(Buffer: UInt64): LongInt;
    method WriteData(Buffer: UInt64; Count: LongInt): LongInt;
    {$ENDIF}

    method Seek(Offset: LongInt; Origin: Word): LongInt; virtual;
    method Seek(const Offset: Int64; Origin: TSeekOrigin): Int64; virtual;
    method Seek(const Offset: Int64; Origin: Word): Int64; inline;

    method ReadBuffer(var Buffer: TBytes; Count: LongInt);
    method ReadBuffer(var Buffer: TBytes; Offset, Count: LongInt);

    method ReadBufferData(var Buffer: Int32);
    method ReadBufferData(var Buffer: Int32; Count: LongInt);
    {$IF NOT COOPER}
    method ReadBufferData(var Buffer: Boolean);
    method ReadBufferData(var Buffer: Boolean; Count: LongInt);
    method ReadBufferData(var Buffer: Char);
    method ReadBufferData(var Buffer: Char; Count: LongInt);
    method ReadBufferData(var Buffer: ShortInt);
    method ReadBufferData(var Buffer: ShortInt; Count: LongInt);
    method ReadBufferData(var Buffer: Byte);
    method ReadBufferData(var Buffer: Byte; Count: LongInt);
    method ReadBufferData(var Buffer: Int16);
    method ReadBufferData(var Buffer: Int16; Count: LongInt);
    method ReadBufferData(var Buffer: UInt16);
    method ReadBufferData(var Buffer: UInt16; Count: LongInt);
    method ReadBufferData(var Buffer: UInt32);
    method ReadBufferData(var Buffer: UInt32; Count: LongInt);
    method ReadBufferData(var Buffer: Int64);
    method ReadBufferData(var Buffer: Int64; Count: LongInt);
    method ReadBufferData(var Buffer: UInt64);
    method ReadBufferData(var Buffer: UInt64; Count: LongInt);
    method ReadBufferData(var Buffer: Single);
    method ReadBufferData(var Buffer: Single; Count: LongInt);
    method ReadBufferData(var Buffer: Double);
    method ReadBufferData(var Buffer: Double; Count: LongInt);
    {$ENDIF}

    method WriteBuffer(const Buffer: TBytes; Count: LongInt);
    method WriteBuffer(const Buffer: TBytes; Offset, Count: LongInt);

    method WriteBufferData(var Buffer: Integer; Count: LongInt);

    method CopyFrom(const Source: TStream; Count: Int64): Int64;
    property Position: Int64 read GetPosition write SetPosition;
    property Size: Int64 read GetSize write SetSize;
  end;

  THandleStream = class(TStream)
  protected
    fHandle: THandle;
    method SetSize(NewSize: LongInt); override;
  public
    constructor(aHandle: THandle);
    method &Read(Buffer: TBytes; Offset, Count: LongInt): LongInt; override;
    method &Write(const Buffer: TBytes; Offset, Count: LongInt): LongInt; override;
    //method &Read(var Buffer; Count: LongInt): LongInt; override;
    //method &Write(Buffer: Object; Count: LongInt): LongInt; override;

    method SetSize(const NewSize: Int64); override;

    method Seek(const Offset: Int64; Origin: TSeekOrigin): Int64; override;
    property Handle: THandle read FHandle;
  end;

  TFileStream = class(THandleStream)
  private
    fFileName: DelphiString;
  public
    constructor(const aFileName: DelphiString; Mode: Word);
    constructor(const aFileName: DelphiString; Mode: Word; Rights: Cardinal);
    property FileName: DelphiString read FFileName;
  end;

  TCustomMemoryStream = class(TStream)
  protected
    fData: MemoryStream;
  public
    constructor;
    method &Read(Buffer: TBytes; Offset, Count: LongInt): LongInt; override;
    {$IF ISLAND OR TOFFEE}
    method &Read(Buffer: Pointer; Count: LongInt): LongInt; override;
    {$ENDIF}
    method Seek(const Offset: Int64; Origin: TSeekOrigin): Int64; override;
    method SaveToStream(aStream: TStream); virtual;
    method SaveToFile(const aFileName: DelphiString);
    property Memory: TBytes read fData.Bytes;
  end;

  TMemoryStream = class(TCustomMemoryStream)
  protected
    property Capacity: LongInt read fData.Length write fData.SetLength;
  public
    method Clear;
    method LoadFromStream(aStream: TStream);
    method LoadFromFile(const aFileName: DelphiString);
    method SetSize(const NewSize: Int64); override;
    method SetSize(NewSize: LongInt); override;
    method &Write(const Buffer: TBytes; Offset, Count: LongInt): LongInt; override;
    {$IF ISLAND OR TOFFEE}
    method &Write(Buffer: Pointer; Count: LongInt): LongInt; override;
    {$ENDIF}
  end;

  TBytesStream = class(TMemoryStream)
  protected
    //method Realloc(var NewCapacity: LongInt): Pointer; override;
  public
    constructor(const aBytes: TBytes);
    property Bytes: TBytes read fData.Bytes;
  end;

implementation

method TStream.GetPosition: Int64;
begin
  result := Seek(0, TSeekOrigin.soCurrent);
end;

method TStream.SetPosition(const Pos: Int64);
begin
  Seek(Pos, TSeekOrigin.soBeginning);
end;

method TStream.GetSize: Int64;
begin
  var lPos := Seek(0, TSeekOrigin.soCurrent);
  result := Seek(0, TSeekOrigin.soEnd);
  Seek(lPos, TSeekOrigin.soBeginning);
end;

method TStream.SetSize(NewSize: LongInt);
begin
  // NO OP
end;

method TStream.SetSize(const NewSize: Int64);
begin
  SetSize(LongInt(NewSize));
end;

method TStream.Skip(Amount: Integer): Integer;
begin
  var lPos := Position;
  result := Seek(Amount, TSeekOrigin.soCurrent) - lPos;
end;

method TStream.Read(Buffer: TBytes; Offset: LongInt; Count: LongInt): LongInt;
begin
  result := 0;
end;

method TStream.Write(const Buffer: TBytes; Offset: LongInt; Count: LongInt): LongInt;
begin
  result := 0;
end;

{$IF ISLAND OR TOFFEE}
method TStream.Read(Buffer: Pointer; Count: LongInt): LongInt;
begin
  result := 0;
end;

method TStream.Write(Buffer: Pointer; Count: LongInt): LongInt;
begin
  result := 0;
end;
{$ENDIF}

method TStream.Read(var Buffer: TBytes; Count: LongInt): LongInt;
begin
  result := &Read(Buffer, 0, Count);
end;

method TStream.Write(const Buffer: TBytes; Count: LongInt): LongInt;
begin
  result := &Write(Buffer, 0, Count);
end;

method TStream.ReadData(const Buffer: TBytes; Count: LongInt): LongInt;
begin
  result := &Read(Buffer, 0, Count);
end;

method TStream.ReadData(var Buffer: Int32): LongInt;
begin
  {$IF COOPER}
  var lTemp := java.nio.ByteBuffer.wrap(ReadBytes(sizeOf(Buffer)));
  result := lTemp.getInt;
  {$ELSEIF ECHOES}
  BitConverter.ToBoolean(ReadBytes(sizeOf(Buffer)), 0);
  {$ELSEIF ISLAND OR TOFFEE}
  result := &Read(@Buffer, sizeOf(Buffer));
  {$ENDIF}
end;

method TStream.ReadData(var Buffer: Int32; Count: LongInt): LongInt;
begin

end;

method TStream.ReadBytes(Count: LongInt): TBytes;
begin
  result := new Byte[Count];
  &Read(var result, Count);
end;

{$IF NOT COOPER}
method TStream.ReadData(var Buffer: Boolean): LongInt;
begin
  {$IF ECHOES}
  Buffer := BitConverter.ToBoolean(ReadBytes(sizeOf(Buffer)), 0);
  {$ELSEIF ISLAND OR TOFFEE}
  result := &Read(@Buffer, sizeOf(Buffer));
  {$ENDIF}
end;

method TStream.ReadData(var Buffer: Boolean; Count: LongInt): LongInt;
begin

end;

method TStream.ReadData(var Buffer: Byte): LongInt;
begin
  {$IF ECHOES}
  var lValue := ReadBytes(1);
  Buffer := lValue[0];
  result := sizeOf(Buffer);
  {$ELSEIF ISLAND OR TOFFEE}
  result := &Read(@Buffer, sizeOf(Buffer));
  {$ENDIF}
end;

method TStream.ReadData(var Buffer: Byte; Count: LongInt): LongInt;
begin

end;

method TStream.ReadData(var Buffer: Char): LongInt;
begin
  {$IF ECHOES}
  result := sizeOf(Buffer);
  Buffer := BitConverter.ToChar(ReadBytes(result), 0);  
  {$ELSEIF ISLAND OR TOFFEE}
  result := &Read(@Buffer, sizeOf(Buffer));
  {$ENDIF}
end;

method TStream.ReadData(var Buffer: Char; Count: LongInt): LongInt;
begin

end;

method TStream.ReadData(var Buffer: ShortInt): LongInt;
begin
  {$IF ECHOES}
  result := sizeOf(Buffer);
  var lValue := ReadBytes(result);
  Buffer := lValue[0];
  {$ELSEIF ISLAND OR TOFFEE}
  result := &Read(@Buffer, sizeOf(Buffer));
  {$ENDIF}
end;

method TStream.ReadData(var Buffer: ShortInt; Count: LongInt): LongInt;
begin

end;

method TStream.ReadData(var Buffer: Int16): LongInt;
begin
  {$IF ECHOES}
  result := sizeOf(Buffer);
  Buffer := BitConverter.ToInt16(ReadBytes(result), 0);  
  {$ELSEIF ISLAND OR TOFFEE}
  result := &Read(@Buffer, sizeOf(Buffer));
  {$ENDIF}
end;

method TStream.ReadData(var Buffer: Int16; Count: LongInt): LongInt;
begin

end;

method TStream.ReadData(var Buffer: UInt16): LongInt;
begin
  {$IF ECHOES}
  result := sizeOf(Buffer);
  Buffer := BitConverter.ToUInt16(ReadBytes(result), 0);  
  {$ELSEIF ISLAND OR TOFFEE}
  result := &Read(@Buffer, sizeOf(Buffer));
  {$ENDIF}
end;

method TStream.ReadData(var Buffer: UInt16; Count: LongInt): LongInt;
begin

end;

method TStream.ReadData(var Buffer: UInt32): LongInt;
begin
  {$IF ECHOES}
  result := sizeOf(Buffer);
  Buffer := BitConverter.ToUInt32(ReadBytes(result), 0);  
  {$ELSEIF ISLAND OR TOFFEE}
  result := &Read(@Buffer, sizeOf(Buffer));
  {$ENDIF}
end;

method TStream.ReadData(var Buffer: UInt32; Count: LongInt): LongInt;
begin

end;

method TStream.ReadData(var Buffer: Int64): LongInt;
begin
  {$IF ECHOES}
  result := sizeOf(Buffer);
  Buffer := BitConverter.ToInt64(ReadBytes(result), 0);  
  {$ELSEIF ISLAND OR TOFFEE}
  result := &Read(@Buffer, sizeOf(Buffer));
  {$ENDIF}
end;

method TStream.ReadData(var Buffer: Int64; Count: LongInt): LongInt;
begin

end;

method TStream.ReadData(var Buffer: UInt64): LongInt;
begin
  {$IF ECHOES}
  result := sizeOf(Buffer);
  Buffer := BitConverter.ToUInt64(ReadBytes(result), 0);  
  {$ELSEIF ISLAND OR TOFFEE}
  result := &Read(@Buffer, sizeOf(Buffer));
  {$ENDIF}
end;

method TStream.ReadData(var Buffer: UInt64; Count: LongInt): LongInt;
begin

end;

method TStream.ReadData(var Buffer: Single): LongInt;
begin
  {$IF ECHOES}
  result := sizeOf(Buffer);
  Buffer := BitConverter.ToSingle(ReadBytes(result), 0);  
  {$ELSEIF ISLAND OR TOFFEE}
  result := &Read(@Buffer, sizeOf(Buffer));
  {$ENDIF}
end;

method TStream.ReadData(var Buffer: Single; Count: LongInt): LongInt;
begin

end;

method TStream.ReadData(var Buffer: Double): LongInt;
begin
  {$IF ECHOES}
  result := sizeOf(Buffer);
  Buffer := BitConverter.ToDouble(ReadBytes(result), 0);  
  {$ELSEIF ISLAND OR TOFFEE}
  result := &Read(@Buffer, sizeOf(Buffer));
  {$ENDIF}
end;

method TStream.ReadData(var Buffer: Double; Count: LongInt): LongInt;
begin

end;
{$ENDIF}

method TStream.WriteData(const Buffer: TBytes; Count: LongInt): LongInt;
begin
  result := &write(Buffer, 0, Count);
end;

method TStream.WriteData(const Buffer: Int32): LongInt;
begin

end;

method TStream.WriteData(const Buffer: Int32; Count: LongInt): LongInt;
begin

end;

{$IF NOT COOPER}
method TStream.WriteData(Buffer: Boolean): LongInt;
begin
  {$IF ECHOES}
  var lBuf := BitConverter.GetBytes(Buffer);
  result := lBuf.Length;
  &Write(lBuf, 0, result);
  {$ELSEIF ISLAND OR TOFFEE}
  result := &Write(@Buffer, sizeOf(Buffer));
  {$ENDIF}
end;

method TStream.WriteData(Buffer: Boolean; Count: LongInt): LongInt;
begin

end;

method TStream.WriteData(Buffer: Char): LongInt;
begin
  {$IF ECHOES}
  var lBuf := BitConverter.GetBytes(Buffer);
  result := lBuf.Length;
  &Write(lBuf, 0, result);
  {$ELSEIF ISLAND OR TOFFEE}
  result := &Write(@Buffer, sizeOf(Buffer));
  {$ENDIF}
end;

method TStream.WriteData(Buffer: Char; Count: LongInt): LongInt;
begin

end;

method TStream.WriteData(Buffer: ShortInt): LongInt;
begin
  {$IF ECHOES}
  var lBuf := BitConverter.GetBytes(Buffer);
  result := lBuf.Length;
  &Write(lBuf, 0, result);
  {$ELSEIF ISLAND OR TOFFEE}
  result := &Write(@Buffer, sizeOf(Buffer));
  {$ENDIF}
end;

method TStream.WriteData(Buffer: ShortInt; Count: LongInt): LongInt;
begin

end;

method TStream.WriteData(Buffer: Int16): LongInt;
begin
  {$IF ECHOES}
  var lBuf := BitConverter.GetBytes(Buffer);
  result := lBuf.Length;
  &Write(lBuf, 0, result);
  {$ELSEIF ISLAND OR TOFFEE}
  result := &Write(@Buffer, sizeOf(Buffer));
  {$ENDIF}
end;

method TStream.WriteData(Buffer: Int16; Count: LongInt): LongInt;
begin

end;

method TStream.WriteData(Buffer: Int64): LongInt;
begin
  {$IF ECHOES}
  var lBuf := BitConverter.GetBytes(Buffer);
  result := lBuf.Length;
  &Write(lBuf, 0, result);
  {$ELSEIF ISLAND OR TOFFEE}
  result := &Write(@Buffer, sizeOf(Buffer));
  {$ENDIF}
end;

method TStream.WriteData(Buffer: Int64; Count: LongInt): LongInt;
begin

end;

method TStream.WriteData(Buffer: Single): LongInt;
begin
  {$IF ECHOES}
  var lBuf := BitConverter.GetBytes(Buffer);
  result := lBuf.Length;
  &Write(lBuf, 0, result);
  {$ELSEIF ISLAND OR TOFFEE}
  result := &Write(@Buffer, sizeOf(Buffer));
  {$ENDIF}
end;

method TStream.WriteData(Buffer: Single; Count: LongInt): LongInt;
begin

end;

method TStream.WriteData(Buffer: Double): LongInt;
begin
  {$IF ECHOES}
  var lBuf := BitConverter.GetBytes(Buffer);
  result := lBuf.Length;
  &Write(lBuf, 0, result);
  {$ELSEIF ISLAND OR TOFFEE}
  result := &Write(@Buffer, sizeOf(Buffer));
  {$ENDIF}
end;

method TStream.WriteData(Buffer: Double; Count: LongInt): LongInt;
begin

end;

method TStream.WriteData(Buffer: Byte): LongInt;
begin
  {$IF ECHOES}
  var lBuf := BitConverter.GetBytes(Buffer);
  result := lBuf.Length;
  &Write(lBuf, 0, result);
  {$ELSEIF ISLAND OR TOFFEE}
  result := &Write(@Buffer, sizeOf(Buffer));
  {$ENDIF}
end;

method TStream.WriteData(Buffer: Byte; Count: LongInt): LongInt;
begin

end;

method TStream.WriteData(Buffer: UInt16): LongInt;
begin
  {$IF ECHOES}
  var lBuf := BitConverter.GetBytes(Buffer);
  result := lBuf.Length;
  &Write(lBuf, 0, result);
  {$ELSEIF ISLAND OR TOFFEE}
  result := &Write(@Buffer, sizeOf(Buffer));
  {$ENDIF}
end;

method TStream.WriteData(Buffer: UInt16; Count: LongInt): LongInt;
begin

end;

method TStream.WriteData(Buffer: UInt32): LongInt;
begin
  {$IF ECHOES}
  var lBuf := BitConverter.GetBytes(Buffer);
  result := lBuf.Length;
  &Write(lBuf, 0, result);
  {$ELSEIF ISLAND OR TOFFEE}
  result := &Write(@Buffer, sizeOf(Buffer));
  {$ENDIF}
end;

method TStream.WriteData(Buffer: UInt32; Count: LongInt): LongInt;
begin

end;

method TStream.WriteData(Buffer: UInt64): LongInt;
begin
  {$IF ECHOES}
  var lBuf := BitConverter.GetBytes(Buffer);
  result := lBuf.Length;
  &Write(lBuf, 0, result);
  {$ELSEIF ISLAND OR TOFFEE}
  result := &Write(@Buffer, sizeOf(Buffer));
  {$ENDIF}
end;

method TStream.WriteData(Buffer: UInt64; Count: LongInt): LongInt;
begin

end;
{$ENDIF}

method TStream.Seek(Offset: LongInt; Origin: Word): LongInt;
begin
  result := Seek(Int64(Offset), TSeekOrigin(Origin));
end;

method TStream.Seek(const Offset: Int64; Origin: TSeekOrigin): Int64;
begin
  result := 0;
end;

method TStream.Seek(const Offset: Int64; Origin: Word): Int64;
begin
  result := Seek(Offset, TSeekOrigin(Origin));
end;

method TStream.ReadBuffer(var Buffer: TBytes; Count: LongInt);
begin

end;

method TStream.ReadBuffer(var Buffer: TBytes; Offset: LongInt; Count: LongInt);
begin

end;

method TStream.ReadBufferData(var Buffer: Int32);
begin

end;

method TStream.ReadBufferData(var Buffer: Int32; Count: LongInt);
begin

end;

{$IF NOT COOPER}
method TStream.ReadBufferData(var Buffer: Boolean);
begin

end;

method TStream.ReadBufferData(var Buffer: Boolean; Count: LongInt);
begin

end;

method TStream.ReadBufferData(var Buffer: Char);
begin

end;

method TStream.ReadBufferData(var Buffer: Char; Count: LongInt);
begin

end;

method TStream.ReadBufferData(var Buffer: ShortInt);
begin

end;

method TStream.ReadBufferData(var Buffer: ShortInt; Count: LongInt);
begin

end;

method TStream.ReadBufferData(var Buffer: Byte);
begin

end;

method TStream.ReadBufferData(var Buffer: Byte; Count: LongInt);
begin

end;

method TStream.ReadBufferData(var Buffer: Int16);
begin

end;

method TStream.ReadBufferData(var Buffer: Int16; Count: LongInt);
begin

end;

method TStream.ReadBufferData(var Buffer: UInt16);
begin

end;

method TStream.ReadBufferData(var Buffer: UInt16; Count: LongInt);
begin

end;

method TStream.ReadBufferData(var Buffer: UInt32);
begin

end;

method TStream.ReadBufferData(var Buffer: UInt32; Count: LongInt);
begin

end;

method TStream.ReadBufferData(var Buffer: Int64);
begin

end;

method TStream.ReadBufferData(var Buffer: Int64; Count: LongInt);
begin

end;

method TStream.ReadBufferData(var Buffer: UInt64);
begin

end;

method TStream.ReadBufferData(var Buffer: UInt64; Count: LongInt);
begin

end;

method TStream.ReadBufferData(var Buffer: Single);
begin

end;

method TStream.ReadBufferData(var Buffer: Single; Count: LongInt);
begin

end;

method TStream.ReadBufferData(var Buffer: Double);
begin

end;

method TStream.ReadBufferData(var Buffer: Double; Count: LongInt);
begin

end;
{$ENDIF}

method TStream.WriteBuffer(const Buffer: TBytes; Count: LongInt);
begin

end;

method TStream.WriteBuffer(const Buffer: TBytes; Offset: LongInt; Count: LongInt);
begin

end;

method TStream.WriteBufferData(var Buffer: Integer; Count: LongInt);
begin

end;

method TStream.CopyFrom(const Source: TStream; Count: Int64): Int64;
begin

end;

method THandleStream.SetSize(NewSize: LongInt);
begin
  SetSize(Int64(NewSize));
end;

method THandleStream.SetSize(const NewSize: Int64);
begin
  Seek(NewSize, TSeekOrigin.soBeginning);
end;

constructor THandleStream(aHandle: THandle);
begin
  inherited constructor;
  fHandle := aHandle;
end;

method THandleStream.Read(Buffer: TBytes; Offset: LongInt; Count: LongInt): LongInt;
begin
  result := FileRead(fHandle, var Buffer, Offset, Count);
end;

method THandleStream.Write(const Buffer: TBytes; Offset: LongInt; Count: LongInt): LongInt;
begin
  result := FileWrite(fHandle, Buffer, Offset, Count);
end;

method THandleStream.Seek(const Offset: Int64; Origin: TSeekOrigin): Int64;
begin
  result := FileSeek(fHandle, Offset, Integer(Origin));
end;

constructor TFileStream(const aFileName: DelphiString; Mode: Word);
begin
  constructor(aFileName, Mode, 0);
end;

constructor TFileStream(const aFileName: DelphiString; Mode: Word; Rights: Cardinal);
begin
  var lHandle: THandle;
  if Mode and fmCreate <> 0 then
    lHandle := FileCreate(aFileName, Mode, Rights)
  else
    lHandle := FileOpen(aFileName, Mode);
  inherited constructor(lHandle);
  fFileName := aFileName;
end;

constructor TCustomMemoryStream;
begin
  fData := new MemoryStream();
end;

method TCustomMemoryStream.Read(Buffer: TBytes; Offset: LongInt; Count: LongInt): LongInt;
begin
  result := fData.read(Buffer, Offset, Count);
end;

{$IF ISLAND OR TOFFEE}
method TCustomMemoryStream.&Read(Buffer: Pointer; Count: LongInt): LongInt;
begin
  {$IF ISLAND}
  {$IFDEF WINDOWS}ExternalCalls.{$ELSEIF POSIX}rtl.{$ENDIF}memcpy(Buffer, @fData.Bytes[Position], Count);
  {$ELSEIF TOFFEE}
  memcpy(Buffer, @fData.Bytes[Position], Count);
  {$ENDIF}  
end;
{$ENDIF}

method TCustomMemoryStream.Seek(const Offset: Int64; Origin: TSeekOrigin): Int64;
begin
  var lOrigin: SeekOrigin;
  case Origin of
    TSeekOrigin.soBeginning: lOrigin := SeekOrigin.Begin;
    TSeekOrigin.soCurrent: lOrigin := SeekOrigin.Current;
    TSeekOrigin.soEnd: lOrigin := SeekOrigin.End;
  end;
  result := fData.Seek(Offset, lOrigin);
end;

method TCustomMemoryStream.SaveToStream(aStream: TStream);
begin
  aStream.Write(fData.Bytes, 0, fData.Length);
end;

method TCustomMemoryStream.SaveToFile(const aFileName: DelphiString);
begin
  var lTmp := new TFileStream(aFileName, fmCreate or fmOpenWrite);
  SaveToStream(lTmp);
end;

method TMemoryStream.Clear;
begin
  fData.SetLength(0);
end;

method TMemoryStream.LoadFromStream(aStream: TStream);
begin
  SetSize(aStream.Size);
  Position := 0;
  CopyFrom(aStream, aStream.Size);
end;

method TMemoryStream.LoadFromFile(const aFileName: DelphiString);
begin
  var lTmp := new TFileStream(aFileName, fmOpenRead);
  LoadFromStream(lTmp);
end;

method TMemoryStream.SetSize(const NewSize: Int64);
begin
  fData.SetLength(NewSize);
end;

method TMemoryStream.SetSize(NewSize: LongInt);
begin
  fData.SetLength(NewSize);
end;

method TMemoryStream.Write(const Buffer: TBytes; Offset: LongInt; Count: LongInt): LongInt;
begin
  result := fData.Write(Buffer, Offset, Count);
end;

{$IF ISLAND OR TOFFEE}
method TMemoryStream.Write(Buffer: Pointer; Count: LongInt): LongInt;
begin
  result := Count;
end;
{$ENDIF}

constructor TBytesStream(const aBytes: TBytes);
begin
  fData := new MemoryStream(ABytes.Length);
  fData.Write(aBytes, aBytes.Length);
end;


end.
