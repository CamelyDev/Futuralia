#macro FPI_MAX 10
#macro MAX_BLOCKSELECTOR 10

image_speed = 0;

fpi = FPI_MAX;

enum CURSORSTATE {
	IDLE,
	CONFIRM,
	DENY
}

curblock = undefined;
curselector = 0;
curstate = CURSORSTATE.IDLE

//root
skillname[0] = "Patience";
skillneeds[0,0] = -1;
skillowned[0] = true;

	skillname[1] = "Melee";
	skillneeds[1,0] = 0;
	skillowned[1] = false;
	
		skillname[2] = "Sword";
		skillneeds[2,0] = 1;
		skillowned[2] = false;
			
			skillname[3] = "Sword Agility";
			skillneeds[3,0] = 2;
			skillowned[3] = false;
			
				skillname[4] = "Sword Speed";
				skillneeds[4,0] = 3;
				skillowned[4] = false;
				
					skillname[5] = "Hand Skill";
					skillneeds[5,0] = 4;
					skillowned[5] = false;
					
				skillname[6] = "Sword Power";
				skillneeds[6,0] = 3;
				skillowned[6] = false;
				
				skillname[7] = "Sword Swiftness";
				skillneeds[7,0] = 3;
				skillowned[7] = false;
					
					skillname[8] = "Ultimate Sword Agility";
					skillneeds[8,0] = 5;
					skillneeds[8,1] = 6;
					skillneeds[8,2] = 7;
					skillowned[8] = false;
					
			skillname[9] = "Sword Strength";
			skillneeds[9,0] = 2;
			skillowned[9] = false;
			
				skillname[10] = "Sword Damage";
				skillneeds[10,0] = 9;
				skillowned[10] = false;
				
					skillname[11] = "Sword Hit";
					skillneeds[11,0] = 10;
					skillowned[11] = false;
					
				skillname[12] = "Sword Rate";
				skillneeds[12,0] = 9;
				skillowned[12] = false;
				
					skillname[13] = "Sword Crits";
					skillneeds[13,0] = 12;
					skillowned[13] = false;
					
						skillname[14] = "Ultimate Sword Strength";
						skillneeds[14,0] = 11;
						skillneeds[14,1] = 13;
						skillowned[14] = false;
						
							skillname[15] = "Ultimate Sword Warrior";
							skillneeds[15,0] = 8;
							skillneeds[15,1] = 14;
							skillowned[15] = false;
							
		skillname[16] = "Axe";
		skillneeds[16,0] = 1;
		skillowned[16] = false;
		
			skillname[17] = "Axe Agility";
			skillneeds[17,0] = 16;
			skillowned[17] = false;
			
				skillname[18] = "Axe Blocking";
				skillneeds[18,0] = 17;
				skillowned[18] = false;
				
					skillname[19] = "Rocky Hands";
					skillneeds[19,0] = 18;
					skillowned[19] = false;
					
				skillname[20] = "Axe Rate";
				skillneeds[20,0] = 17;
				skillowned[20] = false;
				
					skillname[21] = "Fast Biceps";
					skillneeds[21,0] = 20;
					skillowned[21] = false;
					
			skillname[22] = "Axe Strength";
			skillneeds[22,0] = 16;
			skillowned[22] = false;
			
				skillname[23] = "Axe Damage";
				skillneeds[23,0] = 22;
				skillowned[23] = false;
					
					skillname[24] = "Axe Rate";
					skillneeds[24,0] = 23;
					skillowned[24] = false;
					
				skillname[25] = "Axe Hit";
				skillneeds[25,0] = 22;
				skillowned[25] = false;
					
					skillname[26] = "Axe Crit";
					skillneeds[26,0] = 25;
					skillowned[26] = false;
					
						skillname[27] = "Ultimate Axe Warrior";
						skillneeds[27,0] = 26;
						skillneeds[27,1] = 24;
						skillneeds[27,2] = 21;
						skillneeds[27,3] = 19;
						skillowned[27] = false;
		
		skillname[28] = "Shield";
		skillneeds[28,0] = 1;
		skillowned[28] = false;
		
			skillname[29] = "Shield Blocking";
			skillneeds[29,0] = 28;
			skillowned[29] = false;
			
				skillname[30] = "Double Wielding";
				skillneeds[30,0] = 29;
				skillowned[30] = false;
				
					skillname[31] = "Legendary Axe Knight";
					skillneeds[31,0] = 27;
					skillneeds[31,1] = 30;
					skillowned[31] = false;
					
					skillname[32] = "Legendary Sword Knight";
					skillneeds[32,0] = 15;
					skillneeds[32,1] = 30;
					skillowned[32] = false;
					
						skillname[33] = "Mythical King";
						skillneeds[33,0] = 32;
						skillneeds[33,1] = 31;
						skillowned[33] = false;