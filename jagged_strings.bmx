

Const strings_max=512

Const t_gruppenrolle=0
Const t_keine=1
Const t_leader=2
Const t_scout=3
Const t_sani=4
Const t_mech=5

Const t_trupp=6
Const t_neuer_trupp=7

Const t_gps=8
Const t_truppverwaltung=9
Const t_soeldner_akte=10
Const t_web=11
Const t_email=12
Const t_finanzen=13
Const t_logbuch=14
Const t_archiv=15
Const t_daten=16

Const t_schliessen=17

Const t_ausschalten=18

Const t_fortsetzen=19
Const t_neustarten=20
Const t_option=21
Const t_ende=22

Const t_name=23
Const t_nick=24
Const t_weiter=25
Const t_abschliessen=26
Const t_zurueck=27

Const t_maennlich=28
Const t_weiblich=29

Const t_haendigkeit=30
Const t_righthand=31
Const t_lefthand=32
Const t_dualhand=33

Const t_hauptmenu=34
Const t_benutzerinit=35
Const t_schritt=36

Const t_gesundheit=37
Const t_geschicklichkeit=38
Const t_beweglichkeit=39
Const t_reflexe=40
Const t_staerke=41
Const t_weisheit=42
Const t_erfahrung=43
Const t_glueck=44
Const t_charisma=45
Const t_treffsicherheit=46
Const t_schwimmen=47
Const t_fuehrung=48
Const t_scouting=49
Const t_jagen=50
Const t_fischen=51
Const t_allgemeinwissen=52
Const t_medizin=53
Const t_botanik=54
Const t_technik=55
Const t_sprengstoffe=56
Const t_sprachen=57
Const t_mathematik=58
Const t_physik=59
Const t_chemie=60
Const t_survivallism=61
Const t_waffen=62
Const t_kochen=63
Const t_bogenschiessen=64


Const t_pfadfinder=65
Const t_vergesslich=66
Const t_nachdenklich=67
Const t_psycho=68
Const t_einzelgaenger=69
Const t_teamspieler=70
Const t_anfuehrer=71
Const t_kurzsichtig=72
Const t_weitsichtig=73
Const t_nachtblind=74
Const t_geschickt=75
Const t_stark=76
Const t_schlau=77
Const t_erfahren=78
Const t_schleichen=79
Const t_werfen=80
Const t_waffenexperte=81
Const t_nichtschwimmer=82
Const t_drogensuechtig=83
Const t_alkoholiker=84
Const t_sexistisch=85
Const t_naturmensch=86
Const t_nudistisch=87
Const t_feminist=88
Const t_langschlaefer=89
Const t_leichterschlaf=90
Const t_fahrerass=91
Const t_durchschnittstyp=92
Const t_glueckskind=93
Const t_feigling=94
Const t_schlosser=95
Const t_scharfschuetze=96
Const t_stadtkind=97
Const t_mutig=98
Const t_abstinenzler=99
Const t_triathlet=100
Const t_adlerauge=101
Const t_nachteule=102
Const t_elektriker=103
Const t_schizophren=104

Const t_punkte=105
Const t_extracash=106

Const t_personalisierung=107
Const t_attribute=108
Const t_fertigkeiten=109
Const t_wissen=110
Const t_eigenschaften=111
Const t_ausgwaehlt=112
Const t_verfuegbar=113

Const t_stoppen=114
Const t_ausdauer=115
Const t_messer=116

Global strings:String[strings_max]		
		
		
Function strings_load()


		If FileType("config/strings.txt")=1 Then
		
			Local file:TStream=ReadFile("config/strings.txt")
			
      Local i

      While Eof(file)=False And i<strings_max

        strings[i]=ReadLine(file)
        i:+1

        loadbar("Loading Strings",i,strings_max)

      Wend

      CloseFile(file)

    End If

End Function



