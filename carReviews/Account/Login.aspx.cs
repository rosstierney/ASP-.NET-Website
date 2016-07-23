using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Account_Login : System.Web.UI.Page
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

    // email, password match
    private bool validUser = false;

    // page load
    protected void Page_Load(object sender, EventArgs e)
    {
        // login page not for users / admins
        if (User.Identity.IsAuthenticated)
            Response.Redirect("~/Default.aspx");
    }


    // user authentication
    protected void User_Authenticate(object sender, AuthenticateEventArgs e)
    {
       // check email address and password
        if (ValidateUser(SiteLogin.UserName.ToLower(), SiteLogin.Password))
        {
            // send G17 custom cookie
            IssueCookie(SiteLogin.UserName.ToLower(), SiteLogin.Password);

            // authenticate
            e.Authenticated = true;
        }
    }

    // check email and password against database
    private bool ValidateUser(string email, string password)
    {
        try
        {
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
                // password found
                if (password.Equals(returnedData.Tables[0].Rows[0][2].ToString()))
                    validUser = true;
                else
                {
                    SubmitMsg.Text = "Incorrect password &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  <a href=\"PasswordRecovery.aspx\">Password Recovery</a>";
                }
            }
            else
                SubmitMsg.Text = "<br />Email address not registered";

            databaseConnection.Dispose();
            databaseConnection.Close();

        }
        catch (Exception ex)
        {
            // TODO record to LOG
            ;
        }

        // bool
        return validUser;
    }


    // issue G17carReviews custom cookie
    protected void IssueCookie(string email, string password)
    {
        // create cookie object | check chrome://settings/cookies
        HttpCookie _userInfoCookies = new HttpCookie("G17carReviews");

        // double AES encrypt data
        SimplerAES aes = new SimplerAES();
        email = aes.Encrypt(returnedData.Tables[0].Rows[0][1].ToString());
        password = aes.Encrypt(returnedData.Tables[0].Rows[0][2].ToString());

        // set cookie string values
        _userInfoCookies["DataA"] = email;
        _userInfoCookies["DataB"] = password;

        // add expiration for persistance
        _userInfoCookies.Expires = DateTime.Now.AddHours(1);

        // add cookies to current web response
        Response.Cookies.Add(_userInfoCookies);
    }
}