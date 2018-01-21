#Asseel Sidique
#Dungeons of Munroe


INTRO_DUNGEON

INTRO_TEXT_DUNGEON

read PLAYERNAME

echo "Welcome, $PLAYERNAME" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt

INSTRUCTIONS

NAME=$PLAYERNAME
HEALTH=`cut -d ":" -f2 player`
WEAPON=`cut -d ":" -f3 player`
MAGIC=`cut -d ":" -f4 player`
ARMOR=`cut -d ":" -f5 player`
PLAYERITEM=`cut -d ":" -f6 player`
PLAYERITEM2=`cut -d ":" -f6 player`

ROOMNUMBERUP=0
ROOMNUMBER=1
PLAYERTRAPPED="false"
let VARIABLE1=0
let VARIABLE2=0
let VARIABLE3=0
let VARIABLE4=0
let VARIABLE5=0
let VARIABLE6=0
let VARIABLE7=0
let VARIABLE8=0
let VARIABLE9=0
let VARIABLE10=0
let VARIABLE11=0
let VARIABLE12=0
let VARIABLE13=0
let RANDOMVARIABLE=0
let VARIABLE15=0
let VARIABLE16=0
let VARIABLE17=0
let DEADHEALTH=0

while [ $ROOMNUMBER < 10 ]
do

read INPUT

if [ $INPUT == "Exit" ] || [ $INPUT == "exit" ]
then
	exit
fi

if [ $INPUT == "Stats" ] || [ $INPUT == "stats" ]
then
	echo -e "\n"$NAME | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
	echo "Health:"$HEALTH | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
	echo "Weapon:"$WEAPON | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
	echo "Magic:"$MAGIC | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
	echo "Armor:"$ARMOR | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
	echo "PlayerItem: $PLAYERITEM" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
	echo "PlayerItem2: $PLAYERITEM2" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
	echo -e "PLAYERATTACK:$PLAYERATTACK" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
	echo -e "PLAYERDEFENCE:$PLAYERDEFENCE" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
	echo -e "MAGICATTACK:$MAGICATTACK" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
	echo -e "\n"
fi
if [ $INPUT == "Clear" ] || [ $INPUT == "clear" ]
then
	clear
fi

if [ $INPUT == "Help" ] || [ $INPUT == "help" ]
then
	OPTIONS
fi

if [ $INPUT == "Info" ] || [ $INPUT == "info" ]
then
	INFO
fi

if [ $INPUT == "MAP" ] || [ $INPUT == "Map" ] || [ $INPUT == "map" ] && [ $PLAYERITEM2 == "MAP" ]
then
	DUNGEONMAP | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
fi

case $ROOMNUMBER in
1) if [ $ROOMNUMBERUP == 0 ] && [ $VARIABLE13 == 0 ]
	then
	WEAPON="HAND"
	MAGIC="NONE"
	ARMOR="NONE"
	PLAYERITEM="NONE"
	case $ARMOR in
        "NONE") PLAYERDEFENCE=0;;
        "BRONZE_ARMOR") PLAYERDEFENCE=50;;
        "STEEL_ARMOR") PLAYERDEFENCE=100;;
        "GOLD_ARMOR") PLAYERDEFENCE=200;;
        esac
        case $MAGIC in
        "FIREBALL") MAGICATTACK=25;;
        "ICEBALL") MAGICATTACK=35;;
        "TORNADO") MAGICATTACK=70;;
        "HURRICANE") MAGICATTACK=140;;
        "NONE") MAGICATTACK=0;;
        esac
        case $WEAPON in
        "NONE") let PLAYERATTACK=0;;
        "HAND") PLAYERATTACK=10;;
        "SWORD") PLAYERATTACK=25;;
        "MACE") PLAYERATTACK=35;;
        "RUBBERDUCK") PLAYERATTACK=100;;
        esac
	VARIABLE13=1
	fi
if [ $ROOMNUMBERUP == 1 ] && [ $VARIABLE5 == 0 ]
then
	 echo -e "You encountered a treasure chest!\nFound BRONZE_ARMOR !\nFound Magic Scroll: FIREBALL ! Take or Leave?" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
	read TAKE3
	case $TAKE3 in
	"Take"|"take")
	ARMOR=`cut -d ":" -f1 treasureA`
	MAGIC=`cut -d ":" -f2 treasureA`	
	 
	case $ARMOR in
	"NONE") PLAYERDEFENCE=0;;
	"BRONZE_ARMOR") PLAYERDEFENCE=50;;
	"STEEL_ARMOR") PLAYERDEFENCE=100;;
	"GOLD_ARMOR") PLAYERDEFENCE=200;;
	esac
	case $MAGIC in
	"FIREBALL") MAGICATTACK=25;;
	"ICEBALL") MAGICATTACK=35;;
	"TORNADO") MAGICATTACK=70;;
	"HURRICANE") MAGICATTACK=140;;
	"NONE") MAGICATTACK=0;;
	esac
	case $WEAPON in
	"HAND") PLAYERATTACK=10;;
	"SWORD") PLAYERATTACK=25;;
	"MACE") PLAYERATTACK=35;;
	"RUBBERDUCK") PLAYERATTACK=100;;
	esac
	;;
	"Leave|leave") echo "You left it there" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt;;
	esac
	echo -e "\nARMOR:$ARMOR" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
	echo -e "\nMAGIC:$MAGIC" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
	VARIABLE5=1
fi;;
		
2) if [ $ROOMNUMBERUP == 0 ] && [ $VARIABLE2 == 0 ]
then
	MONSTERNAME=`cut -d ":" -f1 monsterA`
	MONSTERHEALTH=`cut -d ":" -f2 monsterA`
	MONSTERATTACK=`cut -d ":" -f3 monsterA`
	let VARIABLE2=1
