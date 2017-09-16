_Ratio1 = 1;
_Ratio2 = 2;
_Ratio3 = 3;
_Ratio4 = 4;
_Ratio5 = 5;
if (MaxVehicleLimit > 300) then {
	_Ratio1 = round(MaxVehicleLimit * 0.006);
	_Ratio2 = round(MaxVehicleLimit * 0.007);
	_Ratio3 = round(MaxVehicleLimit * 0.008);
	_Ratio4 = round(MaxVehicleLimit * 0.004);
	_Ratio5 = round(MaxVehicleLimit * 0.005);
};
RidingVehicleList = [
	["ATV_CZ_EP1",_Ratio3],							//Quad all-terrain vehicle
	["ATV_US_EP1",_Ratio3],							//Quad all-terrain vehicle
	["BAF_ATV_D",_Ratio1],							//Quad all-terrain vehicle
	["BAF_ATV_W",_Ratio1],							//Quad all-terrain vehicle
	["M1030_US_DES_EP1",_Ratio3],					//light Green Off road Motorbike
	["MMT_Civ",(_Ratio3 * 2)],						//mountain bike
	["MMT_USMC",(_Ratio3 * 2)],						//US army mountain bike
	["Old_bike_TK_INS_EP1",_Ratio3],				//Bicycle Tourer
	["Old_bike_TK_CIV_EP1",_Ratio3],				//Old 125cc motorbike
	["TT650_Civ",_Ratio3],							//650cc off road motor bike white, red seat
	["TT650_Ins",_Ratio3],							//650cc off road motor bike Red and orange
	["TT650_TK_CIV_EP1",_Ratio3]					//650cc off road motor bike Orange Tank, beat up
];
CarVehicleList = [
	["ArmoredSUV_PMC_DZE",_Ratio1],					//Armored SUV with Minigun turret
	["BAF_Offroad_W",_Ratio3],						//LandRover
	["BTR40_MG_TK_GUE_EP1",_Ratio4],				//BTR-40 open top DshKM, the heavy anti-aircraft machine gun
	["BTR40_TK_GUE_EP1",_Ratio4],					//BTR-40 open top DshKM
	["car_hatchback",_Ratio3],						//Old Yellow Datsun Hatchback
	["car_sedan",_Ratio3],							//old white Sedan car
	["datsun1_civil_1_open_DZE",_Ratio3],			//old blue Datsun pickup truck open back
	["datsun1_civil_2_covered_DZE",_Ratio3],		//Datsun pickup truck covered back Yellow and brown
	["datsun1_civil_3_open_DZE",_Ratio3],			//old Greenish Datsun pickup truck open back
	["GAZ_Vodnik_HMG",_Ratio4],						//Vodnik amphibious heavy machine gun
	["GAZ_Vodnik_DZE",_Ratio1],						//Vodnik amphibious dual PK 7.62 mm machine gun
	["GAZ_Vodnik_MedEvac",_Ratio1],					//Vodnik amphibious Ambulance
	["GLT_M300_LT",_Ratio3],						//Lada Taxi yellow and white
	["GLT_M300_ST",_Ratio3],						//Sedan Taxi yellow and white
	["hilux1_civil_1_open_DZE",_Ratio3],			//Hilux brown open Pickup Truck
	["hilux1_civil_2_covered_DZE",_Ratio3],			//Hilux red covered Pickup Truck
	["hilux1_civil_3_open_DZE",_Ratio3],			//Hilux white open Pickup Truck
	["HMMWV_Ambulance",_Ratio1],					//Hummer Ambulance
	["HMMWV_Ambulance_CZ_DES_EP1",_Ratio1],			//Hummer Ambulance Desert
	["HMMWV_DES_EP1",_Ratio3],						//Hummer Desert
	["HMMWV_DZ",_Ratio3],							//Hummer
	["HMMWV_M1035_DES_EP1",_Ratio1],				//Hummer Desert Utility
	["HMMWV_M1151_M2_CZ_DES_EP1_DZE",_Ratio1],		//Turreted Hummer 50cal M2 machine gun Desert Cam
	["HMMWV_M998A2_SOV_DES_EP1_DZE",_Ratio1],		//Hummer Desert open top mg
	["HMMWV_Armored",_Ratio4],						//Armoured Hummer M240 LMG
	["HMMWV_Avenger",_Ratio4],						//Hummer FIM-92 Stinger, surface-to-air missile homing system
	["Lada1",_Ratio3],								//Lada Riva 1500 Blueish white family car
	["Lada1_TK_CIV_EP1",_Ratio3],					//Lada Riva 1500 old Green and rusty family car
	["Lada2",_Ratio3],								//Lada Riva 1500 Red family car
	["Lada2_TK_CIV_EP1",_Ratio3],					//Lada Riva 1500 Green and Arab patterns family car
	["LadaLM",_Ratio3],								//Lada Riva 1500 Orange and white Soviet militia Car
	["LandRover_CZ_EP1",_Ratio3],					//LandRover Brown Soft top
	["LandRover_MG_TK_EP1_DZE",_Ratio1],			//Landrover green tan open with mounted mg
	["LandRover_Special_CZ_EP1_DZE",_Ratio1],		//Landrover safari edition
	["LandRover_TK_CIV_EP1",_Ratio3],				//LandRover Brown Soft top
	["Offroad_DSHKM_Gue_DZE",_Ratio3],				//Hilux pickup armed DShKM
	["Offroad_SPG9_Gue",_Ratio1],					//Hilux pickup armed SPG-9 Recoilless Rife
	["Pickup_PK_GUE_DZE",_Ratio3],					//Datsun Pickup Truck PKT LMG
	["Pickup_PK_INS_DZE",_Ratio3],					//Datsun Pickup Truck PKT LMG
	["Pickup_PK_TK_GUE_EP1_DZE",_Ratio3],			//Datsun Pickup Truck PKT LMG
	["policecar",_Ratio2],							//Police Car
	["S1203_ambulance_EP1",_Ratio3],				//koda 1203 Mini Van Ambulance
	["S1203_TK_CIV_EP1",_Ratio3],					//koda 1203 Blue Mini Van
	["Skoda",_Ratio3],								//Skoda White Car
	["SkodaBlue",_Ratio3],							//Skoda Blue and primer Car
	["SkodaGreen",_Ratio3],							//Skoda Green Car
	["SkodaRed",_Ratio3],							//Skoda Red Car
	["SUV_Blue",_Ratio1],							//SUV Blue
	["SUV_Camo",_Ratio1],							//SUV Camo
	["SUV_Charcoal",_Ratio1],						//SUV Grey
	["SUV_Green",_Ratio1],							//SUV Green
	["SUV_Orange",_Ratio1],							//SUV Orange
	["SUV_Pink",_Ratio1],							//SUV Pink
	["SUV_Red",_Ratio1],							//SUV Red
	["SUV_Silver",_Ratio1],							//SUV Silver
	["SUV_TK_CIV_EP1",_Ratio1],						//SUV Black
	["SUV_White",_Ratio1],							//SUV White
	["SUV_Yellow",_Ratio1],							//SUV Yellow
	["UAZ_CDF",_Ratio3],							//UAZ-469 offroad Canvas Cover
	["UAZ_INS",_Ratio3],							//UAZ-469 offroad Canvas Cover
	["UAZ_MG_TK_EP1_DZE",_Ratio3],					//UAZ-469 offroad Beige with mounted mg and open top
	["UAZ_RU",_Ratio3],								//UAZ-469 offroad Canvas Cover
	["UAZ_Unarmed_TK_CIV_EP1",_Ratio3],				//UAZ-469 offroad Beige with black Canvas Cover
	["UAZ_Unarmed_TK_EP1",_Ratio3],					//UAZ-469 offroad Beige with black Canvas Cover
	["UAZ_Unarmed_UN_EP1",_Ratio3],					//UAZ-469 offroad White UN Canvas Cover
	["UAZ_SPG9_INS",_Ratio4],						//UAZ-469 offroad Canvas Cover anti-tank recoilless rifle
	["VolhaLimo_TK_CIV_EP1",_Ratio3],				//Voloha GAZ-24 Car Black limo
	["Volha_1_TK_CIV_EP1",_Ratio3],					//Voloha GAZ-24 Car rusty and light Blue
	["Volha_2_TK_CIV_EP1",_Ratio3],					//Voloha GAZ-24 Car rusty and white-ish
	["VWGolf",_Ratio3]								//Volkwagon Golf Hatch back red
];
TruckVehicleList = [
	["GRAD_CDF",_Ratio4],							//BM-21 Grad truck-based 122 mm multiple-launch rocket system
	["Ikarus",_Ratio3],								//Single deck Blue Coach Bus
	["Ikarus_TK_CIV_EP1",_Ratio3],					//Single deck red strip Coach Bus
	["Kamaz_DZE",_Ratio3],							//Flat fronted Covered 6x6 cargo truck
	["KamazOpen_DZE",_Ratio3],						//Flat fronted Open top 6x6 cargo truck
	["KamazRefuel_DZ",_Ratio1],						//Flat fronted Refueling 6x6 cargo truck
	["KamazReammo",_Ratio1],						//Flat fronted Covered Ammo 6x6 cargo truck
	["KamazRepair",_Ratio1],						//Flat fronted Repair 6x6 cargo truck
	["MTVR",_Ratio3],								//MTVR 6x6 all-terrain vehicle
	["MtvrReammo",_Ratio3],							//MTVR 6x6 Re Ammo all-terrain vehicle
	["MtvrRefuel_DZ",_Ratio3],						//MTVR 6x6 Re Fuel all-terrain vehicle
	["MtvrRefuel_DES_EP1_DZ",_Ratio1],				//MTVR 6x6 Re Fuel all-terrain vehicle desert
	["MTVR_DES_EP1",_Ratio3],						//MTVR 6x6 all-terrain vehicle desert
	["MtvrRepair",_Ratio3],							//MTVR 6x6 Repair all-terrain vehicle
	["TowingTractor",_Ratio1],						//Aircraft towing Vehicle
	["tractor",_Ratio3],							//Agricultural tractor
	["tractorOld",_Ratio3],							//Old Agricultural tractor
	["UralRefuel_TK_EP1_DZ",_Ratio1],				//Ural 375 Russian 6x6 Refuel truck
	["Ural_CDF",_Ratio3],							//Ural 375 Russian 6x6 cargo truck with canvas top	
	["UralOpen_CDF",_Ratio3],						//Ural 375 Russian 6x6 cargo truck open top
	["UralReammo_CDF",_Ratio1],						//Ural 375 Russian 6x6 Ammo truck
	["UralRefuel_CDF",_Ratio1],						//Ural 375 Russian 6x6 Refuel truck
	["UralRepair_CDF",_Ratio1],						//Ural 375 Russian 6x6 Repair truck
	["Ural_INS",_Ratio1],							//Ural 375 Russian 6x6 cargo truck with canvas top
	["UralReammo_INS",_Ratio1],						//Ural 375 Russian 6x6 Ammo truck
	["UralRefuel_INS",_Ratio1],						//Ural 375 Russian 6x6 Refuel truck
	["UralRepair_INS",_Ratio1],						//Ural 375 Russian 6x6 Repair truck
	["Ural_TK_CIV_EP1",_Ratio3],					//Ural 375 Russian 6x6 Cargo truck Light Blue with white canvas cover
	["Ural_UN_EP1",_Ratio3],						//Ural 375 Russian 6x6 Cargo truck White UN
	["Ural_ZU23_CDF",_Ratio4],						//Ural 375 Russian 6x6 truck ZU-23-2 23 mm twin-barreled autocannon
	["V3S_Open_TK_CIV_EP1",_Ratio3],				//V3S Czechoslovakian 6x6 truck open top
	["V3S_Open_TK_EP1",_Ratio3],					//V3S Czechoslovakian 6x6 truck open top Yellow
	["V3S_Reammo_TK_GUE_EP1",_Ratio3],				//V3S Czechoslovakian 6x6 truck Re Ammo
	["V3S_Refuel_TK_GUE_EP1_DZ",_Ratio1]			//V3S Czechoslovakian 6x6 truck Refuel
];
APCVehicleList = [
	["BAF_Jackal2_GMG_W",_Ratio5],					//Jackal 2 HMG
	["BAF_Jackal2_L2A1_W",_Ratio5],					//Jackal 2 Grenade
	["BMP3",_Ratio5],								//Soviet amphibious infantry fighting vehicle
	["BRDM2_ATGM_CDF",_Ratio4],						//BRDM-2 amphibious reconnaissance vehicle AT5Launcher
	["BRDM2_ATGM_INS",_Ratio4],						//BRDM-2 amphibious reconnaissance vehicle AT5Launcher
	["BRDM2_CDF",_Ratio4],							//BRDM-2 amphibious reconnaissance vehicle 14.5mm KPV heavy machine gun with a 7.62mm machine gun
	["BRDM2_GUE",_Ratio4],							//BRDM-2 amphibious reconnaissance vehicle 14.5mm KPV heavy machine gun with a 7.62mm machine gun
	["BRDM2_HQ_GUE",_Ratio4],						//BRDM-2 amphibious reconnaissance vehicle PKT LMG
	["BRDM2_HQ_TK_GUE_EP1",_Ratio4],				//BRDM-2 amphibious reconnaissance vehicle PKT LMG
	["BTR90",_Ratio4],								//BTR-90 8 Wheel 30 mm 2A42 auto cannon, 7.62mm PKT machine gun, AT-5 Spandrel ATGM and AGS-17 30mm grenade launcher.
	["BTR90_HQ",_Ratio4],							//BTR-90 8 Wheel PKT LMG
	["LAV25",_Ratio5],								//LAV-25 8x8 APC M242 Bushmaster 25 mm chain gun and 2x M240 7.62 mm machine guns
	["LAV25_HQ",_Ratio5],							//LAV-25 8x8 APC M240 7.62 mm machine gun
	["M1126_ICV_M2_EP1",_Ratio5],					//Stryker CROWS 50 cal M2 machine-gun Desert Cam
	["M1128_MGS_EP1",_Ratio5],						//Stryker M68 105mm Cannon and 50 cal M2 machinegun Desert Cam
	["M1130_CV_EP1",_Ratio5],						//Stryker CROWS 50 cal M2 machine-gun Desert Cam
	["M1133_MEV_EP1",_Ratio5]						//Stryker Ambulance Desert Cam
];
TankVehicleList = [
	["2S6M_Tunguska",_Ratio4],						//Russian self-propelled anti-aircraft tracked vehicle
	["AAV",_Ratio4],								//Amphibious Assault Vehicle Tracked
	["BAF_FV510_W",_Ratio4],						//Warrior Tracked APC
	["BMP2_Ambul_CDF",_Ratio2],						//BMP-2 Tracked amphibious Ambulance
	["BMP2_Ambul_INS",_Ratio2],						//BMP-2 Tracked amphibious Ambulance
	["BMP2_CDF",_Ratio4],							//BMP-2 Tracked amphibious vehicle
	["BMP2_INS",_Ratio4],							//BMP-2 Tracked amphibious vehicle
	["BMP2_GUE",_Ratio4],							//BMP-2 Tracked amphibious vehicle
	["BMP2_HQ_CDF",_Ratio4],						//BMP-2 Tracked amphibious vehicle comm
	["BMP2_HQ_INS",_Ratio4],						//BMP-2 Tracked amphibious vehicle comm
	["M6_EP1",_Ratio4],								//M6 Linebacker M242 Chain Gun Stinger missile system
	["M1A1",_Ratio4],								//M1A1 Abrams Tank
	["M1A2_TUSK_MG",_Ratio4],						//M1A1 Abrams Tank TUSK Tank Urban Survival Kit
	["MLRS",_Ratio4],								//M270 Tracked Multiple Launch Rocket System
	["T34_TK_GUE_EP1",_Ratio4],						//T-34 WWII Russian Tank 85mm cannon and two 7.62mm machineguns
	["T55_TK_GUE_EP1",_Ratio4],						//T-55 Russian tank 100mm Cannon and 7.62mm machinegun
	["T72_CDF",_Ratio4],							//T-72 Russian tank 125mm Cannon ,DSHKM and 7.62mm machinegun
	["T72_INS",_Ratio4],							//T-72 Russian tank 125mm Cannon ,DSHKM and 7.62mm machinegun
	["T72_GUE",_Ratio4],							//T-72 Russian tank 125mm Cannon ,DSHKM and 7.62mm machinegun
	["T72_RU",_Ratio4],								//T-72 Russian tank 125mm Cannon ,DSHKM and 7.62mm machinegun
	["T90",_Ratio4]									//T-90 Russian tank 125mm AT gun, PKT 7.62 mm machine gun and Kord - 12.7 mm machine gun
];
FixedWingVehicleList = [
	["A10_US_EP1",_Ratio4],							//A-10 Thunderbolt jet aircraft
	["AN2_DZ",_Ratio1], 							//Antonov An-2 Soviet biplane Green
	["AN2_2_DZ",_Ratio1], 							//Red and white
	["An2_1_TK_CIV_EP1",_Ratio1],					//Antonov An-2 Soviet biplane Red and White
	["An2_2_TK_CIV_EP1_DZ",_Ratio1], 				//Green and white
	["AV8B",_Ratio4],								//AV-8B Harrier
	["AV8B2",_Ratio4],								//AV-8B Harrier
	["C130J_US_EP1_DZ",_Ratio1],					//C-130J Super Hercules
	["F35B",_Ratio4],								//F-35 Lightning Strike STOVL fighter
	["GNT_C185_DZ",_Ratio1],						//Cessna 185 Skywagon light aircraft
	["GNT_C185C_DZ",_Ratio1],						//Cessna 185 Skywagon light aircraft
	["GNT_C185R_DZ",_Ratio1],						//Cessna 185 Skywagon light aircraft
	["GNT_C185U_DZ",_Ratio1],						//Cessna 185 Skywagon light aircraft
	["L39_TK_EP1",_Ratio4],							//Aero L-39 Albatros GS-23L 23mm twin barrel automated cannon and S-5 unguided missile
	["MV22_DZ",_Ratio1],							//V-22 Osprey multi-mission tilt-rotor
	["Su25_TK_EP1",_Ratio4],						//Su-25 Frogfoot Russian single-seat twin-engine jet aircraft
	["su34",_Ratio4],								//Su-34 Fullback Russian two-seat fighter-bomber
	["su39",_Ratio4]								//Su-39 Frogfoot Russian single-seat twin-engine jet
];
RotaryVehicleList = [
	["AH1Z",_Ratio4],								//AH-1Z Super Cobra attack helicopter
	["AH64D_EP1",_Ratio4],							//AH-64 Apache attack helicopter
	["AH64D_Sidewinders",_Ratio4],					//AH-64 Apache attack helicopter with sidewinder missiles
	["AH6J_EP1_DZ",_Ratio4],							//MH-6 Little Bird Black 2x M134 Minigun
	["AH6X_DZ",_Ratio3],							//MH-6 Little Bird
	["AW159_Lynx_BAF",_Ratio4],						//AH-11 Wildcat
	["BAF_Merlin_HC3_D",_Ratio4],					//Merlin HC3
	["CH_47F_EP1_DZE",_Ratio1],						//CH-47 Chinook Dual rotor
	["CH53_DZE",_Ratio1],							//USEC CH53 Super Stallion
	["CSJ_GyroC",_Ratio3],							//Gyrocopter open
	["CSJ_GyroCover",_Ratio3],						//Gyrocopter closed
	["CSJ_GyroP",_Ratio3],							//Gyrocopter
	["Ka52Black",_Ratio4],							//Kamov Ka-52 Alligator Hokum B attack helicopter
	["Ka60_GL_PMC",_Ratio4],						//Kamov Ka-60 Orca helicopter with grenade launcher
	["MH6J_DZ",_Ratio3],							//MH-6 Little Bird Black with side benches
	["MH60S_DZE",_Ratio4],								//Knighthawk US Navy blackhawk
	["Mi17_Civilian_DZ",_Ratio3],					//Mi-17 Hip-H Civilian helicopter White with blue trim
	["Mi17_DZE",_Ratio3],							//Mi-17 Hip-H Civilian helicopter White with blue trim
	["Mi17_medevac_CDF",_Ratio1],					//Mi-17 Hip-H MediVac helicopter
	["Mi17_TK_EP1",_Ratio4],						//Mi-17 Hip-H multirole helicopter PKT 7.62 Machine guns
	["Mi24_D",_Ratio4],								//Mi-24 Hind Russian helicopter gunship
	["Mi24_V",_Ratio4],								//Mi-24 Hind Russian helicopter gunship
	["pook_H13_medevac",_Ratio2],					//MH-13E Medevac West - USMC
	["UH1H_DZE",_Ratio2],							//Bell UH-1 Iroquois Huey 2x m240 LMG
	["UH1Y_DZE",_Ratio2],							//UH-1Y Venom Mk66 70 mm rocket stations and two M240D 7.62 mm machine guns
	["UH60M_EP1_DZE",_Ratio1],						//Blackhawk 2x M134 Minigun
	["UH60M_MEV_EP1",_Ratio4]						//Blackhawk MediVac Chopper
];
WaterVehicleList = [
	["Fishing_Boat",_Ratio3],					//Fishing Boat
	["JetSkiYanahui_Case_Blue",_Ratio1],		//blue Jetski
	["JetSkiYanahui_Case_Green",_Ratio1],		//Green Jetski
	["JetSkiYanahui_Case_Red",_Ratio1],			//Red Jetski
	["JetSkiYanahui_Case_Yellow",_Ratio1],		//Yellow Jetski
	["PBX",_Ratio3],							//PBX Combat Rubber boat
	["RHIB",_Ratio3],							//Rigid Hull Inflatable Boat 50 Cal M2 Machine gun
	["Smallboat_1",_Ratio3],					//Small private motorboat Red Hull Covered Deck
	["Smallboat_2",_Ratio3],					//Small private motorboat Blue Hull
	["Zodiac",_Ratio3]							//Combat Rubber Reconnaissance Craft CRRC  
];
AircraftVehicleList = FixedWingVehicleList + RotaryVehicleList;
LandVehicleList =  RidingVehicleList + CarVehicleList + TruckVehicleList + APCVehicleList + TankVehicleList;
AllowedVehiclesList = AircraftVehicleList + LandVehicleList;	

	
/*TurretVehicleList = [
	["M2StaticMG", 1],
	["M119", 1],
	["DSHKM_Ins", 1],
	["DSHKM_CDF", 1],
	["DSHKM_Gue", 1],
	["AGS_Ins", 1],									//automatic grenade launcher
	["AGS_CDF", 1],									//automatic grenade launcher
	["AGS_RU", 1],									//automatic grenade launcher
	["D30_Ins", 1],
	["D30_CDF", 1],
	["D30_RU", 1],
	["SearchLight", 1],
	["SearchLight_INS", 1],
	["SearchLight_CDF", 1],
	["SearchLight_RUS", 1],
	["SearchLight_Gue", 1],
	["M252", 1],
	["Metis", 1],
	["2b14_82mm", 1],
	["2b14_82mm_CDF", 1],
	["2b14_82mm_INS", 1],
	["2b14_82mm_GUE", 1],
	["SPG9_Gue", 1],
	["SPG9_CDF", 1],
	["SPG9_Ins", 1],
	["ZU23_Ins", 1],
	["ZU23_CDF", 1],
	["ZU23_Gue", 1],
	["KORD", 1],
	["KORD_high", 1],
	["USMC_WarfareBMGNest_M240", 1],
	["RU_WarfareBMGNest_PK", 1],
	["GUE_WarfareBMGNest_PK", 1],
	["Ins_WarfareBMGNest_PK", 1],
	["CDF_WarfareBMGNest_PK", 1],
	["DSHkM_Mini_TriPod", 1],
	["DSHkM_Mini_TriPod_CDF", 1],
	["M2HD_mini_TriPod", 1],
	["MK19_TriPod", 1],
	["Stinger_Pod", 1],
	["TOW_TriPod", 1],
	["Igla_AA_pod_East", 1],
	["Fort_Nest_M240", 1],
	["M240Nest_DZ", 1],
	["BAF_L2A1_Tripod_D", 1],
	["BAF_L2A1_Tripod_W", 1],
	["BAF_L2A1_Minitripod_D", 1],
	["BAF_L2A1_Minitripod_W", 1],
	["BAF_GPMG_Minitripod_D", 1],
	["BAF_GPMG_Minitripod_W", 1],
	["BAF_GMG_Tripod_D", 1],
	["BAF_GMG_Tripod_W", 1],
	["WarfareBMGNest_M240_US_EP1", 1],
	["M2StaticMG_US_EP1", 1],
	["M2HD_mini_TriPod_US_EP1", 1],
	["M119_US_EP1", 1],
	["SearchLight_US_EP1", 1],
	["M252_US_EP1", 1],
	["Stinger_Pod_US_EP1", 1],
	["MK19_TriPod_US_EP1", 1], 					//Grenade Luncher 
	["TOW_TriPod_US_EP1", 1],
	["AGS_UN_EP1", 1],
	["SearchLight_UN_EP1", 1],
	["KORD_UN_EP1", 1],
	["KORD_high_UN_EP1", 1],
	["DSHKM_TK_GUE_EP1", 1],
	["DSHkM_Mini_TriPod_TK_GUE_EP1", 1],
	["2b14_82mm_TK_GUE_EP1", 1],
	["SPG9_TK_GUE_EP1", 1],
	["ZU23_TK_GUE_EP1", 1],
	["WarfareBMGNest_PK_TK_GUE_EP1", 1],
	["AGS_TK_GUE_EP1", 1],
	["D30_TK_GUE_EP1", 1],
	["SearchLight_TK_GUE_EP1", 1],
	["DSHKM_TK_INS_EP1", 1],
	["DSHkM_Mini_TriPod_TK_INS_EP1", 1],
	["2b14_82mm_TK_INS_EP1", 1],
	["SPG9_TK_INS_EP1", 1],
	["ZU23_TK_INS_EP1", 1],
	["AGS_TK_INS_EP1", 1],
	["D30_TK_INS_EP1", 1],
	["SearchLight_TK_INS_EP1", 1]
	["Igla_AA_pod_TK_EP1", 1],
	["AGS_TK_EP1", 1],
	["D30_TK_EP1", 1],
	["KORD_TK_EP1", 1],
	["KORD_high_TK_EP1", 1]
	["Metis_TK_EP1", 1],
	["2b14_82mm_TK_EP1", 1],
	["SearchLight_TK_EP1", 1],
	["ZU23_TK_EP1", 1],
	["WarfareBMGNest_PK_TK_EP1", 1],
	["AGS_CZ_EP1", 1],
	["2b14_82mm_CZ_EP1", 1],
	["DSHKM_CZ_EP1", 1],
	["ZSU_TK_EP1",_Ratio4]							//ZU-23 two 2A14 23mm autocannons emplacement
];*/

if (toLower worldName in ["caribou","chernarus","cmr_ovaron","dayznogova","dingor","dzhg","fallujah","fapovo","fdf_isle1_a","isladuala","lingor","mbg_celle2","namalsk","napf","oring","panthera2","sara","sauerland","smd_sahrani_a2","tasmania2010","tavi","trinity","utes"]) then {
	// water map, add boats
	
	AllowedVehiclesList = AllowedVehiclesList + WaterVehicleList;
};