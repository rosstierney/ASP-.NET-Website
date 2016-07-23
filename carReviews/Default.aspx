<%@ Page Title="" Language="C#" MasterPageFile="~/UserPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>G17 &gt;&gt; HomePage</title>
    <link rel="stylesheet" type="text/css" href="~/Assets/contentslider.css" />
    <script type="text/javascript" src="~/Assets/Scripts/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="~/Assets/Scripts/contentslider.js"></script>
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="MainBlock" runat="Server">

    <div id="slider1" class="sliderwrapper">

        <div class="contentdiv">
            <!--INSERT CONTENT 1 HERE-->

            <h2>1/3: SildeShow @4secs >></h2>

            <div style="padding: 10px 0; min-height: 200px">
                <script type="text/javascript" src="~/Assets/Scripts/sshow.js"></script>
                    <img src="Assets/Images/sshow/images (1).jpg" alt="Custom cars" id="slide" />
                <script type="text/javascript" src="~/Assets/Scripts/sshow1.js"></script>
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

    <script type="text/javascript" src="../Assets/Scripts/accordian.js"></script>

    <div class="accordion">

        <h3 class="point">Click to reveal accordian text 1 >></h3>
        <p>
            Accordian text Accordian text Accordian text Accordian text<br />
            Accordian text Accordian text Accordian text Accordian text<br />
            Accordian text Accordian text Accordian text Accordian text<br />
        </p>

        <h3 class="point">Click to reveal accordian text 2 >></h3>
        <p>
            Accordian text Accordian text Accordian text Accordian text<br />
            Accordian text Accordian text Accordian text Accordian text<br />
            Accordian text Accordian text Accordian text Accordian text<br />
        </p>

        <h3 class="point">Click to reveal accordian text 3 >></h3>
        <p>
            Accordian text Accordian text Accordian text Accordian text<br />
            Accordian text Accordian text Accordian text Accordian text<br />
            Accordian text Accordian text Accordian text Accordian text<br />
        </p>
    </div>

</asp:Content>

