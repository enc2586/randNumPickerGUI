init := 0
Global Arr := Array()

Gui, Font, s14 Bold

Gui, Add, Text, x20 y20, 시작값: 
Gui, Add, Edit, x100 y18 w100 h30 vNum1, 1
Gui, Add, Text, x20 y60, 마지막값: 
Gui, Add, Edit, x100 y57 w100 h30 vNum2, 18
Gui, Add, Checkbox, x20 y95 vNorepeat, 중복 없이 뽑기
Gui, Add, Button, x20 y130 w180 h30 gSelBtn vBtn, 범위 지정

Gui, Show, w220 h180, 랜덤번호
return

SelBtn:
if (init == 0)
{
	Gui, Submit, NoHide
	if (Norepeat > 0) {
		repeat = 없게
	} else {
		repeat = 있게
	}
	MsgBox, 1, 설정 적용 경고, 이 설정을 적용하시겠습니까?`n범위: %Num1% ~ %Num2%`n중복: %repeat%`n`n한 번 적용하면 바꾸실 수 없습니다.
	IfMsgBox, OK
	{
		GuiControl, Disable, Num1
		GuiControl, Disable, Num2
		GuiControl, Disable, Norepeat
		global n1 := Num1
		global n2 := Num2
		if (n1 > n2)
		{
			temp = n1
			n1 = n2
			n2 = temp
		}
		init += 1
		if (Norepeat == 1)
		{
			k := n2-n1+1
			Loop, %k%
			{
				num := n1-1+A_Index
				Arr.Push(num)
			}
			Global numleft = n2 - n1 + 1
		}
		GuiControl, , Btn, 뽑기!
	}
	return
}
if (Norepeat == 1)
{
	if (numleft > 0)
	{
		Random, a, 1, numleft
		chNum := Arr[a]
		if (a != numleft)
		{
			Arr[a] := Arr[numleft]
		}
		numleft := numleft - 1
		MsgBox, 64, 번호 랜덤 뽑기, 뽑힌 번호: [ %chNum% ]`n(%numleft%개 남음)
	}
	if(numleft == 0)
	{
		MsgBox, 48, 중복 없이 뽑기 완료, 중복 없이 모든 번호에 대해 뽑기를 완료했습니다., 10
		ExitApp
	}
	return
}
Random, a, n1, n2
MsgBox, 64, 번호 랜덤 뽑기, 뽑힌 번호: [ %a% ]

return


GuiClose:
ExitApp