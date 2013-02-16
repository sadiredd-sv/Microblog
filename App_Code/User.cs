using System;
using System.Data;



public class User
{
    private string onlinebio, picturefile;

    public string OnlineBio
    {
        get { return onlinebio; }
        set { onlinebio = value; }
    }

    public string PictureFile
    {
        get { return picturefile; }
        set { picturefile = value; }
    }

    private int followerscount, friendscount, updatescount;

    public int UpdatesCount
    {
        get { return updatescount; }
        set { updatescount = value; }
    }

    public int FriendsCount
    {
        get { return friendscount; }
        set { friendscount = value; }
    }

    public int FollowersCount
    {
        get { return followerscount; }
        set { followerscount = value; }
    }


}
