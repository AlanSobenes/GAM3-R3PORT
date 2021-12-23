package com.alan.mvc.services;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

@Service
public class ApiService {
	
//	get new games by platform
	public List<Object> getNewGames(String platform) {
		HttpRequest request = HttpRequest.newBuilder()
 				.uri(URI.create("https://whatoplay.p.rapidapi.com/new?platform="+platform))
 				.header("x-rapidapi-host", "whatoplay.p.rapidapi.com")
 				.header("x-rapidapi-key", "")
 				.method("GET", HttpRequest.BodyPublishers.noBody())
 				.build();
 		HttpResponse<String> response = null;
		try {
//			turns API response to JSON String
			response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());
		} catch (IOException | InterruptedException e) {
			e.printStackTrace();
		}
//		Change JSON string into object then, then into an array
		JSONObject obj = new JSONObject(response.body());
		JSONObject job = obj.getJSONObject(platform);
		JSONArray list = (JSONArray) job.get("data");
	
//		List to iterate over in jsp, with key:value pairs
		List<Object> listData = new ArrayList<>();     
		
		if (list != null) { 
		   for (int i=0;i<list.length();i++){ 
			HashMap <String, Object> keysValues = new HashMap<String, Object>();
			keysValues.put("game_name", list.getJSONObject(i).get("game_name") );
			keysValues.put("release_date", list.getJSONObject(i).get("release_date"));
			keysValues.put("box_art", list.getJSONObject(i).get("box_art"));
			keysValues.put("game_id",  list.getJSONObject(i).get("game_id"));
		    listData.add(keysValues);
		   } 
		} 
		return listData;
	}
	
	
//	get best games by platform
	public List<Object> getBestGames(String platform) {
		HttpRequest request = HttpRequest.newBuilder()
 				.uri(URI.create("https://whatoplay.p.rapidapi.com/platform?platform="+platform+"&count=50"))
 				.header("x-rapidapi-host", "whatoplay.p.rapidapi.com")
 				.header("x-rapidapi-key", "")
 				.method("GET", HttpRequest.BodyPublishers.noBody())
 				.build();
 		HttpResponse<String> response = null;
		try {
//			turns API response to JSON String
			response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());
		} catch (IOException | InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		Change JSON string into object then, then into an array
		JSONObject obj = new JSONObject(response.body());
		JSONObject job = obj.getJSONObject(platform);
		JSONArray list = (JSONArray) job.get("data");
	
//		List to iterate over in jsp, with key:value pairs
		List<Object> listData = new ArrayList<>();     
		
		if (list != null) { 
		   for (int i=0;i<list.length();i++){ 
			HashMap <String, Object> keysValues = new HashMap<String, Object>();
			keysValues.put("game_name", list.getJSONObject(i).get("game_name") );
			keysValues.put("release_date", list.getJSONObject(i).get("release_date"));
			keysValues.put("box_art", list.getJSONObject(i).get("box_art"));
			keysValues.put("game_id",  list.getJSONObject(i).get("game_id"));
			keysValues.put("gamerscore",  list.getJSONObject(i).get("gamerscore"));
		    listData.add(keysValues);

		   } 
		} 
		return listData;

	}
	
	
	
	
	//	search for a game(s)
	public List<Object> searchForAGames(String game) {
		HttpRequest request = HttpRequest.newBuilder()
 				.uri(URI.create("https://whatoplay.p.rapidapi.com/search?game="+game))
 				.header("x-rapidapi-host", "whatoplay.p.rapidapi.com")
 				.header("x-rapidapi-key", "")
 				.method("GET", HttpRequest.BodyPublishers.noBody())
 				.build();
 		HttpResponse<String> response = null;
		try {
//			turns API response to JSON String
			response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());
		} catch (IOException | InterruptedException e) {
			
			e.printStackTrace();
		}
		JSONArray list =  new JSONArray(response.body());
