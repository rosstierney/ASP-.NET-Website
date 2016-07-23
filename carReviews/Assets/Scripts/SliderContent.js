featuredcontentslider.init({
    id: "slider1",  //id of main slider DIV
    contentsource: ["inline", ""],  //Valid values: ["inline", ""] or ["ajax", "path_to_file"]
    toc: "#increment",  //Valid values: "#increment", "markup", ["label1", "label2", etc]
    nextprev: ["Previous", "Next"],  //labels for "prev" and "next" links. Set to "" to hide.
    revealtype: "click", //Behavior of pagination links to reveal the slides: "click" or "mouseover"
    enablefade: [true, 0.1],  //[true/false, fadedegree]
    autorotate: [false, 10000],  //[true/false, pausetime]
    onChange: function (previndex, curindex, contentdivs) {  //event handler fired whenever script changes slide
        //previndex holds index of last slide viewed b4 current (0=1st slide, 1=2nd etc)
        //curindex holds index of currently shown slide (0=1st slide, 1=2nd etc)
    }
})