fi
	if [ $ROOMNUMBERUP == -1 ] && [ $VARIABLE6 == 0 ]
	then
	echo "You found treasure chest with a giant water bottle, a SWORD and a TORNADO scroll! Take or Leave?" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
	read TAKE1
	case $TAKE1 in
	"Take"|"take")
	HEALTH=`cut -d ":" -f1 treasureC`
	MAGIC=`cut -d ":" -f2 treasureC`
	WEAPON=`cut -d ":" -f3 treasureC`

	 case $ARMOR in
        "NONE") PLAYERDEFENCE=0;;
        "BRONZE_ARMOR") PLAYERDEFENCE=50;;
        "STEEL_ARMOR") PLAYERDEFENCE=100;;
        "GOLD_ARMOR") PLAYERDEFENCE=200;;
        esac
        case $MAGIC in
        "FIREBALL") MAGICATTACK=25;;
        "ICEBALL") MAGICATTACK=35;;
        "TORNADO") MAGICATTACK=70;;
        "HURRICANE") MAGICATTACK=140;;
        "NONE") MAGICATTACK=0;;
        esac
        case $WEAPON in
        "NONE") let PLAYERATTACK=0;;
        "HAND") PLAYERATTACK=10;;
        "SWORD") PLAYERATTACK=25;;
        "MACE") PLAYERATTACK=35;;
        "RUBBERDUCK") PLAYERATTACK=100;;
        esac

	echo "You took the gear" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt;;
	"Leave|leave") echo "You left it there." ;;
	esac
	echo -e "\nHEALTH:$HEALTH\n" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
	echo -e "\nMAGIC:$MAGIC\n" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
	echo -e "\nWEAPON:$WEAPON\n" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
	VARIABLE6=1
	fi;;
3) if [ $ROOMNUMBERUP == -1 ] && [ $VARIABLE12 == 0 ]
	then
	TRAPATTACK=`cut -d ":" -f1 trapA`
	let HEALTH=$HEALTH-$TRAPATTACK
	echo -e "\nHEALTH:$HEALTH\n" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
	VARIABLE12=1
	PLAYERTRAPPED="true"
	fi;;
4) if [ $ROOMNUMBERUP == 1 ] && [ $VARIABLE3 == 0 ]
then
      MONSTERNAME=`cut -d ":" -f1 monsterB`
      MONSTERHEALTH=`cut -d ":" -f2 monsterB`
      MONSTERATTACK=`cut -d ":" -f3 monsterB`
      let VARIABLE3=1
fi

if [ $ROOMNUMBERUP == 2 ] && [ $VARIABLE10 == 0 ]
	then
		echo "You found a treasure chest with a MACE and STEEL_ARMOR! Take or Leave?" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
		read TAKE2
		case $TAKE2 in
		"Take"|"take")
		echo "You took the gear! | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt"
		WEAPON=`cut -d ":" -f1 treasureE`
		ARMOR=`cut -d ":" -f2 treasureE`

	 case $ARMOR in
        "NONE") PLAYERDEFENCE=0;;
        "BRONZE_ARMOR") PLAYERDEFENCE=50;;
        "STEEL_ARMOR") PLAYERDEFENCE=100;;
        "GOLD_ARMOR") PLAYERDEFENCE=200;;
        esac
        case $MAGIC in
        "FIREBALL") MAGICATTACK=25;;
        "ICEBALL") MAGICATTACK=35;;
        "TORNADO") MAGICATTACK=70;;
        "HURRICANE") MAGICATTACK=140;;
        "NONE") MAGICATTACK=0;;
        esac
        case $WEAPON in
        "NONE") let PLAYERATTACK=0;;
        "HAND") PLAYERATTACK=10;;
        "SWORD") PLAYERATTACK=25;;
        "MACE") PLAYERATTACK=35;;
        "RUBBERDUCK") PLAYERATTACK=100;;
        esac
			;;
		"Leave|leave") echo "You left it there" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt;; 
		esac
		echo -e "\nWEAPON:$WEAPON\n" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
		echo -e "\nARMOR:$ARMOR\n" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
		VARIABLE10=1
	fi;;
5) if [ $ROOMNUMBERUP == 0 ] && [ $VARIABLE16 == 0 ]
	then
		echo -e "You found a MAP! Type MAP to view the map. Clear the screen before you do it!" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
		PLAYERITEM2="MAP"
		VARIABLE16=1
	fi;;
6) if [ $ROOMNUMBERUP == 0 ]
	then
	TRAPATTACK=`cut -d ":" -f1 trapB`
	let HEALTH=$HEALTH-$TRAPATTACK
	echo -e "GAS TRAP! Armor can't protect you! Every move you make will hurt you while you are here!" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
	echo -e "\nHEALTH:$HEALTH\n" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
	fi
if [ $ROOMNUMBERUP == 1 ] && [ $VARIABLE8 == 0 ]
	then
		MONSTERNAME=`cut -d ":" -f1 monsterD`
		MONSTERHEALTH=`cut -d ":" -f2 monsterD`
		MONSTERATTACK=`cut -d ":" -f3 monsterD`
		let VARIABLE8=1
	fi
if [ $ROOMNUMBERUP == 2 ]
then
	HEALTH=100
	echo -e "\nHEALTH:$HEALTH" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
fi;;
7) if [ $ROOMNUMBERUP == -2 ] && [ $VARIABLE7 == 0 ]
	then
		PLAYERITEM=`cut -d ":" -f1 treasureD`
		echo "You found a key! It has been added to your inventory" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
		echo -e "\nPLAYERITEM:$PLAYERITEM\n" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
		VARIABLE7=1
	fi
	if [ $ROOMNUMBERUP == -1 ] && [ $VARIABLE4 == 0 ]
then
      MONSTERNAME=`cut -d ":" -f1 monsterC`
      MONSTERHEALTH=`cut -d ":" -f2 monsterC`
      MONSTERATTACK=`cut -d ":" -f3 monsterC`
      let VARIABLE4=1
fi;;

9) if [ $ROOMNUMBERUP == 1 ] && [ $VARIABLE17 == 0 ]
	then
	TRAPATTACK=`cut -d ":" -f1 trapC`
	PLAYERTRAPPED="true"
	echo "You're trapped! Such a shame.." | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
	let HEALTH=$HEALTH-$TRAPATTACK
	echo -e "\nHEALTH:$HEALTH" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
	VARIABLE17=1
	fi
