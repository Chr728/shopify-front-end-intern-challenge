package nasa;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Scanner;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.simple.parser.ParseException;
/*
 * Author : Christina Darstbanian 
 * This class has mainly the backend functions , working with json objects after fetching data from nasa pi 
 * chosen api is APOD API 
 */
public class Nasa {

	public static ArrayList<AOAPODPicture> pics = new ArrayList<>();
	public static HashMap<String, Boolean> pics_likes = new HashMap<>();
	public  Nasa()  {
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -10);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String date = format.format(cal.getTime());

		String requestURL = "https://api.nasa.gov/planetary/apod?api_key=gbMfyDMsrtClBTS3cVrMDGI8Nf0zy4vGMoiIzHdp&start_date=" + date;
		URL wikiRequest = null;
		try {
			wikiRequest = new URL(requestURL);
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}
		URLConnection connection= null;
		try {
			connection = wikiRequest.openConnection();
		} catch (IOException e) {
			e.printStackTrace();
		}
		connection.setDoOutput(true);
		Scanner scanner = null;
		try {
			scanner = new Scanner(wikiRequest.openStream());
		} catch (IOException e) {
			e.printStackTrace();
		}
		String response = scanner.useDelimiter("\\Z").next();
		scanner.close();
		JSONArray jsonArray = new JSONArray(response);
		final int n = jsonArray.length();
		AOAPODPicture temp ;
		for (int i = 0; i < n; ++i) {
			final JSONObject pic = jsonArray.getJSONObject(i);
			if (pic.getString("media_type").equals("image")) {
				temp = new AOAPODPicture();
				if(!(pics_likes.containsKey(pic.getString("date")))) {
					pics_likes.put(pic.getString("date"), false);

				}
				temp.date = pic.getString("date");
				temp.explanation = pic.getString("explanation");
				temp.hdurl = pic.getString("hdurl");
				temp.service_version = pic.getString("service_version");
				temp.title = pic.getString("title");
				temp.url = pic.getString("url");
				pics.add(temp);
			}
		}

		for (AOAPODPicture pic : pics) {
			System.out.println(pic.toString());
		}
	}

	public  AOAPODPicture  searchbydate(String date) {
		String requestURL = "https://api.nasa.gov/planetary/apod?api_key=gbMfyDMsrtClBTS3cVrMDGI8Nf0zy4vGMoiIzHdp&date=" + date;
		URL wikiRequest = null;
		try {
			wikiRequest = new URL(requestURL);
		} catch (MalformedURLException e) {
			return null;
		}
		URLConnection connection= null;
		try {
			connection = wikiRequest.openConnection();
		} catch (IOException e) {
			return null;
		}
		connection.setDoOutput(true);

		Scanner scanner = null;
		try {
			scanner = new Scanner(wikiRequest.openStream());
		} catch (IOException e) {
			return null;
		}
		String response = scanner.useDelimiter("\\Z").next();
		scanner.close();

		final JSONObject pic = new JSONObject(response);
		AOAPODPicture temp = null;
		if (pic.getString("media_type").equals("image")) {
			temp = new  AOAPODPicture ();
			if(!(pics_likes.containsKey(pic.getString("date")))) {
				pics_likes.put(pic.getString("date"), false);

			}
			temp.date = pic.getString("date");
			temp.explanation = pic.getString("explanation");
			temp.hdurl = pic.getString("hdurl");
			temp.service_version = pic.getString("service_version");
			temp.title = pic.getString("title");
			temp.url = pic.getString("url");

		}

		return temp;

	}
}
