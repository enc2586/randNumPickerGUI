init := 0
Global Arr := Array()

Gui, Font, s14 Bold

Gui, Add, Text, x20 y20, ���۰�: 
Gui, Add, Edit, x100 y18 w100 h30 vNum1, 1
Gui, Add, Text, x20 y60, ��������: 
Gui, Add, Edit, x100 y57 w100 h30 vNum2, 18
Gui, Add, Checkbox, x20 y95 vNorepeat, �ߺ� ���� �̱�
Gui, Add, Button, x20 y130 w180 h30 gSelBtn vBtn, ���� ����

Gui, Show, w220 h180, ������ȣ
return

SelBtn:
if (init == 0)
{
	Gui, Submit, NoHide
	if (Norepeat > 0) {
		repeat = ����
	} else {
		repeat = �ְ�
	}
	MsgBox, 1, ���� ���� ���, �� ������ �����Ͻðڽ��ϱ�?`n����: %Num1% ~ %Num2%`n�ߺ�: %repeat%`n`n�� �� �����ϸ� �ٲٽ� �� �����ϴ�.
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
		GuiControl, , Btn, �̱�!
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
		MsgBox, 64, ��ȣ ���� �̱�, ���� ��ȣ: [ %chNum% ]`n(%numleft%�� ����)
	}
	if(numleft == 0)
	{
		MsgBox, 48, �ߺ� ���� �̱� �Ϸ�, �ߺ� ���� ��� ��ȣ�� ���� �̱⸦ �Ϸ��߽��ϴ�., 10
		ExitApp
	}
	return
}
Random, a, n1, n2
MsgBox, 64, ��ȣ ���� �̱�, ���� ��ȣ: [ %a% ]

return


GuiClose:
ExitApp