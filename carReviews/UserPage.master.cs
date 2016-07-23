using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class UserPage : System.Web.UI.MasterPage
{
    // location/loginDetails for Database.mdf
    private SqlConnection databaseConnection = new SqlConnection("Data Source=.\\SQLExpress;User Instance=true;Integrated Security=true;AttachDbFilename=|DataDirectory|Database.mdf");

    // sql command for Database.mdf
    private SqlCommand sqlCommand;

    // data storage object
    private DataSet returnedData = new DataSet();

    // data adapter
    private SqlDataAdapter dataAdapter;

    // encryption object
    private SimplerAES aes = new SimplerAES();

    // userType/userType
    private int userType = 0;

    // login
    private string email, password;


    protected void Page_Load(object sender, EventArgs e)
    {
        // check G17 login cookie
        User_CookieLogin();
    }


    // check for G17 cookie
    protected void User_CookieLogin()
    {
        // attempt to retrieve user cookie as HttpCookie object
        HttpCookie ourCookie = Request.Cookies["G17carReviews"];

        // if email, password validate and correspond to current user
        if (ourCookie != null)
        {
            // decrypt data
            email = aes.Decrypt(aes.Decrypt(Request.Cookies["G17carReviews"]["DataA"]));
            password = aes.Decrypt(aes.Decrypt(Request.Cookies["G17carReviews"]["DataB"]));

            userType = ValidateUser(email, password);

            if (userType != 1) // if not member
                if (userType != 2) // if not admin
                    DestroyCookies();
        }
        else // no cookie = error
            DestroyCookies();
    }

    // check email and password against database
    private int ValidateUser(string email, string password)
    {
        try
        {
            // destroy cookies
            bool destroy = false;

            // lowercase
            email = email.ToLower();

            // connect to the database
            databaseConnection.Open();

            // encrypt strings
            email = aes.Encrypt(email);
            password = aes.Encrypt(password);

            // SQL command to retrieve encrypted userPassword for encrypted email address
            sqlCommand = new SqlCommand("SELECT * FROM [User] WHERE Email='" + email + "'", databaseConnection);

            // run the SQL throught an adapter
            dataAdapter = new SqlDataAdapter(sqlCommand);

            // use the adapter to fill the DataSet
            dataAdapter.Fill(returnedData);

            // i = the number of rows of data (0 or 1)
            int i = returnedData.Tables[0].Rows.Count;

            if (i == 1) // email found
            {
                // passwords match
                if (password.Equals(returnedData.Tables[0].Rows[0][2].ToString()))
                {
                    // normal member authorisation
                    if (returnedData.Tables[0].Rows[0][4].ToString().Equals("1"))
                        userType = 1;

                    // admin authorisation
                    else if (returnedData.Tables[0].Rows[0][4].ToString().Equals("2"))
                        userType = 2;

                    else // authorisation error
                        destroy = true;
                }
                else // password error
                    destroy = true;
            }
            else // cookie email error
                destroy = true;

            // de-authenticates user
            if (destroy)
            {
                userType = 0;
                DestroyCookies();
            }
        }
        catch (Exception ex)
        {
            // TODO record to LOG
            ;
        }
        finally
        {
            databaseConnection.Dispose();
            databaseConnection.Close();
        }

        // return
        return userType;
    }

    private void DestroyCookies()
    {
        // expire the G17 cookie
        Response.Cookies["G17carReviews"].Expires = DateTime.Now.AddDays(-1);

        // expire the session cookie
        Response.Cookies[".ASPXAUTH"].Expires = DateTime.Now.AddDays(-1);

        // expire session cookie
        Response.Cookies["ASP.NET_SessionId"].Expires = DateTime.Now.AddDays(-1);
    }
}