if [ $ROOMNUMBERUP == 2 ] && [ $VARIABLE11 == 0 ]
	then
		echo -e "You found a treasure chest containing....... 
		A RUBBER DUCK?
		GOLD ARMOR??
		A HURRICANE SCROLL!?!?
		It's your LUCKY DAY!!
		Take or Leave!??" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
		read TAKE4
		case $TAKE4 in 
		"Take"|"take")
		WEAPON=`cut -d ":" -f1 treasureF`
		ARMOR=`cut -d ":" -f2 treasureF`
		MAGIC=`cut -d ":" -f3 treasureF`

		 case $ARMOR in
        "NONE") PLAYERDEFENCE=0;;
        "BRONZE_ARMOR") PLAYERDEFENCE=50;;
        "STEEL_ARMOR") PLAYERDEFENCE=100;;
        "GOLD_ARMOR") PLAYERDEFENCE=200;;
        esac
        case $MAGIC in
        "FIREBALL") MAGICATTACK=25;;
        "ICEBALL") MAGICATTACK=35;;
        "TORNADO") MAGICATTACK=70;;
        "HURRICANE") MAGICATTACK=140;;
        "NONE") MAGICATTACK=0;;
        esac
        case $WEAPON in
        "NONE") let PLAYERATTACK=0;;
        "HAND") PLAYERATTACK=10;;
        "SWORD") PLAYERATTACK=25;;
        "MACE") PLAYERATTACK=35;;
        "RUBBERDUCK") PLAYERATTACK=100;;
        esac
		echo "You took the gear" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt;;
		"Leave|leave") echo "You left the gear" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt ;;
		esac
		echo -e "\nWEAPON:$WEAPON\n" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
		echo -e "\nARMOR:$ARMOR\n" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
		echo -e "\nMAGIC:$MAGIC\n" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
		VARIABLE11=1
	fi 
	;;
10) if [ $ROOMNUMBERUP == 0 ] && [ $VARIABLE9 == 0 ]
	then
		MONSTERNAME=`cut -d ":" -f1 monsterE`
		MONSTERHEALTH=`cut -d ":" -f2 monsterE`
		MONSTERATTACK=`cut -d ":" -f2 monsterE`
		let VARIABLE9=1
	fi;;
esac

case $INPUT in
"Look")	case $ROOMNUMBER in
1) if [ $ROOMNUMBERUP == 0 ]
then 
	ROOM_DESCRIPTION/ROOMLOOK11 | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
fi
if [ $ROOMNUMBERUP == 1 ]
then
	ROOM_DESCRIPTION/ROOMLOOK21 | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
fi
;;
2) if [ $ROOMNUMBERUP == 0 ]
then
	ROOM_DESCRIPTION/ROOMLOOK12 | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
	echo -e "\nA wild $MONSTERNAME has appeared" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
	echo -e "\n$MONSTERNAME\nHEALTH:$MONSTERHEALTH\nATTACKPWR:$MONSTERATTACK" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
fi
if [ $ROOMNUMBERUP == 1 ]
then
	ROOM_DESCRIPTION/ROOMLOOK22 | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
fi
if [ $ROOMNUMBERUP == -1 ]
then
	ROOM_DESCRIPTION/ROOMLOOKN22 | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
fi
;;
3) if [ $ROOMNUMBERUP == 0 ]
then
	ROOM_DESCRIPTION/ROOMLOOK13 | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
fi
if [ $ROOMNUMBERUP == -1 ]
then
	ROOM_DESCRIPTION/ROOMLOOKN23 | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
fi
;;
4) if [ $ROOMNUMBERUP == 0 ]
then
	 ROOM_DESCRIPTION/ROOMLOOK14 | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
fi
if [ $ROOMNUMBERUP == 1 ]
then
	ROOM_DESCRIPTION/ROOMLOOK24 | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
	echo -e "\nA wild $MONSTERNAME has appeared" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
        echo -e "\n$MONSTERNAME\nHEALTH:$MONSTERHEALTH\nATTACKPWR:$MONSTERATTACK" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
fi
if [ $ROOMNUMBERUP == 2 ]
then
	ROOM_DESCRIPTION/ROOMLOOK34 | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
fi
;;
5) if [ $ROOMNUMBERUP == 0 ]
then
	 ROOM_DESCRIPTION/ROOMLOOK15 | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
fi
if [ $ROOMNUMBERUP == -1 ]
then
	ROOM_DESCRIPTION/ROOMLOOKN25 | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
fi
;;
6) if [ $ROOMNUMBERUP == 0 ]
then
	ROOM_DESCRIPTION/ROOMLOOK16 | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
fi
if [ $ROOMNUMBERUP == 1 ]
then
	ROOM_DESCRIPTION/ROOMLOOK26 | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
	echo -e "\nA wild $MONSTERNAME has appeared" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
        echo -e "\n$MONSTERNAME\nHEALTH:$MONSTERHEALTH\nATTACKPWR:$MONSTERATTACK" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt

fi
if [ $ROOMNUMBERUP == 2 ]
then
	ROOM_DESCRIPTION/ROOMLOOK36 | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
fi
;;
7) if [ $ROOMNUMBERUP == 0 ]
then
	ROOM_DESCRIPTION/ROOMLOOK17 | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
fi
if [ $ROOMNUMBERUP == -1 ]
then
	ROOM_DESCRIPTION/ROOMLOOKN27 | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
	echo -e "\nA wild $MONSTERNAME has appeared" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
        echo -e "\n$MONSTERNAME\nHEALTH:$MONSTERHEALTH\nATTACKPWR:$MONSTERATTACK" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
fi
if [ $ROOMNUMBERUP == -2 ]
then
	ROOM_DESCRIPTION/ROOMLOOKN37 | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
fi
;;
8) if [ $ROOMNUMBERUP == 0 ]
then
 	ROOM_DESCRIPTION/ROOMLOOK18 | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
fi
;;
9) if [ $ROOMNUMBERUP == 0 ]
then
	ROOM_DESCRIPTION/ROOMLOOK19 | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
fi
if [ $ROOMNUMBERUP == 1 ]
then
	ROOM_DESCRIPTION/ROOMLOOK29 | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
fi
if [ $ROOMNUMBERUP == 2 ]
then
	ROOM_DESCRIPTION/ROOMLOOK39 | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
fi
;;
10) if [ $ROOMNUMBERUP == 0 ]
then
	ROOM_DESCRIPTION/ROOMLOOK111 | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
	echo -e "A wild $MONSTERNAME has appeared!" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
	echo -e "\n$MONSTERNAME\nHEALTH:$MONSTERHEALTH\nATTACKPWR:$MONSTERATTACK" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
