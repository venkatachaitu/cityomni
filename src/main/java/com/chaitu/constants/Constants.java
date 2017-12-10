package com.chaitu.constants;

import java.util.HashMap;
import java.util.Map;

 
public class Constants {
				
		//public static final String ext = ".xml";
		
		public static final String ATMs =  "ATM's" ;
		public static final String AUTO_MOBILES =  "Auto mobiles" ;
		public static final String BANKS_LIST =  "Banks" ;
		public static final String BARS_LIST =  "Bars" ;
		public static final String BEAUTY_PARLOURS =  "Beauty Parlours" ;
		public static final String COFFEE_SHOPS =  "Coffee shops" ;
		public static final String COLLEGES =  "Colleges" ;
		public static final String COMPUTER_INSTITUTES =  "Computer_Institutes" ;
		public static final String COMPUTER_SERVICES =  "Computer_Services" ;
		public static final String DANCE_SCHOOLS =  "Dance schools" ;
		public static final String FIRE_STATIONS =  "Fire stations" ;
		public static final String GOVT_OFC =  "Govt. offices" ;
		public static final String GROCERY_STORES =  "Grocery stores" ;
		public static final String HOSPITALS =  "Hospitals" ;
		public static final String HOTELS =  "Hotels" ;
		public static final String INSURANCE_COMPANIES =  "Insurance companies" ;
		public static final String JEWELLERY_SHOPS =  "Jewellery Shops" ;
		public static final String LIBRARIES =  "Libraries" ;
		public static final String LODGES =  "Lodges" ;
		public static final String MOBILE_SHOPS =  "Mobile Shops" ;		
		public static final String MUSEUMS =  "Museums" ;
		public static final String PARCEL_COURRIER =  "Palcel, Courier services" ;
		public static final String PARKS =  "Parks" ;
		public static final String PARTY_HALLS =  "Party Halls" ;
		public static final String PHARMACY =  "Pharmacy" ;
		public static final String PHOTO_STUDIOS =  "Photo studios" ;
		public static final String POLICE_STATIONS =  "Police stations" ;
		public static final String RESTAURENTS =  "Restaurents" ;
		public static final String SCHOOLS =  "Schools" ;
		public static final String SHOPPING_MALLS =  "Shopping malls" ;		
		public static final String STADIUMS =  "Stadiums" ;
		public static final String THEATERS =  "Theaters" ;
		public static final String TOURS =  "Tours" ;
		public static final String TRAVELS =  "Travels" ;
		public static final String Universities =  "Universities" ;
		
		public static Map<String, Integer> mm;
		static{
			mm = new HashMap<String, Integer>();
			mm.put("ATMs", 1);
			mm.put("automobiles", 2);
			mm.put("banks", 3);
			mm.put("bars", 4);
			mm.put("beautyParlours", 5);
			mm.put("coffeeShops", 6);
			mm.put("colleges", 7);
			mm.put("computerInstitutes", 8);
			mm.put("computerServices", 9);
			mm.put("danceSchools", 10);
			mm.put("fireStations", 11);
			mm.put("governmentOffices", 12);
			mm.put("groceryStores", 13);
			mm.put("hospitals", 14);
			mm.put("hotels", 15);
			mm.put("insuranceCompanies", 16);
			mm.put("jewelleryShops", 17);
			mm.put("libraries", 18);
			mm.put("lodges", 19);
			mm.put("mobileShops", 20);
			mm.put("museums", 21);
			mm.put("parcelCourries", 22);
			mm.put("parks", 23);
			mm.put("partyHalls", 24);
			mm.put("pharmacy", 25);
			mm.put("photoStudios", 26);
			mm.put("policeStations", 27);
			mm.put("restaurents", 28);
			mm.put("schools", 29);
			mm.put("shoppingMalls", 30);
			mm.put("stadiums", 31);
			mm.put("theaters", 32);
			mm.put("tours", 33);
			mm.put("travels", 34);
			mm.put("universities", 35);

		}
		
		public static String getType(String type) throws Exception {
			int t = 0;
			if(mm.get(type) != null)
				t = mm.get(type);
			else
				return null;
			
			String flag = "";
			switch(t){ 
				case 1: {flag = ATMs; break;} 
			    case 2: {flag = AUTO_MOBILES; break;} 
			    case 3: {flag = BANKS_LIST; break;} 
			    case 4: {flag = BARS_LIST; break;} 
			    case 5: {flag = BEAUTY_PARLOURS; break;} 
			    case 6: {flag = COFFEE_SHOPS; break;} 
			    case 7: {flag = COLLEGES; break;} 
			    case 8: {flag = COMPUTER_INSTITUTES; break;} 
			    case 9: {flag = COMPUTER_SERVICES; break;} 
			    case 10: {flag = DANCE_SCHOOLS; break;} 
			    case 11: {flag = FIRE_STATIONS; break;} 
			    case 12: {flag = GOVT_OFC;   break;} 
			    case 13: {flag = GROCERY_STORES; break;} 
			    case 14: {flag = HOSPITALS; break;} 
			    case 15: {flag = HOTELS; break;} 
			    case 16: {flag = INSURANCE_COMPANIES; break;} 
			    case 17: {flag = JEWELLERY_SHOPS; break;} 
			    case 18: {flag = LIBRARIES; break;} 
			    case 19: {flag = LODGES; break;} 
			    case 20: {flag = MOBILE_SHOPS; break;} 
			    case 21: {flag = MUSEUMS; break;} 
			    case 22: {flag = PARCEL_COURRIER; break;} 
			    case 23: {flag = PARKS;   break;} 
			    case 24: {flag = PARTY_HALLS; break;} 
			    case 25: {flag = PHARMACY; break;} 
			    case 26: {flag = PHOTO_STUDIOS; break;} 
			    case 27: {flag = POLICE_STATIONS; break;} 
			    case 28: {flag = RESTAURENTS; break;} 
			    case 29: {flag = SCHOOLS; break;} 
			    case 30: {flag = SHOPPING_MALLS; break;} 
			    case 31: {flag = STADIUMS; break;} 
			    case 32: {flag = THEATERS; break;} 
			    case 33: {flag = TOURS; break;} 
			    case 34: {flag = TRAVELS; break;} 
			    case 35: {flag = Universities; break;}
			    
			    default: flag = null;  
		    }
			return flag;
		}
		
}
