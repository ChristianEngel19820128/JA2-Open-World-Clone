






Global snd_pistol_lnl:TSound=LoadSound("sfx/weapons/PISTOL LNL.wav")
Global snd_pistol_reload:TSound=LoadSound("sfx/weapons/PISTOL RELOAD.wav")
Global snd_revolver_lnl:TSound=LoadSound("sfx/weapons/REVOLVER LNL.wav")
Global snd_revolver_reload:TSound=LoadSound("sfx/weapons/REVOLVER RELOAD.wav")
Global snd_rifle_lnl:TSound=LoadSound("sfx/weapons/RIFLE LNL.wav")
Global snd_rifle_reload:TSound=LoadSound("sfx/weapons/RIFLE RELOAD.wav")
Global snd_shotgun_lnl:TSound=LoadSound("sfx/weapons/SHOTGUN LNL")
Global snd_shotgun_reload:TSound=LoadSound("sfx/weapons/Pump Shotgun.wav")
Global snd_smg_lnl:TSound=LoadSound("sfx/weapons/SMG LNL")
Global snd_smg_reload:TSound=LoadSound("sfx/weapons/SMG RELOAD.wav")
Global snd_lmg_lnl:TSound=LoadSound("sfx/weapons/LMG LNL")
Global snd_lmg_reload:TSound=LoadSound("sfx/weapons/LMG RELOAD.wav")



Global snd_chamber:TSound=LoadSound("sfx/weapons/Chambering A Round.wav")
Global snd_eject:TSound=LoadSound("sfx/weapons/Ejecting Magazine.wav")
Global snd_bullet:TSound=LoadSound("sfx/weapons/ammo_casings_09.wav")


Global snd_cal_9mm:TSound=LoadSound("sfx/weapons/9mm.wav")
Global snd_cal_556x45mm:TSound=LoadSound("sfx/weapons/5,56.wav")
Global snd_cal_762x39mm:TSound=LoadSound("sfx/weapons/7,62WP.wav")
Global snd_cal_12x70:TSound=LoadSound("sfx/weapons/shotgun.wav")


Global snd_dry_fire:TSound=LoadSound("sfx/weapons/DRY FIRE 1.wav")





Global snd_target_cursor:TSound=LoadSound("sfx/TARGET CURSOR.wav")





Global snd_go_crouch_to_stand:TSound=LoadSound("sfx/movement/CROUCH TO STAND.wav")
Global snd_go_stand_to_crouch:TSound=LoadSound("sfx/movement/STAND TO CROUCH.wav")
Global snd_go_crouch_to_prone:TSound=LoadSound("sfx/movement/CROUCH TO PRONE.wav")
Global snd_go_prone_to_crouch:TSound=LoadSound("sfx/movement/PRONE TO CROUCH.wav")






Global snd_thunder1:TSound=LoadSound("sfx/ambient/THUNDER1_22K.wav")
Global snd_thunder2:TSound=LoadSound("sfx/ambient/THUNDER2_22K.wav")
Global snd_thunder3:TSound=LoadSound("sfx/ambient/THUNDER3_22K.wav")
Global snd_thunder4:TSound=LoadSound("sfx/ambient/STORM1.wav")


Global snd_rain0:TSound=LoadSound("sfx/ambient/rain.wav",SOUND_LOOP)
Global snd_rain1:TSound=LoadSound("sfx/ambient/regen2.wav",SOUND_LOOP)
Global snd_rain2:TSound=LoadSound("sfx/ambient/regen4.wav",SOUND_LOOP)
Global snd_rain3:TSound=LoadSound("sfx/ambient/regen7.wav",SOUND_LOOP)

Global snd_wind1:TSound=LoadSound("sfx/ambient/wind1.wav",SOUND_LOOP)
Global snd_wind2:TSound=LoadSound("sfx/ambient/wind2.wav",SOUND_LOOP)
Global snd_wind3:TSound=LoadSound("sfx/ambient/wind3.wav",SOUND_LOOP)
Global snd_wind4:TSound=LoadSound("sfx/ambient/wind4.wav",SOUND_LOOP)
Global snd_wind5:TSound=LoadSound("sfx/ambient/wind5.wav",SOUND_LOOP)
Global snd_wind6:TSound=LoadSound("sfx/ambient/wind-sand.wav",SOUND_LOOP)

Global snd_wind11:TSound=LoadSound("sfx/ambient/wind1 (2).wav",SOUND_LOOP)
Global snd_wind12:TSound=LoadSound("sfx/ambient/wind2 (2).wav",SOUND_LOOP)