fi
;;
esac
esac

case $INPUT in
"Attack"|"attack") case $ROOMNUMBER in
1) if [ $ROOMNUMBERUP == 0 ]
then
	echo "You attacked the floor and a whole lot of nothing appears." | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
fi
if [ $ROOMNUMBERUP == 1 ]
then
	echo "You attack the chest with your $WEAPON" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
fi
;;
2) if [ $ROOMNUMBERUP == 0 ]
then
	echo "You attacked $MONSTERNAME" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
	let MONSTERHEALTH=$MONSTERHEALTH-$PLAYERATTACK
	echo -e "\n$MONSTERNAME \nHEALTH:$MONSTERHEALTH" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
	sleep 2
	if [ $MONSTERHEALTH == $DEADHEALTH ] || [ $MONSTERHEALTH -lt $DEADHEALTH ]
	then
	MONSTERA="DEAD"
	echo "You killed $MONSTERNAME !" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
	elif [ $MONSTERHEALTH > 0 ]
	then
	MONSTERA="NOTDEAD"
	fi
	if [ $MONSTERA == "NOTDEAD" ]
        then
		 echo -e "\n$MONSTERNAME attacked you!" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
                        case $ARMOR in
                "NONE") let HEALTH=$HEALTH-$MONSTERATTACK;;
                "BRONZE_ARMOR") let PLAYERDEFENCE=$PLAYERDEFENCE-$MONSTERATTACK;;
                "STEEL_ARMOR") let PLAYERDEFENCE=$PLAYERDEFENCE-$MONSTERATTACK;;
                "GOLD_ARMOR") let PLAYERDEFENCE=$PLAYERDEFENCE-$MONSTERATTACK;;
                        esac
                sleep 1
                echo -e "\nHEALTH:$HEALTH" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
		echo -e "\nPLAYERDEFENCE:$PLAYERDEFENCE" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
        fi
fi
if [ $ROOMNUMBERUP == 1 ]
then
	echo "Attacking doesn't do anything here." | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
fi
if [ $ROOMNUMBERUP == -1 ]
then
	echo "Attacking doesn't do anything here." | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
fi
;;
3) if [ $ROOMNUMBERUP == 0 ]
	then
		echo "Attacking doesn't do anything here." | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
	fi
if [ $ROOMNUMBERUP == -1 ]
	then
		if [ $PLAYERTRAPPED == "true" ]
		then
		echo "You attempt to use your $WEAPON to escape. But it failed" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
		fi
		if [ $PLAYERTRAPPED !="true" ]
		then
		echo "You attack at absolutley nothing" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
		fi
	fi;;
4) if [ $ROOMNUMBERUP == 0 ]
	then
	echo "You attack at absolutely nothing." | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
	fi 
if [ $ROOMNUMBERUP == 1 ]
	then
	echo "You attacked $MONSTERNAME" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
        let MONSTERHEALTH=$MONSTERHEALTH-$PLAYERATTACK
        echo -e "\n$MONSTERNAME \nHEALTH:$MONSTERHEALTH" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
	       sleep 2
        if [ $MONSTERHEALTH == 0 ] || [ $MONSTERHEALTH -lt 0 ]
        then
	MONSTERB="DEAD"
        echo "You killed $MONSTERNAME !" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
        elif [ $MONSTERHEALTH > 0 ]
        then
        MONSTERB="NOTDEAD"
        fi
	if [ $MONSTERB == "NOTDEAD" ]
        then
		 echo -e "\n$MONSTERNAME attacked you!" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
                        case $ARMOR in
                "NONE") let HEALTH=$HEALTH-$MONSTERATTACK;;
                "BRONZE_ARMOR") let PLAYERDEFENCE=$PLAYERDEFENCE-$MONSTERATTACK;;
                "STEEL_ARMOR") let PLAYERDEFENCE=$PLAYERDEFENCE-$MONSTERATTACK;;
                "GOLD_ARMOR") let PLAYERDEFENCE=$PLAYERDEFENCE-$MONSTERATTACK;;
                        esac
                sleep 1
                echo -e "\nHEALTH:$HEALTH" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
                echo -e "\nPLAYERDEFENCE:$PLAYERDEFENCE" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
        fi
	fi
    if [ $ROOMNUMBERUP == 2 ]
	then
	echo "Attacking doesn't do anything here" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
	fi;;
5)  if [ $ROOMNUMBERUP == 0 ]
	then
	echo "Attacking doesn't do anything here." | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
	fi
if [ $ROOMNUMBERUP == -1 ]
	then
	echo "Attacking doesn't do anything here." | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
	fi
		;;
6) if [ $ROOMNUMBERUP == 0 ]
	then
		echo "You try attacking the gas but it doesn't work. RUN!" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
	fi
 if [ $ROOMNUMBERUP == 1 ]
        then
        echo "You attacked $MONSTERNAME" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
        let MONSTERHEALTH=$MONSTERHEALTH-$PLAYERATTACK
        echo -e "\n$MONSTERNAME \nHEALTH:$MONSTERHEALTH" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
               sleep 2
        if [ $MONSTERHEALTH == $DEADHEALTH ] || [ $MONSTERHEALTH -lt $DEADHEALTH ]
        then
	MONSTERD="DEAD"
        echo "You killed $MONSTERNAME !" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
        elif [ $MONSTERHEALTH > 0 ]
        then
        MONSTERD="NOTDEAD"
        fi
        if [ $MONSTERD == "NOTDEAD" ]
        then
		 echo -e "\n$MONSTERNAME attacked you!" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
                        case $ARMOR in
                "NONE") let HEALTH=$HEALTH-$MONSTERATTACK;;
                "BRONZE_ARMOR") let PLAYERDEFENCE=$PLAYERDEFENCE-$MONSTERATTACK;;
                "STEEL_ARMOR") let PLAYERDEFENCE=$PLAYERDEFENCE-$MONSTERATTACK;;
                "GOLD_ARMOR") let PLAYERDEFENCE=$PLAYERDEFENCE-$MONSTERATTACK;;
                        esac
                sleep 1
                echo -e "\nHEALTH:$HEALTH" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
                echo -e "\nPLAYERDEFENCE:$PLAYERDEFENCE" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
        fi
        fi
    if [ $ROOMNUMBERUP == 2 ]
	then
		echo "Attacking doesn't do anything here." | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
	fi;;
