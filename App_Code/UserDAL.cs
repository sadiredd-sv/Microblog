using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;

public class UserDAL
{
    public static User GetUserDetails(string userid)
    {
        SqlConnection con = new SqlConnection(Database.ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("mb_getuserdetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@userid", userid);
            SqlDataReader dr = cmd.ExecuteReader();
            dr.Read();
            User u = new User();
            u.OnlineBio = dr["onlinebio"].ToString();
            u.PictureFile = dr["picturefile"].ToString();
            u.UpdatesCount = (int)dr["updatescount"];
            u.FollowersCount = (int)dr["followerscount"];
            u.FriendsCount = (int)dr["friendscount"];
            return u;
        }
        catch (Exception ex)
        {
            // write error message to trace 
            HttpContext.Current.Trace.Write(
               "Error From GetUserDetails() -->" + ex.Message);
            return null;
        }
        finally
        {
            con.Close();
        }
    }


    public static bool UpdateUserProfile(string userid, string onlinebio, string picturefile)
    {
        SqlConnection con = new SqlConnection(Database.ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("mb_updateuserprofile", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@userid", userid);
            cmd.Parameters.AddWithValue("@onlinebio", onlinebio);
            cmd.Parameters.AddWithValue("@picturefile",picturefile);
            cmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception ex)
        {
            // write error message to trace 
            HttpContext.Current.Trace.Write(
               "Error From UpdateUserProfile() -->" + ex.Message);
            return false;
        }
        finally
        {
            con.Close();
        }
    }

    public static DataSet GetTotalUpdates(string userid)
    {
        SqlConnection con = new SqlConnection(Database.ConnectionString);
        try
        {
            con.Open();
            SqlDataAdapter da  = new SqlDataAdapter("mb_gettotalupdates", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.AddWithValue("@userid", userid);
            DataSet ds = new DataSet();
            da.Fill(ds, "updates");
            HttpContext.Current.Trace.Write("Done GetTotalUpdates");
            return ds;
        }
        catch (Exception ex)
        {
            // write error message to trace 
            HttpContext.Current.Trace.Write(
               "Error From GetTotalUpdates -->" + ex.Message);
            return null;
        }
        finally
        {
            con.Close();
        }

    }


    public static DataSet FindPeople(string userid, string pattern)
    {
        SqlConnection con = new SqlConnection(Database.ConnectionString);
        try
        {
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("mb_findpeople", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.AddWithValue("@userid", userid);
            da.SelectCommand.Parameters.AddWithValue("@pattern", pattern);
            DataSet ds = new DataSet();
            da.Fill(ds, "users");
            return ds;
        }
        catch (Exception ex)
        {
            // write error message to trace 
            HttpContext.Current.Trace.Write(
               "Error From FindPeople -->" + ex.Message);
            return null;
        }
        finally
        {
            con.Close();
        }

    }

    public static DataSet GetFriends(string userid)
    {
        SqlConnection con = new SqlConnection(Database.ConnectionString);
        try
        {
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("mb_getfriends", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.AddWithValue("@userid", userid);
            DataSet ds = new DataSet();
            da.Fill(ds, "friends");
            return ds;
        }
        catch (Exception ex)
        {
            // write error message to trace 
            HttpContext.Current.Trace.Write(
               "Error From GetFriends -->" + ex.Message);
            return null;
        }
        finally
        {
            con.Close();
        }

    }

    public static bool AddFriend(string userid, string friendid)
    {
        SqlConnection con = new SqlConnection(Database.ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("mb_addfriend", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@userid", userid);
            cmd.Parameters.AddWithValue("@friendid",friendid);
            cmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception ex)
        {
            // write error message to trace 
            HttpContext.Current.Trace.Write(
               "Error From AddFriend() -->" + ex.Message);
            return false;
        }
        finally
        {
            con.Close();
        }
    }

    public static bool RemoveFriend(string userid, string friendid)
    {
        SqlConnection con = new SqlConnection(Database.ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("mb_removefriend", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@userid", userid);
            cmd.Parameters.AddWithValue("@friendid", friendid);
            cmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception ex)
        {
            // write error message to trace 
            HttpContext.Current.Trace.Write(
               "Error From RemoveFriend() -->" + ex.Message);
            return false;
        }
        finally
        {
            con.Close();
        }
    }
}