Global snd_sturm1:TSound=LoadSound("sfx/ambient/sturm_2.wav",SOUND_LOOP)
Global snd_sturm2:TSound=LoadSound("sfx/ambient/sturm_3.wav",SOUND_LOOP)
Global snd_sturm3:TSound=LoadSound("sfx/ambient/sturm_5.wav",SOUND_LOOP)

Global snd_wind_123:TSound=LoadSound("sfx/ambient/Wind_123.wav",SOUND_LOOP)
Global snd_wind_1234:TSound=LoadSound("sfx/ambient/wind_1234.wav",SOUND_LOOP)


Global snd_jungle1:TSound=LoadSound("sfx/ambient/jungle1.wav")
Global snd_jungle2:TSound=LoadSound("sfx/ambient/jungle2.wav")
Global snd_jungle3:TSound=LoadSound("sfx/ambient/jungle3.wav")
Global snd_jungle4:TSound=LoadSound("sfx/ambient/jungle4.wav")


Global snd_tf1:TSound=LoadSound("sfx/ambient/tf1.wav")
Global snd_tf2:TSound=LoadSound("sfx/ambient/tf2.wav")
Global snd_tf3:TSound=LoadSound("sfx/ambient/tf3.wav")
Global snd_tf4:TSound=LoadSound("sfx/ambient/tf4.wav")
Global snd_tf6:TSound=LoadSound("sfx/ambient/tf6.wav")
Global snd_tf7:TSound=LoadSound("sfx/ambient/tf7.wav")
Global snd_tf8:TSound=LoadSound("sfx/ambient/tf8.wav")

Global snd_owl1:TSound=LoadSound("sfx/ambient/OWL1.wav")
Global snd_owl2:TSound=LoadSound("sfx/ambient/OWL2.wav")
Global snd_owl3:TSound=LoadSound("sfx/ambient/OWL3.wav")

Global snd_nightbird1:TSound=LoadSound("sfx/ambient/NIGHT_BIRD1.wav")
Global snd_nightbird3:TSound=LoadSound("sfx/ambient/NIGHT_BIRD3.wav")

Global snd_crow2:TSound=LoadSound("sfx/ambient/CROW2.wav")
Global snd_crow3:TSound=LoadSound("sfx/ambient/CROW3.wav")
Global snd_crow_fly:TSound=LoadSound("sfx/ambient/CROW FLY.wav")


Global snd_cricket:TSound=LoadSound("sfx/ambient/CRICKET.wav")
Global snd_crickets:TSound=LoadSound("sfx/ambient/CRICKETs.wav")
Global snd_cricket1:TSound=LoadSound("sfx/ambient/CRICKET1.wav")
Global snd_cricket2:TSound=LoadSound("sfx/ambient/CRICKET2.wav")
Global snd_cricketloop1:TSound=LoadSound("sfx/ambient/CRICKETY_LOOP.wav")
Global snd_cricketloop2:TSound=LoadSound("sfx/ambient/CRICKETY_LOOP2.wav")





Function playsnd(snd:TSound,ch:TChannel=Null)

  If snd <> Null Then
    If ch <> Null Then
      PlaySound(snd,ch)
    Else
      PlaySound(snd)
    End If
  End If

End Function






Function playsnd_shot(item)

Local i=item_type_kaliber[item_type[item]]



  Select i
    Case cal_9mm playsnd(snd_cal_9mm)
    Case cal_556x45mm playsnd(snd_cal_556x45mm)
    Case cal_762x39mm playsnd(snd_cal_762x39mm)
    Case cal_12x70 playsnd(snd_cal_12x70)


  End Select

End Function



Function playsnd_reload(i)

	Select i
	  Case group_pistol playsnd(snd_pistol_reload)
	  Case group_revolver playsnd(snd_revolver_reload)
	  Case group_mp playsnd(snd_pistol_reload)
	  Case group_mpk playsnd(snd_pistol_reload)
    Case group_smg playsnd(snd_smg_reload)
	  Case group_rifle playsnd(snd_rifle_reload)
	  Case group_lmg playsnd(snd_lmg_reload)
	  Case group_shotgun playsnd(snd_rifle_reload)
	  Case group_magazine playsnd(snd_chamber)
	  Default Print "No sound reload "+i
	
	End Select

End Function

Function playsnd_lnl(i)

	Select i
	  Case group_pistol playsnd(snd_pistol_lnl)
	  Case group_revolver playsnd(snd_revolver_lnl)
	  Case group_mp playsnd(snd_smg_lnl)
	  Case group_mpk playsnd(snd_smg_lnl)
    Case group_smg playsnd(snd_smg_lnl)
	  Case group_rifle playsnd(snd_rifle_lnl)
	  Case group_lmg playsnd(snd_lmg_lnl)
	  Case group_shotgun playsnd(snd_rifle_lnl)	
		Default Print "No sound lnl "+i
		
	End Select

End Function
