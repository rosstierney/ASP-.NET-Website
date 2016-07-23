<%@ Page Title="" Language="C#" MasterPageFile="~/UserPage.master" AutoEventWireup="true" CodeFile="UploadVehicle.aspx.cs" Inherits="Account_UploadVehicle" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <title>G17 &gt;&gt; Upload Vehicle</title>

</asp:Content>





<asp:Content ID="Content2" ContentPlaceHolderID="MainBlock" runat="Server">

    <div>
        <h3>Enter Vehicle Details</h3>
     
    <asp:TextBox ID="txbVehicleReg" placeholder="Enter Registration"  runat="server"></asp:TextBox>
 
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     
    <br />
    <br />

    <div style="float:inherit" >

        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
        <asp:DropDownList AppendDataBoundItems="true" width="135px" ID="ddlCategory" runat="server" >
        <asp:ListItem Text="<Select Category>" Value="-1"/>
            </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txbModel" runat="server" placeholder="Enter Model" />
        <br />
        
        <br />
            <asp:DropDownList AppendDataBoundItems="true" width="135px" ID="ddlManufacturer"  runat="server">
            <asp:ListItem Text="<Select Make>" Value="-1"/>
            </asp:DropDownList>



            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <asp:DropDownList AppendDataBoundItems="true" width="135px" ID="ddlCountry" runat="server"  >
                <asp:ListItem Text="<Select Country>" Value="-1"/>
            </asp:DropDownList>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        <asp:TextBox id= "txbValue" runat="server" placeholder ="Vehicle Value"> </asp:TextBox>

        <br />
        <br />
       <!--  <div runat="server">

           
               <input type="range" id="rangeInput" name="rangeInput" min="1000" max="100000" value="0"
                oninput="amount.value=rangeInput.value" />                                                       
       
            <output id="amount" onchange="Slider" for="amount.value=rangeInput.value" name="amount" />
            
            <asp:Button ID="btnRun" runat="server" Text="Run JavaScript Code" OnClick="ButtonRun_Click" /> 
            <asp:Label ID="Label1" runat="server"></asp:Label> 
            
            
            <script type="text/javascript">
                function showValue(num) {
                    var result = document.getElementById('result');
                    result.innerHTML = num;
                }
             </script>

        </div>-->

     </div>
    <br />
    <div>
        <strong>Date Added&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            Select Year Made</strong><br /><asp:TextBox ID="txbDateAdded" runat="server" Width="75px" ></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="ddlYearMade" Width="75px" runat="server" 
        DataSourceID="SqlDataSource1"  DataTextField="CategoryName" 
        DataValueField="CategoryID" OnDataBound="ChooseYear" />
    
    </div>
        <strong>Choose Image</strong><br />
        <asp:FileUpload Text="Choose Image" ID="fulVehicleImage" runat="server" />
    <br />
    <br />
    <br />
        <asp:Label runat="server" ID="lblStatus" style ="color:red" />
    <br />
    <br />     
    <br />

        <asp:Repeater ID="rptUserPhotos" runat="server">
        <ItemTemplate>
            <span style="float: left; padding: 15px; ">

            <a rel="example_group" href="<%# Container.DataItem %>" title="">
            <asp:ImageButton ImageUrl="<%# Container.DataItem %>" ID="imgUserPhoto" style="width: 100px; height: 100px;" runat="server" alt="" /><br />
            </a>
            
            <asp:CheckBox special="<%# Container.DataItem %>" ID="cbDelete" Text="Delete" runat="server" /><br />
            </span>
        </ItemTemplate>
    </asp:Repeater>
        </div>
    <br /><br />
    <br /><br />
    <br /><br />
    <br /><br />
    <br />
    <div>
        <asp:Button ID="btnDelete" Text="Delete" runat="server" Visible="false" OnClick="btnDelete_Click" /><br />
    <br />
    <br />
    </div>
        <asp:Label
            ID="Message"
            runat="server"
            Font-Bold="true">
        </asp:Label>
    <br />
     
    
    <h3>Contents &gt;&gt; dbo.Vehicle / DataBase.mdf</h3>
    <asp:GridView ID="gdvVehicle" runat="server"
        BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px"
        CellPadding="3" Style="text-align: left; margin: 10px 0 10px 10px" Width="350px" BackColor="White" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="#FFFFFF" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>

        <h3>Contents &gt;&gt; dbo.VehicleModifications / DataBase.mdf</h3>
    <asp:GridView ID="gdvVehicleModifications" runat="server"
        BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px"
        CellPadding="3" Style="text-align: left; margin: 10px 0 10px 10px" Width="350px" BackColor="White" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="#FFFFFF" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
    <asp:Label ID="TableMessage" runat="server" CssClass="warning" Text=""></asp:Label>


</asp:Content>






<asp:Content ID="Content3" ContentPlaceHolderID="RightBlock" runat="Server">

    <div >
        <h3>Select Modified Parts</h3>
             <div style="float:right">
                 
        <asp:CheckBoxList ID="cblMods" runat="server" >
        <asp:ListItem>Turbo</asp:ListItem>      
        <asp:ListItem>Nitrous</asp:ListItem>
        <asp:ListItem>Spoiler</asp:ListItem>
        <asp:ListItem>Exhaust</asp:ListItem>
        <asp:ListItem>Suspension</asp:ListItem>
        </asp:CheckBoxList> 
         
                 </div >
         <div style="float:left">
        <asp:DropDownList ID="ddlWindowTint" runat="server" AppendDataBoundItems="true" width="135px">
             <asp:ListItem Text="&lt;Window Tint&gt;" Value="-1" />
         </asp:DropDownList>
         <br />
             <br />
             
         <asp:DropDownList ID="ddlEngineSize" runat="server" AppendDataBoundItems="true" width="135px">
             <asp:ListItem Text="&lt;Engine Size&gt;" Value="-1" />
         </asp:DropDownList>
         <br />
             <br />
             
         <asp:DropDownList ID="ddlWheelSize" runat="server" AppendDataBoundItems="true" width="135px">
             <asp:ListItem Text="&lt;Wheel Size&gt;" Value="-1" />
         </asp:DropDownList>
         <br />
             <br />
             
         <asp:DropDownList ID="ddlFuelType" runat="server" AppendDataBoundItems="true" width="135px">
             <asp:ListItem Text="&lt;Fuel Type&gt;" Value="-1" />
         </asp:DropDownList>
         <br />
             </div>
        </div>
    <asp:TextBox ID="txbDescription" placeholder="Enter description of the Vehicle...." runat="server" Height="46px" Width="314px"></asp:TextBox>
     <br />
    <br />
        <asp:Button Text="Upload Vehicle" OnClick="Submit_Click" runat="server"/>
    <br />
    <br />
    

   <div style ="border: 2px">
        <h3>Enter registration of the Vehicle you wish to delete</h3>
    <asp:TextBox ID="txbDeleteV" placeholder="Enter Registration.."  runat="server"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnDeleteVehicle" Text="Delete Vehicle"  runat="server" OnClick="btnDeleteVehicle_Click" />
    <br />
        </div>
   <br />
    <br />
    <div style ="border: 2px">
        <h3>Update a Vehicle</h3>
    <asp:TextBox ID="txbUpdateVehicle" placeholder="Enter Registration.."  runat="server"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnUpdate" Text="Update Vehicle"  runat="server" OnClick="btnUpdateVehicle_Click" />
    <br />
        </div>
    <br />
    <asp:Label runat="server" id="lblUpdate" style="color:red;" > </asp:Label>
    <br />

</asp:Content>
