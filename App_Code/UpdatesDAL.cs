using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;

public class UpdatesDAL
{

    public static  bool AddUpdate(string userid, string text)
    {
        SqlConnection con = new SqlConnection(Database.ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("mb_addupdate", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@userid", userid);
            cmd.Parameters.AddWithValue("@text", text);
            cmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception ex)
        {
            // write error message to trace 
            HttpContext.Current.Trace.Write(
               "Error From AddUpdate() -->" + ex.Message);
            return false;
        }
        finally 
        {
           con.Close();
        }
    }

    public static bool DeleteUpdate(string updateid)
    {
        SqlConnection con = new SqlConnection(Database.ConnectionString);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("mb_deleteupdate", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@updateid", updateid);
            cmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception ex)
        {
            // write error message to trace 
            HttpContext.Current.Trace.Write(
               "Error From DeleteUpdate() -->" + ex.Message);
            return false;
        }
        finally
        {
            con.Close();
        }
    }

    public static DataSet GetUpdates(string userid)
    {
        SqlConnection con = new SqlConnection(Database.ConnectionString);
        try
        {
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("mb_getupdates", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.AddWithValue("@userid", userid);
            DataSet ds = new DataSet();
            da.Fill(ds, "updates");
            return ds;
        }
        catch (Exception ex)
        {
            // write error message to trace 
            HttpContext.Current.Trace.Write(
               "Error From GetUpdates -->" + ex.Message);
            return null;
        }
        finally
        {
            con.Close();
        }

    }

}
