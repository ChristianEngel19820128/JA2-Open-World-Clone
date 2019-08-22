
Function get_black(argb)

  Local a = (argb & $FF000000) / $1000000
  Local r = (argb & $FF0000) / $10000
  Local g = (argb & $FF00) / $100
  Local b = argb & $FF

	Local sw:Int = (r + g + b) / 3
	
	argb = a * $1000000 + 0 * $10000 + 0 * $100 + 0

  Return argb

End Function


Function get_sw(argb)

  Local a = (argb & $FF000000) / $1000000
  Local r = (argb & $FF0000) / $10000
  Local g = (argb & $FF00) / $100
  Local b = argb & $FF

	Local sw:Int = (r + g + b) / 3
	
	argb = a * $1000000 + sw * $10000 + sw * $100 + sw

  Return argb

End Function


Function get_blend(argb,r1,g1,b1)

  Local a = (argb & $FF000000) / $1000000
  Local r = (argb & $FF0000) / $10000
  Local g = (argb & $FF00) / $100
  Local b = argb & $FF

	Local sw:Int = (r + g + b) / 3
	
	argb = a * $1000000 + (sw+r1)/2 * $10000 + (sw+g1)/2 * $100 + (sw+b1)/2

  Return argb

End Function



Function get_light(argb,r1,g1,b1)

  Local a = (argb & $FF000000) / $1000000
  Local r = (argb & $FF0000) / $10000
  Local g = (argb & $FF00) / $100
  Local b = argb & $FF

	Local sw:Int = (r + g + b) / 3
	
	argb = a * $1000000 + (sw*r1)/255 * $10000 + (sw*g1)/255 * $100 + (sw*b1)/255

  Return argb

End Function

