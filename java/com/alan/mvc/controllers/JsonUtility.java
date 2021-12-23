package com.alan.mvc.controllers;

import java.io.IOException;

import com.fasterxml.jackson.databind.ObjectMapper;

public final class JsonUtility {
	
	
	public static <I> I toObject (String jsonString, Class<I>cls) {
		I result = null;
		ObjectMapper objMpr = new ObjectMapper();
		try {
			result = objMpr.readValue(jsonString,  cls);
		}catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}

}
