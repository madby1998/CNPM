package Controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.JSONObject;

public class Profile_Modal {
	public Profile_Bean call_me(String access_token) throws Exception {
		String url = "https://graph.facebook.com/v2.12/me?fields=id,name,picture&access_token=" + access_token;
		URL obj = new URL(url);
		HttpURLConnection con = (HttpURLConnection) obj.openConnection();
		// optional default is GET
		con.setRequestMethod("GET");
		// add request header
//		con.setRequestProperty("User-Agent", "Mozilla/5.0");
		int responseCode = con.getResponseCode();
		System.out.println("\nSending 'GET' request to URL : " + url);
		System.out.println("Response Code : " + responseCode);
		BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
		String inputLine;
		StringBuffer response = new StringBuffer();
		while ((inputLine = in.readLine()) != null) {
			response.append(inputLine);
		}
		in.close();
		System.out.println(response);
		Profile_Bean obj_Profile_Bean = new Profile_Bean();
		JSONObject myResponse = new JSONObject(response.toString());
		obj_Profile_Bean.setUser_name(myResponse.getString("name"));
		obj_Profile_Bean.setId(myResponse.getString("id"));
//		obj_Profile_Bean.setEmail(myResponse.getString("email"));
		JSONObject picture_reponse = myResponse.getJSONObject("picture");
		JSONObject data_response = picture_reponse.getJSONObject("data");
		System.out.println("URL : " + data_response.getString("url"));
		obj_Profile_Bean.setProfile_picture(data_response.getString("url"));
		return obj_Profile_Bean;
	}
	public static void main(String[] args) {
		Profile_Modal profile_Modal = new Profile_Modal();
		try {
			Profile_Bean profile_Bean = profile_Modal.call_me("EAAGEg1f2olMBAP1DkERDwGCQIZA43vB7Pe0VsOBZCE34PuSrByB5L6UrkjsA7hPjJPIZAdKwnFPEcrYP2neDBSkuid8niM1OdjVZBUNy0lAZBE9hQkUaRZBlUtpZAmNfegqSQhhZCab2dDJR08l85Ow7yqDyDTubuZC74kmRyzYY6rKTeUfUBnCZABvIfxNJecDTkLwuZCnJ5GizwZDZD");
			System.out.println(profile_Bean.getUser_name());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		System.out.println("ssss");
	}
}
