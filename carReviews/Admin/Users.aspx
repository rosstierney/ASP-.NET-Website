<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPageWide.master" AutoEventWireup="true" CodeFile="Users.aspx.cs" Inherits="Admin_Users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LargeBlock" runat="Server">

    <div>

        <h3>Admin &gt;&gt; dbo.User / DataBase.mdf &gt;&gt;</h3>


        <asp:GridView
            ID="UsersTableView"
            runat="server"
            BorderColor="#999999"
            BorderStyle="Solid"
            BorderWidth="1px"
            CellPadding="3"
            Style="text-align: left; margin: 10px"
            Width="350px"
            BackColor="White"
            ForeColor="Black"
            GridLines="Vertical">

            <AlternatingRowStyle BackColor="#CCCCCC" />
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" Font-Size="Small" ForeColor="#FFFFFF" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />

        </asp:GridView>

        <asp:Label ID="TableMessage" runat="server" CssClass="warning" Text=""></asp:Label>
    
    </div>

    <div style="width: 900px">

        <br />
        <br />
        <hr />
        <br />
        <br />

        <div class="floatLeft" style="width: 40%">

            <h3>Register User &gt;&gt;</h3>

            <asp:Label ID="RegName" runat="server" Text="Email: " Width="125px"></asp:Label>
            <asp:TextBox ID="TxbName" runat="server" Width="150px"></asp:TextBox>
            <br />
            <asp:Label ID="NickName_" runat="server" Text="NickName: " Width="125px"></asp:Label>
            <asp:TextBox ID="NickName" runat="server" Width="150px"></asp:TextBox>
            <br />
            <asp:Label ID="Password_" runat="server" Text="Password: " Width="125px"></asp:Label>
            <asp:TextBox ID="TxbPassword" runat="server" Width="150px"></asp:TextBox>
            <br />
            <br />
            <asp:CheckBox ID="Admin" CssClass="floatLeft" runat="server" Text=" Admin" OnCheckedChanged="SetAdmin" />
            <asp:Button CssClass="floatRight" ID="BnRegister" runat="server" Text="Register" OnClick="BnRegister_Click" />
            <br />
            <br />
            <asp:Label ID="RegMessage" Font-Bold="true" ForeColor="Red" runat="server" Text=""></asp:Label>
        </div>


        <div class="floatRight" style="width: 40%">

            <h3>Delete User &gt;&gt;</h3>

            <asp:Label ID="DelName" runat="server" Text="Email: " Width="120px"></asp:Label>
            <asp:TextBox ID="TxbDelete" runat="server" Width="150px"></asp:TextBox><br />

            <br />
            <br />
            <br />
            <br />
            <br />
            <br />

            <asp:Button CssClass="floatRight" ID="BnDelete" runat="server" Text="Delete" OnClick="BnDelete_Click" />
            <br />
            <br />
            <asp:Label ID="DelMessage" Font-Bold="true" ForeColor="Red" runat="server" Text=""></asp:Label>

        </div>

        <hr style="clear: both;" />

    </div>

    <div style="width: 100%; clear: both; float: left;">

        <div style="width: 60%">

            <h3>Decrypt String&nbsp; &gt;&gt;</h3>

            <asp:Label ID="DecryptStr" runat="server" Text="Encrypted String: " Width="120px"></asp:Label>
            <asp:TextBox ID="DecryptString" runat="server" Width="450px"></asp:TextBox>
            <br />
            <br />
            <asp:Button CssClass="floatRight" ID="BnDecrypt" runat="server" Text="Decrypt" OnClick="Decrypt" />

            <br />
            <br />
            <asp:Label ID="Decrypted" Font-Bold="true" ForeColor="Red" runat="server" Text=""></asp:Label>
            <br />
            <br />

        </div>


        <div class="floatLeft" style="width: 60%">

            <hr />

            <h3>Encrypt String&nbsp; &gt;&gt;</h3>
            <asp:Label ID="EncryptStr" runat="server" Text="Literal String: " Width="120px"></asp:Label>
            <asp:TextBox ID="EncryptString" runat="server" Width="450px"></asp:TextBox>
            <br />
            <br />
            <asp:Button CssClass="floatRight" ID="Enctypt" runat="server" Text="Encrypt" OnClick="Encrypt" />

            <br />
            <br />
            <asp:Label ID="Encrypted" Font-Bold="true" ForeColor="Red" runat="server" Text=""></asp:Label>
            <br />
            <br />

        </div>
    </div>

</asp:Content>