7) if [ $ROOMNUMBERUP == 0 ]
	then
		echo "Attacking doesn't do anything here." | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
	fi
if [ $ROOMNUMBERUP == -1 ]
	then
	echo "You attacked $MONSTERNAME" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
        let MONSTERHEALTH=$MONSTERHEALTH-$PLAYERATTACK
        echo -e "\n$MONSTERNAME \nHEALTH:$MONSTERHEALTH" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
	       sleep 2
        if [ $MONSTERHEALTH == $DEADHEALTH ] || [ $MONSTERHEALTH -lt $DEADHEALTH ]
	then
	MONSTERC="DEAD"
        echo "You killed $MONSTERNAME !" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
        elif [ $MONSTERHEALTH > 0 ]
        then
        MONSTERC="NOTDEAD"
        fi
	if [ $MONSTERC == "NOTDEAD" ]
        then
		 echo -e "\n$MONSTERNAME attacked you!" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
                        case $ARMOR in
                "NONE") let HEALTH=$HEALTH-$MONSTERATTACK;;
                "BRONZE_ARMOR") let PLAYERDEFENCE=$PLAYERDEFENCE-$MONSTERATTACK;;
                "STEEL_ARMOR") let PLAYERDEFENCE=$PLAYERDEFENCE-$MONSTERATTACK;;
                "GOLD_ARMOR") let PLAYERDEFENCE=$PLAYERDEFENCE-$MONSTERATTACK;;
                        esac
                sleep 1
                echo -e "\nHEALTH:$HEALTH" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt 
                echo -e "\nPLAYERDEFENCE:$PLAYERDEFENCE" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
        fi
	fi
    if [ $ROOMNUMBERUP == -2 ]
	then
		echo "Attacking doesn't do anything here." | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
	fi
;;
8) echo "Attacking doesn't do anything here." | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt;;
9) if [ $ROOMNUMBERUP == 1 ] 
	then
		if [ $PLAYERTRAPPED == "true" ]
		then
		echo "You attempt to use your $WEAPON to free yourself." | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
		case $WEAPON in
		"SWORD") echo "The $WEAPON works!"; PLAYERTRAPPED="false" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt;;
		"MACE") echo "The $WEAPON works!"; PLAYERTRAPPED="false" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt;;
		"RUBBERDUCK") echo "The $WEAPON does not work...!" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt;;
		"HAND") echo "Your $WEAPON does not help you get out" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt;;
		esac
		fi
	fi
    if [ $ROOMNUMBERUP == 2 ]
	then
		echo "Attacking doesn't do anything here." | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
	fi;;
10) if [ $ROOMNUMBERUP == 0 ]
	then
	echo "You attacked $MONSTERNAME" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
        let MONSTERHEALTH=$MONSTERHEALTH-$PLAYERATTACK
        echo -e "\n$MONSTERNAME \nHEALTH:$MONSTERHEALTH" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
               sleep 2
        if [ $MONSTERHEALTH == 0 ] || [ $MONSTERHEALTH -lt 0 ]
        then
	MONSTERE="DEAD"
        echo "You killed $MONSTERNAME !" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
        elif [ $MONSTERHEALTH > 0 ]
        then
        MONSTERE="NOTDEAD"
        fi
	if [ $MONSTERE == "NOTDEAD" ]
	then
                echo -e "\n$MONSTERNAME attacked you!" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
			case $ARMOR in
		"NONE") let HEALTH=$HEALTH-$MONSTERATTACK;;
		"BRONZE_ARMOR") let PLAYERDEFENCE=$PLAYERDEFENCE-$MONSTERATTACK;;
		"STEEL_ARMOR") let PLAYERDEFENCE=$PLAYERDEFENCE-$MONSTERATTACK;;
		"GOLD_ARMOR") let PLAYERDEFENCE=$PLAYERDEFENCE-$MONSTERATTACK;;
                	esac
		sleep 1
                echo -e "\nHEALTH:$HEALTH" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
		echo -e "\nPLAYERDEFENCE:$PLAYERDEFENCE" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
	fi
	fi;;
esac 
esac

if [ $PLAYERDEFENCE == 0 ] || [ $PLAYERDEFENCE -lt 0 ]
then
	ARMOR="NONE"
fi

if [ $HEALTH == 0 ] || [ $HEALTH -lt 0 ]
then
	echo "You died and lost everything! Retry?" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
	read RETRY
	if [ $RETRY == "y" ] || [ $RETRY == "yes" ] || [ $RETRY == "Yes" ]
	then
	sh n01063455_dungeon.sh
	elif [ $RETRY == "n" ] || [ $RETRY == "no" ] || [ $RETRY == "No" ]
	then
	sleep 2
	exit
	fi
fi
case $INPUT in
"Magic"|"magic") case $ROOMNUMBER in
1) if [ $ROOMNUMBERUP == 0 ]
then
	echo "Magic dust flies off your hands into the air." | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
fi
if [ $ROOMNUMBERUP == 1 ]
then
	echo "Magic dust flies off the treasure chest. So cool." | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
fi
;;
2) if [ $ROOMNUMBERUP == 0 ]
then
echo "You attacked $MONSTERNAME"  | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
        let MONSTERHEALTH=$MONSTERHEALTH-$MAGICATTACK
        echo -e "\n$MONSTERNAME \nHEALTH:$MONSTERHEALTH" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
        sleep 2
        if [ $MONSTERHEALTH == $DEADHEALTH ] || [ $MONSTERHEALTH -lt $DEADHEALTH ]
        then
        MONSTERA="DEAD"
        echo "You killed $MONSTERNAME !" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
        elif [ $MONSTERHEALTH > 0 ]
        then
        MONSTERA="NOTDEAD"
        fi
        if [ $MONSTERA == "NOTDEAD" ]
        then
                 echo -e "\n$MONSTERNAME attacked you!" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
                        case $ARMOR in
                "NONE") let HEALTH=$HEALTH-$MONSTERATTACK;;
                "BRONZE_ARMOR") let PLAYERDEFENCE=$PLAYERDEFENCE-$MONSTERATTACK;;
                "STEEL_ARMOR") let PLAYERDEFENCE=$PLAYERDEFENCE-$MONSTERATTACK;;
                "GOLD_ARMOR") let PLAYERDEFENCE=$PLAYERDEFENCE-$MONSTERATTACK;;
                        esac
                sleep 1
                echo -e "\nHEALTH:$HEALTH" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
                echo -e "\nPLAYERDEFENCE:$PLAYERDEFENCE\n" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
        fi