//		List to iterate over in jsp, with key:value pairs
		List<Object> listData = new ArrayList<>();     
		
		if (list != null) { 
		   for (int i=0;i<list.length();i++){ 
			HashMap <String, Object> keysValues = new HashMap<String, Object>();
			keysValues.put("game_name", list.getJSONObject(i).get("game_name") );
			keysValues.put("release_date", list.getJSONObject(i).get("release_date"));
			keysValues.put("platform", list.getJSONObject(i).get("platform"));
			keysValues.put("box_art", list.getJSONObject(i).get("box_art"));
			keysValues.put("game_id",  list.getJSONObject(i).get("game_id"));
			keysValues.put("gamerscore",  list.getJSONObject(i).get("gamerscore"));
		    listData.add(keysValues);

		   } 
		} 
		
		return listData;
	}
	
	
	
	
//	show details of one game
	public HashMap<String, Object> getGameById(String id) {
		HttpRequest request = HttpRequest.newBuilder()
 				.uri(URI.create("https://whatoplay.p.rapidapi.com/game?game_id="+id))
 				.header("x-rapidapi-host", "whatoplay.p.rapidapi.com")
 				.header("x-rapidapi-key", "")
 				.method("GET", HttpRequest.BodyPublishers.noBody())
 				.build();
 		HttpResponse<String> response = null;
		try {
//			turns API response to JSON String
			response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());
		} catch (IOException | InterruptedException e) {
			
			e.printStackTrace();
		}
//		Change JSON string into object then, then into an array
		JSONObject obj = new JSONObject(response.body());
		
		
		
		JSONObject job = obj.getJSONObject(id);
		JSONObject data = job.getJSONObject("data");
//		System.out.println(data);
		
		
		HashMap<String, Object> game= new HashMap<String,Object>();
		game.put("game_name", data.get("game_name"));
		game.put("platform", data.get("platform"));
		game.put("release_date", data.get("release_date"));
		game.put("developer", data.get("developer"));
		game.put("game_themes",  data.get("game_themes"));
		game.put("box_art", data.get("box_art"));
		if(data.get("total_gamer_count").equals(null)||
				data.get("gamerscore").equals(null)||
				data.get("criticscore").equals(null)||
				data.get("playscore").equals(null)) {
					game.put("total_gamer_count",  null);
					game.put("gamerscore", null  );
					game.put("criticscore",  null);
					game.put("playscore",  null);
		}else{
			game.put("total_gamer_count",  data.get("total_gamer_count"));
			game.put("gamerscore", data.get("gamerscore")  );
			game.put("criticscore",  data.get("criticscore"));
			game.put("playscore",  data.get("playscore"));
		}
		
		
		
		

		return game;
	}
	
//	show the game critic review
	public List< Object> getCriticReviewById(String id) {
		HttpRequest request = HttpRequest.newBuilder()
 				.uri(URI.create("https://whatoplay.p.rapidapi.com/game/critics?game_id="+id))
 				.header("x-rapidapi-host", "whatoplay.p.rapidapi.com")
 				.header("x-rapidapi-key", "")
 				.method("GET", HttpRequest.BodyPublishers.noBody())
 				.build();
 		HttpResponse<String> response = null;
		try {
//			turns API response to JSON String
			response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());
		} catch (IOException | InterruptedException e) {
			
			e.printStackTrace();
		}
//		Change JSON string into object then, then into an array
		JSONObject obj = new JSONObject(response.body());
		
		
		
		JSONObject job = obj.getJSONObject(id);
		JSONObject data = job.getJSONObject("data");
		JSONArray list = (JSONArray) data.get("game_critic_reviews");
		  
		
		List<Object> listData = new ArrayList<>();     
		
		if (list != null) { 
		   for (int i=0;i<list.length();i++){ 
			HashMap <String, Object> keysValues = new HashMap<String, Object>();
			keysValues.put("quote", list.getJSONObject(i).get("qoute") );
			keysValues.put("author", list.getJSONObject(i).get("author"));
			keysValues.put("date_published", list.getJSONObject(i).get("date_published"));
			keysValues.put("publication", list.getJSONObject(i).get("publication"));
		    listData.add(keysValues);

		   } 
		}
		

	
		return  listData;
		
	}
	
	
	
	
	
}
