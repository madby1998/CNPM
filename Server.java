package Controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.JSONObject;

public class Server {
	public User call_me(String access_token) throws Exception {
		String url = "https://graph.facebook.com/v2.12/me?fields=id,name,picture&access_token=" + access_token;
		URL obj = new URL(url);
		HttpURLConnection con = (HttpURLConnection) obj.openConnection();

		con.setRequestMethod("GET"); // mặc định tùy chọn là get
		
		int responseCode = con.getResponseCode(); // thêm tiêu đề yêu cầu
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
		
		User obj_Profile_user = new User();
		JSONObject myResponse = new JSONObject(response.toString());
		obj_Profile_user.setUser_name(myResponse.getString("name"));
		obj_Profile_user.setId(myResponse.getString("id"));
//		obj_Profile_Bean.setEmail(myResponse.getString("email"));
		JSONObject picture_reponse = myResponse.getJSONObject("picture");
		JSONObject data_response = picture_reponse.getJSONObject("data");
		System.out.println("URL : " + data_response.getString("url"));
		obj_Profile_user.setProfile_picture(data_response.getString("url")); 
		return obj_Profile_user;
	}
	public static void main(String[] args) {
		Server profile_server = new Server();
		try {
			User profile_user = profile_server.call_me("EAAGEg1f2olMBAP1DkERDwGCQIZA43vB7Pe0VsOBZCE34PuSrByB5L6UrkjsA7hPjJPIZAdKwnFPEcrYP2neDBSkuid8niM1OdjVZBUNy0lAZBE9hQkUaRZBlUtpZAmNfegqSQhhZCab2dDJR08l85Ow7yqDyDTubuZC74kmRyzYY6rKTeUfUBnCZABvIfxNJecDTkLwuZCnJ5GizwZDZD");
			System.out.println(profile_user.getUser_name());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