fi
if [ $ROOMNUMBERUP == 1 ]
then
	echo "Magic does nothing here!!" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
fi
if [ $ROOMNUMBERUP == -1 ] 
then
	echo "You used Magic on the water bottle. Now its magic water." | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
fi
;;
3) if [ $ROOMNUMBERUP == -1 ] && [ $PLAYERTRAPPED == "true" ]
	then
		echo -e "You move your hands back and forth.
	A magical blue wave of particles appears
		And lifts you up and out of the trap." | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
	PLAYERTRAPPED="false"
fi;;
4) if [ $ROOMNUMBERUP == 0 ] || [ $ROOMNUMBERUP == 2 ]
	then
		echo "You used Magic on nothing!" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
	fi 
   if [ $ROOMNUMBERUP == 1 ]
	then
	echo "You attacked $MONSTERNAME" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
        let MONSTERHEALTH=$MONSTERHEALTH-$MAGICATTACK
        echo -e "\n$MONSTERNAME \nHEALTH:$MONSTERHEALTH" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
        sleep 2
        if [ $MONSTERHEALTH == $DEADHEALTH ] || [ $MONSTERHEALTH -lt $DEADHEALTH ]
        then
        MONSTERB="DEAD"
        echo "You killed $MONSTERNAME !" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
        elif [ $MONSTERHEALTH > 0 ]
        then
        MONSTERB="NOTDEAD"
        fi
        if [ $MONSTERB == "NOTDEAD" ]
        then
                 echo -e "\n$MONSTERNAME attacked you!" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
                        case $ARMOR in
                "NONE") let HEALTH=$HEALTH-$MONSTERATTACK;;
                "BRONZE_ARMOR") let PLAYERDEFENCE=$PLAYERDEFENCE-$MONSTERATTACK;;
                "STEEL_ARMOR") let PLAYERDEFENCE=$PLAYERDEFENCE-$MONSTERATTACK;;
                "GOLD_ARMOR") let PLAYERDEFENCE=$PLAYERDEFENCE-$MONSTERATTACK;;
                        esac
                sleep 1
                echo -e "\nHEALTH:$HEALTH" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
                echo -e "\nPLAYERDEFENCE:$PLAYERDEFENCE\n" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
        fi
fi;;
5) if [ $ROOMNUMBER = 0 ]
	then
		echo "Magic does nothing here!" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
	fi;;
6) if [ $ROOMNUMBERUP == 1 ]
then
echo "You attacked $MONSTERNAME" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
        let MONSTERHEALTH=$MONSTERHEALTH-$MAGICATTACK
        echo -e "\n$MONSTERNAME \nHEALTH:$MONSTERHEALTH" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
        sleep 2
        if [ $MONSTERHEALTH == $DEADHEALTH ] || [ $MONSTERHEALTH -lt $DEADHEALTH ]
        then
        MONSTERD="DEAD"
        echo "You killed $MONSTERNAME !" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
        elif [ $MONSTERHEALTH > 0 ]
        then
        MONSTERD="NOTDEAD"
        fi
        if [ $MONSTERD == "NOTDEAD" ]
        then
                 echo -e "\n$MONSTERNAME attacked you!" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
                        case $ARMOR in
                "NONE") let HEALTH=$HEALTH-$MONSTERATTACK;;
                "BRONZE_ARMOR") let PLAYERDEFENCE=$PLAYERDEFENCE-$MONSTERATTACK;;
                "STEEL_ARMOR") let PLAYERDEFENCE=$PLAYERDEFENCE-$MONSTERATTACK;;
                "GOLD_ARMOR") let PLAYERDEFENCE=$PLAYERDEFENCE-$MONSTERATTACK;;
                        esac
                sleep 1
                echo -e "\nHEALTH:$HEALTH" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
                echo -e "\nPLAYERDEFENCE:$PLAYERDEFENCE\n" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
        fi
	if [ $ROOMNUMBERUP == 2 ]
	then
		echo "Magic does nothing here" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
	fi
fi;;
7) if [ $ROOMNUMBERUP == -1 ]
then
echo "You attacked $MONSTERNAME" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
        let MONSTERHEALTH=$MONSTERHEALTH-$MAGICATTACK
        echo -e "\n$MONSTERNAME \nHEALTH:$MONSTERHEALTH" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
        sleep 2
        if [ $MONSTERHEALTH == $DEADHEALTH ] || [ $MONSTERHEALTH -lt $DEADHEALTH ]
        then
        MONSTERC="DEAD"
        echo "You killed $MONSTERNAME !" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
        elif [ $MONSTERHEALTH > 0 ]
        then
        MONSTERC="NOTDEAD"
        fi
        if [ $MONSTERC == "NOTDEAD" ]
        then
                 echo -e "\n$MONSTERNAME attacked you!" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
                        case $ARMOR in
                "NONE") let HEALTH=$HEALTH-$MONSTERATTACK;;
                "BRONZE_ARMOR") let PLAYERDEFENCE=$PLAYERDEFENCE-$MONSTERATTACK;;
                "STEEL_ARMOR") let PLAYERDEFENCE=$PLAYERDEFENCE-$MONSTERATTACK;;
                "GOLD_ARMOR") let PLAYERDEFENCE=$PLAYERDEFENCE-$MONSTERATTACK;;
                        esac
                sleep 1
                echo - e "\nHEALTH:$HEALTH" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
                echo -e "\nPLAYERDEFENCE:$PLAYERDEFENCE\n" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
        fi
	if [ $ROOMNUMBERUP == -2 ]
	then
	echo "Magic does nothing here!" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
	fi
fi;;
8) if [ $ROOMNUMBERUP == 0 ]
	then
	echo "Magic does nothing here" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
	fi
