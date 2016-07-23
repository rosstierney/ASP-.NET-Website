<%@ Page Title="" Language="C#" MasterPageFile="~/LoginPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Account_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>G17 &gt;&gt; Welcome</title>
     <link rel="stylesheet" type="text/css" href="../Assets/contentslider.css" />
    <script type="text/javascript" src="../Assets/Scripts/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="../Assets/Scripts/contentslider.js"></script>
</asp:Content>






<asp:Content ID="Content2" ContentPlaceHolderID="MainBlock" runat="Server">
    

    <div id="slider1" class="sliderwrapper">

        <div class="contentdiv">
            <!--INSERT CONTENT 1 HERE-->

            <h2>1/3: SildeShow @4secs >></h2>

            <div style="padding: 10px 0; min-height: 200px">
                <script type="text/javascript" src="../Assets/Scripts/sshow.js"></script>
                    <img src="../Assets/Images/sshow/images (1).jpg" alt="Custom cars" id="slide" />
                <script type="text/javascript" src="../Assets/Scripts/sshow1.js"></script>
            </div>

                <p>Height fixed in css...</p>

            <p>
                Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
                Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.
                - <a href="http://www.google.com">Google something</a> about cars
            </p>

            <a href="javascript:featuredcontentslider.jumpTo('slider1', 2)">Go to second slide</a>

            <!--END CONTENT 1 -->
        </div>


        <div class="contentdiv">
            <!--INSERT CONTENT 2 HERE-->

            <h2>2/3: ScrollBox >></h2>

            <div style="position: relative; width: 100%; height: 250px; border-bottom: solid 1px #000; overflow: hidden">
                <div id="container2" style="position: absolute; left: 0; top: 0">

                    <p>
                        Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
                Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.
                Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. 
                Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. 
                Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum.
                Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima.
                Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.
                    </p>

                    <p>
                        Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
                Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.
                Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. 
                Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. 
                Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum.
                Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima.
                Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.
                    </p>

                    <p>
                        Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
                Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.
                Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. 
                Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. 
                Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum.
                Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima.
                Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.
                - <a href="http://www.google.com">Google something</a> about cars
                    </p>

                </div>
            </div>

            <br />
            <a href="#" onmouseover="move('container2',-5)" onmouseout="clearTimeout(move.to)">
                <img src="../Assets/images/car-icon_1.png"/></a>
            <a href="#" onmouseover="move('container2',5)" onmouseout="clearTimeout(move.to)">
                <img src="../Assets/images/car-icon_0.png"/></a>

            <script type="text/javascript" src="../Assets/Scripts/scrollBox.js"></script>
           
            <br />
            <br />
            <br />
            <p><a href="javascript:featuredcontentslider.jumpTo('slider1', 3)">Go to third slide</a></p>

            <!--END CONTENT 2 -->
        </div>



        <div class="contentdiv">
            <!--INSERT CONTENT 3 HERE-->

            <h2>3/3: flat content >></h2>

            <p>Height set in css...</p>

            <p>
                Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
                Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.
                Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. 
                Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. 
                Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum.
                Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima.
                Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.
                <br />
                <br />
                <a href="javascript:featuredcontentslider.jumpTo('slider1', 1)">Go to first slide</a>
            </p>

            <!--END CONTENT 3 -->
        </div>

    </div>

    <div id="paginate-slider1" class="pagination"></div>
    <script type="text/javascript" src="../Assets/Scripts/SliderContent.js"></script>

</asp:Content>






