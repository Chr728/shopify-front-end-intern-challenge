package nasa;
/*
 * Author : Christina Darstbanian 
 * This class has as part of the backend also serves for the attributed of the data that I am getting
 * chosen api is APOD API 
 */
public class AOAPODPicture{
    public String date;
    public String explanation;
    public  String hdurl;
    public String service_version;
    public String title;
    public String url;
    
    @Override
    public String toString(){
        return title + ":" + explanation + ":" + hdurl;
    }
}