;;
9) if [ $ROOMNUMBERUP == 1 ] && [ $PLAYERTRAPPED == "true" ]
	then
	echo -e "The wind suddenly picks up from no where.
	Dirt is rising from the floor.
		The dirt condensed into sharp shards.
			And breaks you free from the netting." | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
	PLAYERTRAPPED="false"
	fi
if [ $ROOMNUMBERUP == 2 ] 
then
	echo "Magic does nothing here" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
fi
	;;
10) if [ $ROOMNUMBERUP == 0 ]
then
echo "You attacked $MONSTERNAME" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
        let MONSTERHEALTH=$MONSTERHEALTH-$MAGICATTACK
        echo -e "\n$MONSTERNAME \nHEALTH:$MONSTERHEALTH" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
        sleep 2
        if [ $MONSTERHEALTH == $DEADHEALTH ] || [ $MONSTERHEALTH -lt $DEADHEALTH ]
        then
        MONSTERE="DEAD"
        echo "You killed $MONSTERNAME !" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
        elif [ $MONSTERHEALTH > 0 ]
        then
        MONSTERE="NOTDEAD"
        fi
        if [ $MONSTERE == "NOTDEAD" ]
        then
                 echo -e "\n$MONSTERNAME attacked you!" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
                        case $ARMOR in
                "NONE") let HEALTH=$HEALTH-$MONSTERATTACK;;
                "BRONZE_ARMOR") let PLAYERDEFENCE=$PLAYERDEFENCE-$MONSTERATTACK;;
                "STEEL_ARMOR") let PLAYERDEFENCE=$PLAYERDEFENCE-$MONSTERATTACK;;
                "GOLD_ARMOR") let PLAYERDEFENCE=$PLAYERDEFENCE-$MONSTERATTACK;;
                        esac
                sleep 1
                echo -e "\nHEALTH:$HEALTH" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
                echo -e "\nPLAYERDEFENCE:$PLAYERDEFENCE\n" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
        fi
fi;;
esac
esac


case $INPUT in
"Move"|"move") if [ $PLAYERTRAPPED == "true" ] 
	then
	echo "You are trapped and cannot move" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
	echo "($ROOMNUMBER,$ROOMNUMBERUP)"
	elif [ $PLAYERTRAPPED == "false" ]
	then
	read DIRECTION
	fi
	case $DIRECTION in
"North"|"north")
	echo "You have moved north" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
	let ROOMNUMBER=$ROOMNUMBER+1
	if [ $ROOMNUMBER == 0 ] && [ $ROOMNUMBERUP == 0 ]
	then
	let ROOMNUMBER=1
	fi
	case $ROOMNUMBER in
	0) let ROOMNUMBER=1;;
	3) if [ $ROOMNUMBERUP == 0 ]
		then
		if [ $MONSTERA == "DEAD" ]
		then
			sleep 1
		fi
		if [ $MONSTERA == "NOTDEAD" ]
		then
		let ROOMNUMBER=$ROOMNUMBER-1
		echo "A monster blocks your path! Type Look to see what it is." | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
		fi
		fi
		;;
	11)   if [ $ROOMNUMBERUP == 0 ] && [ $MONSTERE == "NOTDEAD" ]
                        then
                        let ROOMNUMBER=$ROOMNUMBER-1
                        echo "A monster blocks your path. Type Look to see what 
it is!" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
		fi
	     if [ $ROOMNUMBERUP == 0 ] && [ $PLAYERITEM != "KEY" ]
		then
			echo "You need a KEY to get passed this door" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
			let ROOMNUMBER=$ROOMNUMBER-1
		fi

	      if [ $ROOMNUMBERUP == 0 ] && [ $PLAYERITEM == "KEY" ]
		then
			echo "FREEDOM AT LAST" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
			echo “There has been a journalentry.txt file that recorded all your data!”
			sleep 3
			FREEDOM
			sleep 10
			 exit
		fi;;
	esac
	
		case $ROOMNUMBERUP in
		1) let ROOMNUMBER=$ROOMNUMBER-1
			echo "Cannot go this way" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt;;
		2) let ROOMNUMBER=$ROOMNUMBER-1
			echo "Cannot go this way" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt;;
		-1) let ROOMNUMBER=$ROOMNUMBER-1
			echo "Cannot go this way" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt;;
		-2) let ROOMNUMBER=$ROOMNUMBER-1
			echo "Cannot go this way" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt;;
		esac
	echo "($ROOMNUMBER,$ROOMNUMBERUP)";;
"East"|"east") 
	echo "You have moved east" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
	let ROOMNUMBERUP=$ROOMNUMBERUP+1
	case $ROOMNUMBER in
	1) if [ $ROOMNUMBERUP == 2 ]
		then
			let ROOMNUMBERUP=$ROOMNUMBERUP-1
			echo "Cannot go this way" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
		fi;;
	2) if [ $ROOMNUMBERUP == 2 ]
                then
                        let ROOMNUMBERUP=$ROOMNUMBERUP-1
			echo "Cannot go this way" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
                fi;;
	3) if [ $ROOMNUMBERUP == 1 ]
		then
		let ROOMNUMBERUP=$ROOMNUMBERUP-1; echo "Cannot go this way" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
		fi;;
	4) if [ $ROOMNUMBERUP == 3 ]
		then
			let ROOMNUMBERUP=$ROOMNUMBERUP-1
			echo "Cannot go this way" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
		fi
	   if [ $ROOMNUMBERUP == 2 ]
		  then
                if [ $MONSTERB == "DEAD" ]
                then
                        sleep 1
                fi
                if [ $MONSTERB == "NOTDEAD" ]
                then
                let ROOMNUMBERUP=$ROOMNUMBERUP-1
                echo "A monster blocks your path! Type Look to see what it is." | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
                fi
                fi
                ;;
	5) if [ $ROOMNUMBERUP == 1 ] 
		then
		let ROOMNUMBERUP=$ROOMNUMBERUP-1; echo "Cannot go this way" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
		fi;;
	6)  if [ $ROOMNUMBERUP == 2 ]
                  then
                if [ $MONSTERD == "DEAD" ]
                then
                        sleep 1
                fi
                if [ $MONSTERD == "NOTDEAD" ]
                then
                let ROOMNUMBERUP=$ROOMNUMBERUP-1
                echo "A monster blocks your path! Type Look to see what it is." | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
                fi
                fi
                if [ $ROOMNUMBERUP == 3 ]
		then
		let ROOMNUMBERUP=$ROOMNUMBERUP-1; echo "Cannot go this way" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
		fi;;
	7) if [ $ROOMNUMBERUP == 1 ]
		then
		let ROOMNUMBERUP=$ROOMNUMBERUP-1; echo "Cannot go this way" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
		fi;;
	8) if [ $ROOMNUMBERUP == 1 ]
		then		
		let ROOMNUMBERUP=$ROOMNUMBERUP-1; echo "Cannot go this way" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
		fi;;
	9) if [ $ROOMNUMBERUP == 2 ] && [ $PLAYERTRAPPED == "true" ]
		then
		let ROOMNUMBERUP=$ROOMNUMBERUP-1; echo "You are trapped and cannot move" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
		fi
	if [ $ROOMNUMBERUP == 3 ]  
		then
		let ROOMNUMBERUP=$ROOMNUMBERUP-1; echo "You cannot go this way" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
		fi;;
	10) if [ $ROOMNUMBERUP == 1 ]
		then
		let ROOMNUMBERUP=$ROOMNUMBERUP-1; echo "Cannot go this way" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
		fi;;
		esac
		 echo "($ROOMNUMBER,$ROOMNUMBERUP)";;