<asp:Content ID="Content3" ContentPlaceHolderID="RightBlock" runat="Server">
    
    <div class="floatRight" style="width:300px; min-height:250px" >
    <h3>Site Login &gt;&gt;</h3>

    <!-- Login control -->
    <asp:Login ID="SiteLogin" runat="server"
        OnAuthenticate="User_Authenticate"
        DestinationPageUrl="~/Default.aspx"
        Width="300px"
        BackColor="White">

        <LayoutTemplate>

            <!-- Email label (UserName)-->
            <asp:Label
                ID="EmailAddress"
                runat="server"
                AssociatedControlID="UserName"
                Text="Email: "
                CssClass="floatLeft"
                Width="70px"
                Font-Bold="true">
            </asp:Label>

            <asp:TextBox
                ID="UserName"
                runat="server"
                Width="170px"
                TabIndex="0"
                Rows="1"
                TextMode="Email"
                MaxLength="40"
                CssClass="floatRight">
            </asp:TextBox>

            <br />

            <br />
            <asp:Label
                ID="UserPassword"
                runat="server"
                AssociatedControlID="Password"
                Text="Password:"
                CssClass="floatLeft"
                Width="70px"
                Font-Bold="true">
            </asp:Label>

            <!-- Password textbox -->
            <asp:TextBox
                ID="Password"
                runat="server"
                Width="170px"
                Rows="1"
                TextMode="Password"
                TabIndex="1"
                MaxLength="8"
                CssClass="floatRight">
            </asp:TextBox>

            <br />
            <br />
            <br />

            <asp:CheckBox
                ID="RememberMe"
                runat="server"
                Text="&nbsp; Remember me"
                Font-Bold="true"
                CssClass="floatLeft"
                Width="120px"
                Checked="False" />


            <asp:Button
                ID="LoginButton"
                runat="server"
                CommandName="Login"
                Text="Log In"
                ValidationGroup="SiteLogin"
                CssClass="loginBox" />

            <br />
            <br />

            <!-- Email address textbox cannot be blank -->

            <br />

            <asp:RequiredFieldValidator
                ID="EmailValidator"
                runat="server"
                ControlToValidate="UserName"
                ErrorMessage="Email required"
                Text=""
                Display="Dynamic"
                ForeColor="Red"
                Font-Bold="True"
                ValidationGroup="SiteLogin">
            </asp:RequiredFieldValidator>

            <!-- Email must match regular expression -->
            <asp:RegularExpressionValidator
                ID="EmailValidator1"
                runat="server"
                ControlToValidate="UserName"
                Text=""
                ErrorMessage="Email format incorrect"
                Display="Dynamic"
                ForeColor="Red"
                Font-Bold="True"
                ValidationGroup="SiteLogin"
                ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
            </asp:RegularExpressionValidator>
            <!-- regExp also to prevent SQL injection -->

            <br />

            <!-- Password textbox cannot be blank -->
            <asp:RequiredFieldValidator
                ID="PasswordValidator"
                runat="server"
                ControlToValidate="Password"
                ErrorMessage="Password required"
                Text=""
                Display="Dynamic"
                ForeColor="Red"
                Font-Bold="True"
                ValidationGroup="SiteLogin">
            </asp:RequiredFieldValidator>

            <!-- Password must match regular expression -->
            <asp:RegularExpressionValidator
                ID="PasswordValidator1"
                runat="server"
                ControlToValidate="Password"
                Text=""
                ErrorMessage="Passwords must contain at least one upper and one lower case english letter, at least one digit and one special character, and be exactly 8 characters in length, e.g: &nbsp; Zzzzzz1#"
                Display="Dynamic"
                ForeColor="Red"
                Font-Bold="True"
                ValidationExpression="^(?=.*?[A-Z])(?=(.*[a-z]){1,})(?=(.*[\d]){1,})(?=(.*[\W]){1,})(?!.*\s).{8,}$">
            </asp:RegularExpressionValidator>
            <!-- regExp also to prevent SQL injection -->

        </LayoutTemplate>

    </asp:Login>

    <asp:Label
        ID="SubmitMsg"
        runat="server"
        ForeColor="Red"
        Font-Bold="True"
        Text="">
    </asp:Label>
        </div>

        <script type="text/javascript" src="../Assets/Scripts/accordian.js"></script>

    <div class="accordion">

        <h3 class="point">Accordian Text 1 >></h3>
        <p>
            Accordian text Accordian text Accordian text Accordian<br />
            Accordian text Accordian text Accordian text Accordian<br />
            Accordian text Accordian text Accordian text Accordian<br />
        </p>

        <h3 class="point">Click to reveal Accordian Text 2 >></h3>
        <p>
            Accordian text Accordian text Accordian text Accordian<br />
            Accordian text Accordian text Accordian text Accordian<br />
            Accordian text Accordian text Accordian text Accordian<br />
        </p>

        <h3 class="point">Click to reveal Accordian Text 3 >></h3>
        <p>
            Accordian text Accordian text Accordian text Accordian<br />
            Accordian text Accordian text Accordian text Accordian<br />
            Accordian text Accordian text Accordian text Accordian<br />
        </p>

    </div>

</asp:Content>
