using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Security.Cryptography;
using System.IO;
using System.Collections;
using System.Diagnostics;
using System.Linq.Expressions;
using System.Reflection;
using System.ComponentModel;
using System.Collections.Specialized;

// database connection
using System.Data;
using System.Data.SqlClient;


// Don't forget to change the path of the photos in this file to the correct path for your website.

public partial class Account_UploadVehicle : System.Web.UI.Page
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

    private string email;
    private int userID;

    SqlCommand cmd;
    SqlConnection con = new SqlConnection("Data Source=.\\SQLExpress;User Instance=true;Integrated Security=true;AttachDbFilename=|DataDirectory|Database.mdf");
    

    protected void Page_Load(object sender, EventArgs e)
    {
        email = User.Identity.Name;
        Ross();

        if (Session["Updated"] != null)
        lblUpdate.Text = Session["Updated"].ToString();

        if (!IsPostBack)
        {
                txbDateAdded.Text = DateTime.Now.ToShortDateString();
                GridViewBind();
                GridViewBind1();
                ChooseManufacturer();
                ChooseCategory();
                ChooseCountry();
                ChooseWheelSize();
                ChooseWindowTint();
                ChooseFuelType();
                ChooseEngineSize();
            }
        
    }


    protected void GridViewBind()
    {
        try
        {
            con.Open();

            cmd = new SqlCommand("Select * FROM [Vehicle]", con);

            SqlDataReader dr = cmd.ExecuteReader();
            gdvVehicle.DataSource = dr;
            gdvVehicle.DataBind();
            con.Close();
        }
        catch (Exception ex)
        {
            TableMessage.Text = ex.Message;
            return;
        }
        finally
        {
            cmd = null;
            con.Close();
        }
    }
    protected void GridViewBind1()
    {
        try
        {
            con.Open();

            cmd = new SqlCommand("Select * FROM [VehicleModifications]", con);

            SqlDataReader dr = cmd.ExecuteReader();
            gdvVehicleModifications.DataSource = dr;
            gdvVehicleModifications.DataBind();
            con.Close();
        }
        catch (Exception ex)
        {
            TableMessage.Text = ex.Message;
            return;
        }
        finally
        {
            cmd = null;
            con.Close();
        }
    }

    protected void Submit_Click(object sender, EventArgs e)
    {
        btnUpload_Click();

        try
        {
            DataSet ds = new DataSet();

            if (txbVehicleReg.Text == "" || txbValue.Text == ""
                || ddlCountry.SelectedValue == ("-1")
                || ddlCategory.SelectedValue == ("-1")
                || txbModel.Text.Equals("Enter Model"))
            {
                Message.Text = "Please Complete All Fields";
                return;
            }

            /** check whether `Vehicle exists **/
            cmd = new SqlCommand("SELECT * FROM [Vehicle] WHERE VehicleReg='" + txbVehicleReg.Text + "'", con);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            int i = ds.Tables[0].Rows.Count;

            if (i > 0)
            {
                Message.Text = "Vehicle Registration " + txbVehicleReg.Text + " Already Exists..";

                txbVehicleReg.Text = "";
                ds.Clear();
                return;
            }
            else //new Vehicle
            {

                string imagePath = Path.GetFileName(fulVehicleImage.FileName);
                string pathToFiles = "~/Assets/Images/VehiclePics/" + userID + "/" + txbVehicleReg.Text + "/" + imagePath;



                String str = "";
                String str1 = "";
                for (int j = 0; j <= cblMods.Items.Count - 1; j++)
                {
                    if (cblMods.Items[j].Selected)
                    {
                        if (str == "")
                        {
                            str = cblMods.Items[j].Text;
                            str1 = cblMods.Items[j].Text;
                        }
                        else
                        {
                            str += "," + cblMods.Items[j].Text;
                            str1 += "','" + cblMods.Items[j].Text;
                        }

                    }
                    lblStatus.Text = str1;

                }
                con.Open();
                cmd = new SqlCommand("INSERT INTO VehicleModifications(VehicleReg, UserID, EngineSize, FuelType, WheelSize, WindowTint, Description," + str + ")VALUES('" + txbVehicleReg.Text + "','" + userID + "','" + ddlEngineSize.SelectedItem + "','" + ddlFuelType.SelectedItem + "','" + ddlWheelSize.SelectedItem + "','" + ddlWindowTint.SelectedItem + "','" + txbDescription.Text + "','" + str1 + "')", con);
                cmd.ExecuteNonQuery();
                con.Close();


                cmd = new SqlCommand("INSERT INTO [Vehicle] (VehicleReg, UserID, Manufacturer, Model, YearMade, DateAdded, CountryOfOrigin, Category, EstimatedValue, Image) VALUES('" + txbVehicleReg.Text + "','" + userID + "','" + ddlManufacturer.SelectedItem + "','" + txbModel.Text + "','" + ddlYearMade.SelectedItem + "','" + txbDateAdded.Text + "','" + ddlCountry.Text + "','" + ddlCategory.SelectedIndex + "','" + txbValue.Text + "','" + pathToFiles + "')", con);

                lblStatus.Text = "~/Assets/Images/" + userID + "/" + txbVehicleReg.Text + "/" + imagePath;

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();


                /** reload page to update GridViewBind() **/
                //Response.Redirect(Request.RawUrl);
            }
        }
        catch (Exception ex)
        {
            Message.Text = ex.Message;
        }
        finally
        {
            cmd = null;
            con.Close();
        }
    }


    protected void ChooseYear(object sender, EventArgs e)
    {

        int year;

        for (year = DateTime.Now.Year; year >= DateTime.Now.Year - 100; year--)
        {
            ddlYearMade.Items.Add(year.ToString());
        }

    }

    protected void btnUpload_Click()
    {
        if (fulVehicleImage.HasFile)
        {
           if (Convert.ToInt64(fulVehicleImage.PostedFile.ContentLength) < 10000000)
                {

                    // 'C:\Users\Ross\uni\Annette cs4014\carReviews\Assets\Images\VehiclePics\56444455\uuuu666\Favourites.png

                    string fname = fulVehicleImage.FileName;
                    String fpath = Server.MapPath("~"); 
                    fpath += "/Assets/Images/VehiclePics/" + userID + "/" + txbVehicleReg.Text + "/";
                    int flen = fulVehicleImage.PostedFile.ContentLength;
                    string fext = Path.GetExtension(fname);
                    fext = fext.ToLower();
                    string link = "~/pic/" + fname;   //this link will be stored in database
                    if (flen < 1048576)
                    {
                        if (fext == ".jpg" || fext == ".png" || fext == ".gif" || fext == ".bmp")
                        {
                            fulVehicleImage.SaveAs(fpath + fname);
                        }
                        else
                        {
                            Response.Write("<script>alert('Only image files are allowed');</script>");
                        }
                    }


                    lblStatus.Text = "<font color='Green'>File successfully uploaded " + fulVehicleImage.FileName + "</font>";

                }
                else
                    lblStatus.Text = "File must be less than 10MB.";
        }
        else
            lblStatus.Text = "No file selected.";
    }

    protected void DisplayUploadedPhotos(string folder)
    {
        string[] allPhotoFiles = Directory.GetFiles(folder);
        IList<string> allPhotoPaths = new List<string>();
        string fileName;

        foreach (string f in allPhotoFiles)
        {
            fileName = Path.GetFileName(f);
            allPhotoPaths.Add("Images/" + User.Identity.Name + "/" + fileName);

            rptUserPhotos.DataSource = allPhotoPaths;
            rptUserPhotos.DataBind();
        }
    }

    public void SortListItems(ListItemCollection items, bool Descending)
    {
        List<ListItem> list = new List<ListItem>();
        foreach (ListItem i in items)
        {
            list.Add(i);
        }
        if (Descending)
        {
            list.Sort(delegate(ListItem x, ListItem y) { return y.Text.CompareTo(x.Text); });
        }
        else
        {
            list.Sort(delegate(ListItem x, ListItem y) { return x.Text.CompareTo(y.Text); });
        }
        items.Clear();
        items.AddRange(list.ToArray());
    }


    protected void btnDelete_Click(object sender, EventArgs e)
    {
        foreach (RepeaterItem ri in rptUserPhotos.Items)
        {
            CheckBox cb = ri.FindControl("cbDelete") as CheckBox;

            if (cb == null)
            {
                lblStatus.Text = "Checkbox NULL!";
            }
            else
            {
                if (cb.Checked)
                {
                    string fromPhotosToExtension = cb.Attributes["special"];
                    string fromRootToHome = @"C:\Users\Ross\uni\Annette cs4014\carReviews\Assets\";
                    string fileToDelete = Path.Combine(fromRootToHome, fromPhotosToExtension);
                    File.Delete(fileToDelete);

                    lblStatus.Text = "<font color='Green'>Photo(s) successfully deleted.</font>";
                }
            }
        }
    }



    protected void ChooseWindowTint()
    {
        ListItemCollection items = new ListItemCollection();

        items.Add(new ListItem("Very-Light", "0"));
        items.Add(new ListItem("Light", "1"));
        items.Add(new ListItem("Medium", "2"));
        items.Add(new ListItem("Dark", "3"));
        items.Add(new ListItem("Very Dark", "4"));

        // SortListItems(items, false); // true or false based on descending or ascending
        ddlWindowTint.DataSource = items;
        ddlWindowTint.DataBind();
    }

    protected void ChooseWheelSize()
    {
        ListItemCollection items = new ListItemCollection();

        items.Add(new ListItem("10\"", "10"));
        items.Add(new ListItem("11\"", "11"));
        items.Add(new ListItem("12\"", "12"));
        items.Add(new ListItem("13\"", "13"));
        items.Add(new ListItem("14\"", "14"));
        items.Add(new ListItem("15\"", "15"));
        items.Add(new ListItem("16\"", "16"));
        items.Add(new ListItem("17\"", "17"));
        items.Add(new ListItem("18\"", "18"));
        items.Add(new ListItem("19\"", "19"));
        items.Add(new ListItem("20\"", "20"));
        items.Add(new ListItem("21\"", "21"));
        items.Add(new ListItem("22\"", "22"));
        items.Add(new ListItem("23\"", "23"));
        items.Add(new ListItem("24\"", "24"));
        items.Add(new ListItem("25\"", "25"));
        items.Add(new ListItem("26\"", "26"));
        items.Add(new ListItem("27\"", "27"));
        items.Add(new ListItem("28\"", "28"));
        items.Add(new ListItem("29\"", "29"));
        items.Add(new ListItem("30\"", "30"));


        //SortListItems(items, false); // true or false based on descending or ascending
        ddlWheelSize.DataSource = items;
        ddlWheelSize.DataBind();
    }

    protected void ChooseFuelType()
    {
        ListItemCollection items = new ListItemCollection();

        items.Add(new ListItem("Petrol", "0"));
        items.Add(new ListItem("Diesel", "1"));
        items.Add(new ListItem("Hybrid", "2"));
        items.Add(new ListItem("Electric", "3"));
        items.Add(new ListItem("Other", "4"));

        // SortListItems(items, false); // true or false based on descending or ascending
        ddlFuelType.DataSource = items;
        ddlFuelType.DataBind();
    }

    protected void ChooseEngineSize()
    {
        ListItemCollection items = new ListItemCollection();

        items.Add(new ListItem("1.0", "0"));
        items.Add(new ListItem("1.1", "1"));
        items.Add(new ListItem("1.2", "2"));
        items.Add(new ListItem("1.3", "3"));
        items.Add(new ListItem("1.4", "4"));
        items.Add(new ListItem("1.5", "5"));
        items.Add(new ListItem("1.6", "6"));
        items.Add(new ListItem("1.8", "7"));
        items.Add(new ListItem("1.9", "8"));
        items.Add(new ListItem("2.0", "9"));
        items.Add(new ListItem("2.2", "10"));
        items.Add(new ListItem("2.4", "11"));
        items.Add(new ListItem("2.5", "12"));
        items.Add(new ListItem("2.8", "13"));
        items.Add(new ListItem("3.0", "14"));
        items.Add(new ListItem("3.2", "15"));
        items.Add(new ListItem("3.4", "16"));
        items.Add(new ListItem("3.8", "17"));
        items.Add(new ListItem("4.0", "18"));
        items.Add(new ListItem("4.2", "19"));
        items.Add(new ListItem("4.5", "20"));
        items.Add(new ListItem("5.0", "21"));
        items.Add(new ListItem("5.5", "22"));
        items.Add(new ListItem("6.0", "23"));
        items.Add(new ListItem("7.0", "24"));
        items.Add(new ListItem("8.0", "25"));
        items.Add(new ListItem("9.0", "26"));
        items.Add(new ListItem("10.0", "27"));

        //SortListItems(items, false); // true or false based on descending or ascending
        ddlEngineSize.DataSource = items;
        ddlEngineSize.DataBind();
    }

    protected void ChooseCategory()
    {
        ListItemCollection items = new ListItemCollection();

        items.Add(new ListItem("Exotic", "1"));
        items.Add(new ListItem("Tuning", "2"));
        items.Add(new ListItem("Vintage", "3"));
        items.Add(new ListItem("SUV", "4"));

        SortListItems(items, false); // true or false based on descending or ascending
        ddlCategory.DataSource = items;
        ddlCategory.DataBind();

    }

    protected void ChooseCountry()
    {
        ListItemCollection items = new ListItemCollection();

        items.Add(new ListItem("Japan", "0"));
        items.Add(new ListItem("Ireland", "1"));
        items.Add(new ListItem("United Kingdom", "2"));
        items.Add(new ListItem("Germany", "3"));
        items.Add(new ListItem("Japan", "4"));
        items.Add(new ListItem("United States of America", "5"));
        items.Add(new ListItem("France", "6"));
        items.Add(new ListItem("Italy", "7"));
        items.Add(new ListItem("Holland", "8"));
        items.Add(new ListItem("Sweden", "9"));
        items.Add(new ListItem("Slovakia", "10"));
        items.Add(new ListItem("Australia", "11"));
        items.Add(new ListItem("North Korea", "12"));
        items.Add(new ListItem("China", "13"));
        items.Add(new ListItem("Thailand", "14"));
        items.Add(new ListItem("Spain", "15"));
        items.Add(new ListItem("Czech Republic", "16"));
        items.Add(new ListItem("Portugal", "17"));
        items.Add(new ListItem("Romania", "18"));
        items.Add(new ListItem("Russia", "19"));
        items.Add(new ListItem("India", "20"));
        items.Add(new ListItem("Brazil", "21"));
        items.Add(new ListItem("Mexico", "22"));
        items.Add(new ListItem("Canada", "23"));
        items.Add(new ListItem("Turkey", "24"));
        items.Add(new ListItem("Switzerland", "25"));
        items.Add(new ListItem("Belgium", "26"));
        items.Add(new ListItem("South Africa", "27"));
        items.Add(new ListItem("Argentina", "28"));
        items.Add(new ListItem("Hungary", "29"));
        items.Add(new ListItem("Taiwan", "30"));

        SortListItems(items, false); // true or false based on descending or ascending
        ddlCountry.DataSource = items;
        ddlCountry.DataBind();

    }


    protected void ChooseManufacturer()
    {
        ListItemCollection items = new ListItemCollection();

        items.Add(new ListItem("Chevrolet", "0"));
        items.Add(new ListItem("Toyota", "1"));
        items.Add(new ListItem("Honda", "2"));
        items.Add(new ListItem("BMW", "3"));
        items.Add(new ListItem("Aston Martin", "4"));
        items.Add(new ListItem("Cadillac", "5"));
        items.Add(new ListItem("Mercedes-Benz", "6"));
        items.Add(new ListItem("SEAT", "7"));
        items.Add(new ListItem("Mini", "8"));
        items.Add(new ListItem("Lexus", "9"));
        items.Add(new ListItem("Ferrari", "10"));
        items.Add(new ListItem("Bugatti", "11"));
        items.Add(new ListItem("Bentley", "12"));
        items.Add(new ListItem("Ford", "13"));
        items.Add(new ListItem("Mitsubishi", "14"));
        items.Add(new ListItem("Alfa Romeo", "15"));
        items.Add(new ListItem("Hummer", "16"));
        items.Add(new ListItem("Opel", "17"));
        items.Add(new ListItem("Peugeot", "18"));
        items.Add(new ListItem("Citroen", "19"));
        items.Add(new ListItem("Hyundai", "20"));
        items.Add(new ListItem("Jaguar", "21"));
        items.Add(new ListItem("Jeep", "22"));
        items.Add(new ListItem("KIA", "23"));
        items.Add(new ListItem("Land Rover", "24"));
        items.Add(new ListItem("Lambourghini", "25"));
        items.Add(new ListItem("Audi", "26"));
        items.Add(new ListItem("Nissan", "27"));
        items.Add(new ListItem("Subaru", "28"));
        items.Add(new ListItem("Saab", "29"));
        items.Add(new ListItem("Skoda", "30"));
        items.Add(new ListItem("Volvo", "31"));
        items.Add(new ListItem("Mazda", "32"));
        items.Add(new ListItem("Renault", "33"));
        items.Add(new ListItem("Rover", "34"));
        items.Add(new ListItem("Porsche", "35"));
        items.Add(new ListItem("{Make Unknown}", "36"));


        SortListItems(items, false); // true or false based on descending or ascending
        ddlManufacturer.DataSource = items;
        ddlManufacturer.DataBind();

    }

    protected void btnDeleteVehicle_Click(object sender, EventArgs e)
    {

        try
        {
            DataSet ds = new DataSet();

            if (txbDeleteV.Text == "")
            {
                lblStatus.Text = "Please Enter a Vehicle registration";
                return;
            }

            cmd = new SqlCommand("SELECT * FROM [Vehicle] WHERE VehicleReg='" + txbDeleteV.Text + "'", con);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);

            int i = ds.Tables[0].Rows.Count;

            if (i > 0)
            {
                cmd = new SqlCommand("DELETE FROM [Vehicle] WHERE VehicleReg='" + txbDeleteV.Text + "' AND UserID =  '" + userID + "' ", con);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                lblStatus.Text = "Vehicle Deleted.";

                cmd = new SqlCommand("DELETE FROM [VehicleModifications] WHERE VehicleReg='" + txbDeleteV.Text + "' AND UserID =  '" + userID + "' ", con);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                lblStatus.Text = "Vehicle Deleted.";


                /** reload page to update GridViewBind() **/
                txbDeleteV.Text = "";
                ds.Clear();
                Response.Redirect(Request.RawUrl);
            }

            cmd = new SqlCommand("SELECT * FROM [VehicleModifications] WHERE VehicleReg='" + txbDeleteV.Text + "'", con);

            SqlDataAdapter db = new SqlDataAdapter(cmd);
            db.Fill(ds);

            int j = ds.Tables[0].Rows.Count;

            if (j > 0)
            {
                cmd = new SqlCommand("DELETE FROM [VehicleModifications] WHERE VehicleReg='" + txbDeleteV.Text + "'", con);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                lblStatus.Text = "Mods Deleted.";

                /** reload page to update GridViewBind() **/
                txbDeleteV.Text = "";
                ds.Clear();
                Response.Redirect(Request.RawUrl);

            }
            else
            {
                txbDeleteV.Text = "Vehicle Registration " + txbDeleteV.Text + " Does Not Exist";
                txbDeleteV.Text = "";
                ds.Clear();
                return;
            }
        }
        catch (Exception ex)
        {
            lblStatus.Text = ex.Message;
        }
        finally
        {
            cmd = null;
            con.Close();
        }
    }

    protected void ButtonRun_Click(object sender, EventArgs e)
    {
        txbValue.Text = "<script type='text/javascript'>showValue(num)</script>";
    }

    protected void btnUpdateVehicle_Click(object sender, EventArgs e)
    {

        if (IsPostBack)
        {
            try
            {
                DataSet ds = new DataSet();

                if (txbUpdateVehicle.Text == "")
                {
                    lblStatus.Text = "Please Enter a Vehicle registration";
                    return;
                }

                if (ddlEngineSize.SelectedValue.Equals("-1"))
                {
                    lblUpdate.Text = "<br>Please Choose a Engine Size";
                    return;
                }
                if (ddlWindowTint.SelectedValue.Equals("-1"))
                {
                    lblUpdate.Text = "<br>Please Choose a Window Tint";
                    return;
                }
                if (ddlWheelSize.SelectedValue.Equals("-1"))
                {
                    lblUpdate.Text = "<br>Please Choose a Wheel Size";
                    return;
                }
                if (ddlFuelType.SelectedValue.Equals("-1"))
                {
                    lblUpdate.Text = "<br>Please Choose a Fuel Type";
                    return;
                }


                cmd = new SqlCommand("SELECT * FROM [Vehicle] WHERE VehicleReg='" + txbUpdateVehicle.Text + "' AND UserID='" + userID + "'", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);



                cmd = new SqlCommand("SELECT * FROM [VehicleModifications] WHERE VehicleReg='" + txbUpdateVehicle.Text + "'", con);

                SqlDataAdapter db = new SqlDataAdapter(cmd);
                db.Fill(ds);



                int j = ds.Tables[0].Rows.Count;

                if (j > 0)
                {

                    UpdateSQL();

                }
                else
                {
                    txbUpdateVehicle.Text = "Vehicle Registration " + txbUpdateVehicle.Text + " Does Not Exist";
                    txbUpdateVehicle.Text = "";
                    ds.Clear();
                    return;
                }
            }
            catch (Exception ex)
            {
                lblUpdate.Text = ex.Message;
            }
            finally
            {
                cmd = null;
                con.Close();
            }
        }
    }

    protected void Ross()
    {
        // connect to the database
        databaseConnection.Open();

        // encrypt
        email = aes.Encrypt(email);

        // SQL command to retrieve : encrypted email address
        sqlCommand = new SqlCommand("SELECT * FROM [User] WHERE Email='" + email + "'", databaseConnection);

        // run the SQL throught an adapter
        dataAdapter = new SqlDataAdapter(sqlCommand);

        // use the adapter to fill the DataSet
        dataAdapter.Fill(returnedData);

        // i = the number of rows of data (0 or 1)
        int i = returnedData.Tables[0].Rows.Count;

        if (i == 1) // email found
        {
            // do something
            userID = Convert.ToInt32(aes.Decrypt(returnedData.Tables[0].Rows[0][0].ToString()));
        }
    }
   
    private void UpdateSQL()
    {
        con.Open();
        
        cmd = new SqlCommand("UPDATE [VehicleModifications] SET WindowTint='" + ddlWindowTint.SelectedValue + "'WHERE VehicleReg ='" + txbUpdateVehicle.Text + "'", con);
      
        cmd.ExecuteNonQuery();

        cmd = new SqlCommand("UPDATE [VehicleModifications] SET EngineSize='" + ddlEngineSize.SelectedValue + "'WHERE VehicleReg ='" + txbUpdateVehicle.Text + "'", con);

        cmd.ExecuteNonQuery();

        cmd = new SqlCommand("UPDATE [VehicleModifications] SET WheelSize='" + ddlWheelSize.SelectedValue + "'WHERE VehicleReg ='" + txbUpdateVehicle.Text + "'", con);

        cmd.ExecuteNonQuery();

        cmd = new SqlCommand("UPDATE [VehicleModifications] SET FuelType='" + ddlFuelType.SelectedValue + "'WHERE VehicleReg ='" + txbUpdateVehicle.Text + "'", con);

        cmd.ExecuteNonQuery();

        cmd = new SqlCommand("UPDATE [VehicleModifications] SET Description='" + txbDescription.Text + "'WHERE VehicleReg ='" + txbUpdateVehicle.Text + "'", con);

        cmd.ExecuteNonQuery();

        String str = "";

        for (int j = 0; j <= cblMods.Items.Count - 1; j++)
        {
            // ticked items
            if (cblMods.Items[j].Selected)
            {
                if (j == cblMods.Items.Count - 1) 
                    str += cblMods.Items[j].Text + "='" + cblMods.Items[j].Text + "'"; 
                else 
                str += cblMods.Items[j].Text + "='" + cblMods.Items[j].Text + "',"; 

            }
            else
            {
                // unticked items
                if (j == cblMods.Items.Count - 1)
                    str += cblMods.Items[j].Text + "=' '";
                else
                    str += cblMods.Items[j].Text + "=' ',";
            }
            
        }


        string sqlString =

            "UPDATE [VehicleModifications] SET " + str + " WHERE VehicleReg ='" + txbUpdateVehicle.Text + "'";

    
        cmd = new SqlCommand(sqlString, con);     
        cmd.ExecuteNonQuery();
        con.Close();

        Session["Updated"] = "Vehicle Updated";

        Response.Redirect("~/Account/UploadVehicle.aspx");
    }

}