"South"|"south") echo "You have moved south" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
		if [ $ROOMNUMBER == 0 ] && [ $ROOMNUMBERUP == 0 ]
		then
		let ROOMNUMBER=1
		echo "Cannot go this way" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
		fi
		case $ROOMNUMBER in
		1) if [ $ROOMNUMBERUP == 0 ]
			then
			let ROOMNUMBER=$ROOMNUMBER+1
			echo "Cannot go this way" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
			fi
		  if [ $ROOMNUMBERUP == 1 ]
			then
			let ROOMNUMBER=$ROOMNUMBER+1
			echo "Cannot go this way" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
			fi;;
		2) if [ $ROOMNUMBERUP == -1 ] || [ $ROOMNUMBERUP == 1 ] 
                        then
                        let ROOMNUMBER=$ROOMNUMBER+1
                        echo "Cannot go this way" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
                        fi;;
		3) if [ $ROOMNUMBERUP == -1 ]
                        then
                        let ROOMNUMBER=$ROOMNUMBER+1
                        echo "Cannot go this way" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
                        fi;;
		4) if [ $ROOMNUMBERUP == 1 ] || [ $ROOMNUMBERUP == 2 ]
                        then
                        let ROOMNUMBER=$ROOMNUMBER+1
                        echo "Cannot go this way" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
                        fi;;
		5) if [ $ROOMNUMBERUP == -1 ]
                        then
                        let ROOMNUMBER=$ROOMNUMBER+1
                        echo "Cannot go this way" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
                        fi;;
		6) if [ $ROOMNUMBERUP == 1 ] || [ $ROOMNUMBERUP == 2 ]
                        then
                        let ROOMNUMBER=$ROOMNUMBER+1
                        echo "Cannot go this way" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
                        fi;;
		7) if [ $ROOMNUMBERUP == -1 ] || [ $ROOMNUMBERUP == -2 ]
                        then
                        let ROOMNUMBER=$ROOMNUMBER+1
                        echo "Cannot go this way" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
                        fi;;
		9) if [ $ROOMNUMBERUP == 1 ] || [ $ROOMNUMBERUP == 2 ]
                        then
                        let ROOMNUMBER=$ROOMNUMBER+1
                        echo "Cannot go this way" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
                        fi;;
		esac
let ROOMNUMBER=$ROOMNUMBER-1
	echo "($ROOMNUMBER,$ROOMNUMBERUP)";;
"West"|"west") echo "You have moved west" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
	let ROOMNUMBERUP=$ROOMNUMBERUP-1
	case $ROOMNUMBER in
	2) if [ $ROOMNUMBERUP == -2 ]
		then
			let ROOMNUMBERUP=$ROOMNUMBERUP+1
			echo "Cannot go this way" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
		fi;;
	3) if [ $ROOMNUMBERUP == -2 ]
		then
			let ROOMNUMBERUP=$ROOMNUMBERUP+1
			echo "Cannot go this way" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
		fi;;
	5) if [ $ROOMNUMBERUP == -2 ]
		then
			let ROOMNUMBERUP=$ROOMNUMBERUP+1
			echo "Cannot go this way" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
		fi;;
	7) if [ $ROOMNUMBERUP == -2 ] && [ $MONSTERC == "NOTDEAD" ]
		then
			let ROOMNUMBERUP=$ROOMNUMBERUP+1
			echo "A monster blocks your path. Type Look to see what it is!" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
		fi

		if [ $ROOMNUMBERUP == -3 ]
		then
			let ROOMNUMBERUP=$ROOMNUMBERUP+1
			echo "Cannot go this way" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
		fi
                ;;
	8) let ROOMNUMBERUP=$ROOMNUMBERUP+1
		echo "Cannot go this way" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt;;
	4) if [ $ROOMNUMBERUP == -1 ]
		then
		 let ROOMNUMBERUP=$ROOMNUMBERUP+1
		echo "Cannot go this way" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
		fi;;
	1) if [ $ROOMNUMBERUP == -2 ]
		then
			let ROOMNUMBERUP=$ROOMNUMBERUP+1
			echo "Cannot go this way" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
		fi;;
	6)  if [ $ROOMNUMBERUP == -1 ]
                then
                        let ROOMNUMBERUP=$ROOMNUMBERUP+1
                        echo "Cannot go this way" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
                fi;;
	9)  if [ $ROOMNUMBERUP == -1 ]
                then
                        let ROOMNUMBERUP=$ROOMNUMBERUP+1
                        echo "Cannot go this way" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
                fi;;
	10)  if [ $ROOMNUMBERUP == -1 ]
                then
                        let ROOMNUMBERUP=$ROOMNUMBERUP+1
                        echo "Cannot go this way" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt
                fi;;
	esac
echo "($ROOMNUMBER,$ROOMNUMBERUP)" | tee -a journalentry.txt ; echo -e "Recorded on: $(date) \n" >> journalentry.txt;;
esac
esac
done
