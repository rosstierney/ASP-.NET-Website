using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_Users : System.Web.UI.Page
{
    // location/loginDetails for Database.mdf
    private SqlConnection databaseConnection = new SqlConnection("Data Source=.\\SQLExpress;User Instance=true;Integrated Security=true;AttachDbFilename=|DataDirectory|Database.mdf");

    // sql command for Database.mdf
    private SqlCommand sqlCommand;

    // data storage object
    private DataSet returnedData = new DataSet();

    // data adapter
    private SqlDataAdapter dataAdapter;

    // data reader
    private SqlDataReader dataReader;


    // encryption object
    private SimplerAES aes = new SimplerAES();

    // user status default as member
    private int userStatus = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        

        GridViewBind();
    }

    protected void GridViewBind()
    {
        try
        {
            databaseConnection.Open();

            sqlCommand = new SqlCommand("Select * FROM [User]", databaseConnection);
            // User is a built-in function in SQL Server. You need to surround the name with square brackets: [User]

            dataReader = sqlCommand.ExecuteReader();
            UsersTableView.DataSource = dataReader;
            UsersTableView.DataBind();
            databaseConnection.Close();


        }
        catch (Exception ex)
        {
            TableMessage.Text = ex.Message;
            return;
        }
        finally
        {
            sqlCommand = null;
            databaseConnection.Close();
        }
    }

    protected void BnRegister_Click(object sender, EventArgs e)
    {
        try
        {
            // declare and encrypt strings
            int userID = GenerateID();
            string strUserID = aes.Encrypt(userID.ToString());
            string email = aes.Encrypt(TxbName.Text.ToLower());
            string userName = aes.Encrypt(NickName.Text.ToLower());
            string password = aes.Encrypt(TxbPassword.Text);

            /** check whether UserName exists **/
            sqlCommand = new SqlCommand("SELECT * FROM [User] WHERE Email='" + email + "'", databaseConnection);

            SqlDataAdapter dataAdapter = new SqlDataAdapter(sqlCommand);
            dataAdapter.Fill(returnedData);
            int i = returnedData.Tables[0].Rows.Count;

            if (i > 0)
            {
                RegMessage.Text = "UserName " + TxbName.Text + " Already Exists..";
                TxbPassword.Text = "";
                returnedData.Clear();
                return;
            }
            else //new UserName
            {
                userStatus = 1; // new member

                sqlCommand = new SqlCommand("INSERT INTO [User](UserID,Email,Password,UserType,UserName) VALUES('" + strUserID + "','" + email + "','" + password + "','" + userStatus + "','" + userName + "')", databaseConnection);

                databaseConnection.Open();
                sqlCommand.ExecuteNonQuery();

                TxbName.Text = "";
                TxbPassword.Text = "";

                Response.Redirect("../Admin/Users.aspx");
            }
        }
        catch (Exception ex)
        {
            RegMessage.Text = ex.Message;
        }
        finally
        {
            sqlCommand = null;
            databaseConnection.Close();
        }
    }

    protected void BnDelete_Click(object sender, EventArgs e)
    {
        try
        {
            // declare and encrypt string
            string email = aes.Encrypt(TxbDelete.Text.ToLower());


            sqlCommand = new SqlCommand("SELECT * FROM [User] WHERE Email='" + email + "'", databaseConnection);

            dataAdapter = new SqlDataAdapter(sqlCommand);
            dataAdapter.Fill(returnedData);

            int i = returnedData.Tables[0].Rows.Count;
            if (i > 0)
            {
                sqlCommand = new SqlCommand("DELETE FROM [User] WHERE Email='" + email + "'", databaseConnection);

                databaseConnection.Open();
                sqlCommand.ExecuteNonQuery();
            }
            else
            {
                DelMessage.Text = "Email " + TxbDelete.Text + " Does Not Exist";
            }

            returnedData.Clear();
        }
        catch (Exception ex)
        {
            RegMessage.Text = ex.Message;
        }
        finally
        {
            TxbDelete.Text = "";
            sqlCommand = null;
            databaseConnection.Close();
            Response.Redirect("../Admin/Users.aspx");
        }
    }

    private int GenerateID()
    {
        Random rand = new Random();
        return rand.Next(10000000, 100000000);
    }

    protected void Decrypt(object sender, EventArgs e)
    {
        Decrypted.Text = aes.Decrypt(DecryptString.Text);
    }

    protected void Encrypt(object sender, EventArgs e)
    {
        Encrypted.Text = aes.Encrypt(EncryptString.Text);
    }

    protected void SetAdmin(object sender, EventArgs e)
    {
        userStatus = 2;
    }
}