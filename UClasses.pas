unit UClasses;

interface

type
  THouse = class
    nickName: string;
    adress: string;
    cod_house: Integer;
  end;
type
  TBillType = class
    billType: string;
    cod_bill_type: Integer;
  end;

type
  TResident = class
    nameResident: string;
    dt_in: TDate;
    dt_out: TDate;
    dayUse: Integer;
    amountPerUser: Float32;
    cod_resident: Integer;
    couple: Boolean;
  end;

type
  TBill = class
    cod_bills: Integer;
    nameBill: string;
    amount: Float32;
    dead_line: TDate;
    //attchment: TBlobfield;
    paid_day: TDate;
    cod_house: Integer;
    dt_from: TDate;
    dt_to: TDate;
    cod_bill_type: Integer;
    residents: array of TResident;
    amountPerDay: Float32;
    function split: String;
    function onePersonPays: string;
    function daysUsed(resident: TResident): Integer;
  private
  end;



implementation
uses
System.DateUtils, System.SysUtils, System.Math, Data.DB, UFuncions;

{ TBill }


function TBill.daysUsed(resident: TResident): Integer;
var
  bill: TBill;
begin
  bill := Self;
  Result := DaysRangeOverlap(resident.dt_in,resident.dt_out,bill.dt_from,bill.dt_to);
end;

function TBill.onePersonPays: string;
var
  totalDays,j: Integer;
  outPut: string;
begin
  totalDays := 0;
  outPut := '';

  outPut := 'Bill: ' + self.nameBill;
  outPut := outPut + #13 + 'Bill Amount: ' + FloatToStrF(Self.amount, ffFixed,8,2);
  outPut := outPut + #13 + 'Resident: ' + residents[0].nameResident;
  residents[0].amountPerUser := self.amount;

  result := outPut;
end;

function TBill.split: String;
var
  totalDays,j: Integer;
  outPut: string;
begin
  totalDays := 0;

  outPut := '';
  outPut := 'Bill: '+self.nameBill;
  outPut := outPut + #13 + 'Bill Amount: ' + FloatToStrF(Self.amount, ffFixed,8,2);

  //Calculando dias de uso, somando os dias de uso de todos os residentes
  for j := 0 to Length(residents)-1 do
  begin
    if residents[j].couple then
      residents[j].dayUse := (2*(daysUsed(residents[j])))
    else
      residents[j].dayUse := daysUsed(residents[j]);

      totalDays := totalDays + residents[j].dayUse;
  end;

  Self.amountPerDay := amount/totalDays;

  for j := 0 to Length(residents)-1 do
  begin
    residents[j].amountPerUser := residents[j].dayUse*self.amountPerDay;
    outPut := outPut + #13;
    outPut := outPut + #13 +'Name: '+ residents[j].nameResident;
    if residents[j].couple then
      outPut := outPut + ' (Couple)';
    outPut := outPut + #13 +'Days use inside period: '+ IntToStr(residents[j].dayUse);
    outPut := outPut + #13 +'Should Pay: '
    + FloatToStrF(residents[j].dayUse*self.amountPerDay, ffFixed,8,2);
  end;

  Result := outPut;
end;
end.
